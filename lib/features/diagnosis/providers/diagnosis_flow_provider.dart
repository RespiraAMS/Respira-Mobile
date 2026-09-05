import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
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
    } catch (e) {
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
    } on DioException catch (e) {
      state = state.copyWith(errorMessage: apiErrorMessage(e));
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  /// Persists the empirical treatment via
  /// `POST /patients/{id}/treatments` and flags completion.
  ///
  /// The backend (`CreateTreatmentValidator`) requires identical
  /// medicine lists to carry a null `ReasonForDifferentChoice`; the
  /// `pathogen` record must carry the real pathogen GUID from the
  /// diagnose response — an empty id fails JSON binding server-side.
  Future<bool> saveEmpiricalTreatment() async {
    final patient = ref.read(activePatientControllerProvider);
    final result = state.empiricalResult;
    if (result == null) return false;

    if (patient.id.isEmpty) {
      state = state.copyWith(
        errorMessage: 'Vui lòng chọn hoặc tạo bệnh nhân trước khi lưu.',
      );
      return false;
    }

    // Only medicines with an adjusted dosage can be persisted — the
    // backend rejects records with an empty route or dose.
    final medicines = result.medicines
        .where((m) => m.dosages.isNotEmpty)
        .map((m) => MedicineRecordDto(
              id: m.id,
              name: m.name,
              classification: m.classification,
              routeOfAdministration: m.dosages.first.routeOfAdministration,
              dose: m.dosages.first.dose,
            ).toJson())
        .toList();

    if (medicines.isEmpty) {
      state = state.copyWith(
        errorMessage: 'Không có thuốc phù hợp với CrCl của bệnh nhân.',
      );
      return false;
    }

    // Only pathogens with a real id can be validated server-side; drop
    // malformed entries instead of failing the whole save.
    final infectionRecords = result.infectionProbabilities
        .where((p) => p.pathogenId.isNotEmpty)
        .map((p) => {
              'pathogen': {'id': p.pathogenId, 'name': p.pathogenName},
              'probability': p.probability,
            })
        .toList();

    try {
      await _patientService.createTreatment(
        patient.id,
        CreateTreatmentRequest(
          treatmentType: 'EmpiricalTherapy',
          crcl: result.crcl,
          systemRecommendedMedicines: medicines,
          doctorChosenMedicines: medicines,
          severity: result.severity,
          treatmentSite: result.treatmentSite,
          infectionProbabilityRecords: infectionRecords,
        ),
      );
      state = state.copyWith(saved: true, errorMessage: null);
      return true;
    } on ApiException catch (e) {
      state = state.copyWith(errorMessage: e.message);
      return false;
    } on DioException catch (e) {
      state = state.copyWith(errorMessage: apiErrorMessage(e));
      return false;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }
}

