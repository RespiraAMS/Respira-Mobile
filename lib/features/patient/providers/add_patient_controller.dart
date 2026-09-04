import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../models/add_patient_form_state.dart';
import '../models/patient.dart';
import '../services/patient_service.dart';
import 'active_patient_provider.dart';
import 'add_patient_saving_provider.dart';

part 'add_patient_controller.g.dart';

/// Holds the "Thêm bệnh nhân" form state and submits it to
/// `POST /patients` (guidelines §2.1 Riverpod codegen).
///
/// Pre-filled with the sample patient, mirroring the React prototype's
/// `useState(patient)`.
@Riverpod(keepAlive: true)
class AddPatientController extends _$AddPatientController {
  PatientService get _service => PatientService(ref.watch(apiClientProvider));

  @override
  AddPatientFormState build() => AddPatientFormState(
        name: samplePatient.name,
        code: samplePatient.code,
        dob: samplePatient.dob,
        gender: samplePatient.gender,
        insurance: samplePatient.insurance,
        address: samplePatient.address,
      );

  void setName(String value) => state = state.copyWith(name: value);

  void setCode(String value) => state = state.copyWith(code: value);

  void setDob(String value) => state = state.copyWith(dob: value);

  void setInsurance(String value) =>
      state = state.copyWith(insurance: value);

  void setAddress(String value) => state = state.copyWith(address: value);

  void setCity(String value) => state = state.copyWith(city: value);

  void setCountry(String value) => state = state.copyWith(country: value);

  void setGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  /// Creates the patient via the API and makes them the active patient so
  /// every downstream screen (progress, wizard, detail) reflects the
  /// record just saved. Returns the new patient's ID.
  ///
  /// Throws [ApiException] on failure (guidelines Rule 3).
  Future<String> save() async {
    final saving = ref.read(addPatientSavingProvider.notifier);
    saving.set(true);
    try {
      final form = state;
      // dd/MM/yyyy (prototype format) → yyyy-MM-dd (API DateOnly).
      final parts = form.dob.split('/');
      final dobIso = parts.length == 3
          ? '${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}'
          : form.dob;

      final id = await _service.createPatient(
        fullName: form.name,
        dateOfBirth: dobIso,
        isMale: form.gender == Gender.nam,
        medicalRecordCode: form.code,
        healthInsuranceCardNumber: form.insurance,
        address: form.address,
        city: form.city,
        country: form.country,
      );

      final patient = Patient(
        name: form.name,
        code: form.code,
        dob: form.dob,
        gender: form.gender,
        insurance: form.insurance,
        address: form.address,
      );
      ref.read(activePatientControllerProvider.notifier).set(patient);
      return id;
    } finally {
      saving.set(false);
    }
  }
}
