import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:respira_mobile/features/authentication/providers/session_provider.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/utils/list_extensions.dart';
import '../../patient/models/patient_dtos.dart';
import '../../patient/models/patient.dart';
import '../../patient/providers/active_patient_provider.dart';
import '../../patient/providers/current_patient_provider.dart';
import '../../patient/services/patient_service.dart';
import '../models/clinical_dtos.dart';
import '../services/clinical_service.dart';
import 'diagnosis_controller.dart';

part 'diagnosis_flow_provider.freezed.dart';
part 'diagnosis_flow_provider.g.dart';

/// Immutable snapshot of everything the empirical wizard needs to call
/// `POST /diagnose/empirical`.
@freezed
class DiagnosisFlowState with _$DiagnosisFlowState {
  const factory DiagnosisFlowState({
    /// Selected disease (currently the first from `/diseases/list`).
    DiseaseItemDto? disease,

    /// Real criteria loaded from `GET /diseases/{id}/criteria`.
    @Default(DiseaseCriteriaDto()) DiseaseCriteriaDto criteria,

    /// Result of `POST /diagnose/empirical` (rendered on the result tab).
    EmpiricalDiagnoseResultDto? empiricalResult,

    /// Set right after a successful treatment create.
    @Default(false) bool saved,
    String? errorMessage,
  }) = _DiagnosisFlowState;
}

/// Orchestrates the API-backed diagnosis flow: disease + criteria
/// loading, empirical diagnosis, treatment persistence.
@Riverpod(keepAlive: true)
class DiagnosisFlowController extends _$DiagnosisFlowController {
  ClinicalService get _clinical =>
      ClinicalService(ref.watch(apiClientProvider));
  PatientService get _patientService =>
      PatientService(ref.watch(apiClientProvider));

  @override
  DiagnosisFlowState build() => const DiagnosisFlowState();

  /// Loads the disease catalog + the first disease's criteria.
  /// Best-effort: keeps demo defaults when the API is unreachable.
  Future<void> loadDiseaseContext() async {
    try {
      final diseases = await _clinical.getDiseases();
      if (diseases.isEmpty) return;
      final disease = diseases.first;
      final criteria = await _clinical.getDiseaseCriteria(disease.id);
      state = state.copyWith(disease: disease, criteria: criteria);
    } on Exception catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  /// Calls `POST /diagnose/empirical` with all wizard inputs.
  Future<void> runEmpiricalDiagnosis() async {
    final patient = ref.read(currentPatientProvider);
    final inputs = ref.read(diagnosisCriteriaControllerProvider);

    double parseOr(String raw, double fallback) =>
        double.tryParse(raw.trim().replaceAll(',', '.')) ?? fallback;
    int parseIntOr(String raw, int fallback) =>
        int.tryParse(raw.trim()) ?? fallback;

    final heightMeters = (parseOr(inputs.heightCm, 1.70)) / 100;
    final weight = parseOr(inputs.weightKg, 60);
    final creatinine = parseOr(inputs.serumCreatinine, 80);

    final dobParts = patient.dob.split('/');
    final dobIso = dobParts.length == 3
        ? '${dobParts[2]}-${dobParts[1].padLeft(2, '0')}-${dobParts[0].padLeft(2, '0')}'
        : patient.dob;

    try {
      final result = await _clinical.diagnoseEmpirical(
        EmpiricalDiagnoseRequest(
          diseaseId: state.disease?.id ?? 'disease-1',
          dateOfBirth: dobIso,
          isMale: patient.gender == Gender.nam,
          weight: weight,
          height: heightMeters,
          serumCreatine: creatinine,
          confusion: inputs.confusion,
          urea: double.tryParse(inputs.urea.replaceAll(',', '.')),
          respiratory: parseIntOr(inputs.respRate, 0),
          systolicBloodPressure: parseOr(inputs.sbp, 0),
          diastolicBloodPressure: parseOr(inputs.dbp, 0),
          icuHospitalizeCriteria: inputs.selectedIcuCriteriaIds.toList(),
          resistanceRiskFactors: inputs.selectedResistanceRiskIds.toList(),
          otherCriteria: inputs.selectedOtherCriteriaIds.toList(),
        ),
      );
      state = state.copyWith(empiricalResult: result, errorMessage: null);
    } on ApiException catch (e) {
      state = state.copyWith(errorMessage: e.message);
    } on DioException {
      state = state.copyWith(errorMessage: 'Không thể kết nối máy chủ.');
    }
  }

  /// Persists the empirical treatment via
  /// `POST /patients/{id}/treatments` and flags completion.
  Future<bool> saveEmpiricalTreatment() async {
    final patient = ref.read(activePatientControllerProvider);
    final result = state.empiricalResult;
    if (result == null) return false;

    final doctor = ref.read(sessionControllerProvider);
    final medicines = result.recommendations
        .map((m) => MedicineRecordDto(
              id: m.id,
              name: m.name,
              classification: m.classification,
              routeOfAdministration:
                  m.dosages.firstOrNull?.routeOfAdministration ?? 'Oral',
              dose: m.dosages.firstOrNull?.dose ?? '',
            ).toJson())
        .toList();

    try {
      await _patientService.createTreatment(
        patient.id,
        CreateTreatmentRequest(
          doctorId: doctor?.id ?? '',
          treatmentType: 'EmpiricalTherapy',
          crcl: result.crcl,
          systemRecommendedMedicines: medicines,
          doctorChosenMedicines: medicines,
          severity: result.severity,
          treatmentSite: result.treatmentSite,
          infectionProbabilityRecords: result.infectionProbabilities
              .map((p) => {
                    'pathogenId': p.pathogenId,
                    'pathogenName': p.pathogenName,
                    'probability': p.probability,
                  })
              .toList(),
        ),
      );
      state = state.copyWith(saved: true, errorMessage: null);
      return true;
    } on ApiException catch (e) {
      state = state.copyWith(errorMessage: e.message);
      return false;
    } on DioException {
      state = state.copyWith(errorMessage: 'Không thể kết nối máy chủ.');
      return false;
    }
  }
}

