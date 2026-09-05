import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../models/patient.dart';
import '../models/patient_dtos.dart';
import '../services/patient_service.dart';
import 'active_patient_provider.dart';

part 'patient_detail_provider.g.dart';

/// Fetches `GET /patients/{id}` for the detail screen and mirrors the
/// record into [activePatientControllerProvider] — downstream screens
/// (progress, diagnosis wizard, treatment save) then work with the real
/// patient id instead of the sample fallback.
@riverpod
Future<PatientDetailDto> patientDetail(PatientDetailRef ref, String id) async {
  final service = PatientService(ref.watch(apiClientProvider));
  final detail = await service.getPatient(id);

  final dobParts = detail.dateOfBirth.split('-');
  final dobDisplay = dobParts.length == 3
      ? '${dobParts[2]}/${dobParts[1]}/${dobParts[0]}'
      : detail.dateOfBirth;

  ref.read(activePatientControllerProvider.notifier).set(
        Patient(
          id: detail.id,
          name: detail.fullName,
          code: detail.medicalRecordCode,
          dob: dobDisplay,
          gender: detail.isMale ? Gender.nam : Gender.nu,
          insurance: detail.healthInsuranceCardNumber,
          address: detail.address,
        ),
      );
  return detail;
}
