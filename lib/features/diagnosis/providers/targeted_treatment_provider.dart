import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_response.dart';
import '../../patient/models/patient.dart';
import '../../patient/models/patient_dtos.dart';
import '../../patient/providers/active_patient_provider.dart';
import '../../patient/providers/current_patient_provider.dart';
import '../../patient/services/patient_service.dart';
import '../models/clinical_dtos.dart';
import '../services/clinical_service.dart';

part 'targeted_treatment_provider.g.dart';

/// Real pathogen list from `GET /pathogens/list`.
@Riverpod(keepAlive: true)
Future<List<PathogenItemDto>> pathogenList(PathogenListRef ref) async {
  final service = ClinicalService(ref.watch(apiClientProvider));
  return service.getPathogens();
}

/// Real targeted diagnosis from `POST /diagnose/target` for the given
/// pathogen, using the active patient's demographics.
@Riverpod(keepAlive: true)
Future<TargetedDiagnoseResultDto> targetedDiagnoseResult(
  TargetedDiagnoseResultRef ref,
  String pathogenId,
) async {
  final service = ClinicalService(ref.watch(apiClientProvider));
  final patient = ref.watch(currentPatientProvider);

  final dobParts = patient.dob.split('/');
  final dobIso = dobParts.length == 3
      ? '${dobParts[2]}-${dobParts[1].padLeft(2, '0')}-${dobParts[0].padLeft(2, '0')}'
      : patient.dob;

  return service.diagnoseTargeted(TargetedDiagnoseRequest(
    pathogenId: pathogenId,
    dateOfBirth: dobIso,
    isMale: patient.gender == Gender.nam,
    weight: 60,
    height: 1.70,
    serumCreatine: 80,
  ));
}

/// Selected antibiotic IDs of the targeted-treatment screen.
@riverpod
class TargetedSelectionController extends _$TargetedSelectionController {
  @override
  Set<String> build() => {};

  void toggle(String optionId) {
    final next = {...state};
    if (!next.remove(optionId)) {
      next.add(optionId);
    }
    state = next;
  }
}

/// Persists the targeted treatment via
/// `POST /patients/{id}/treatments` (TargetedTherapy). The doctor
/// identity comes from the gateway-injected `X-ID` header.
Future<bool> saveTargetedTreatment(
  dynamic ref, {
  required String pathogenId,
  required String pathogenName,
  required double crcl,
  required List<MedicineRecordDto> medicines,
}) async {
  final patient = ref.read(activePatientControllerProvider);

  try {
    await PatientService(ref.read(apiClientProvider)).createTreatment(
      patient.id,
      CreateTreatmentRequest(
        treatmentType: 'TargetedTherapy',
        crcl: crcl,
        systemRecommendedMedicines:
            medicines.map((m) => m.toJson()).toList(),
        doctorChosenMedicines: medicines.map((m) => m.toJson()).toList(),
        pathogen: PathogenRecordDto(id: pathogenId, name: pathogenName).toJson(),
      ),
    );
    return true;
  } on ApiException catch (_) {
    return false;
  } on Exception {
    return false;
  }
}

