import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/add_patient_form_state.dart';
import '../models/patient.dart';
import 'active_patient_provider.dart';

part 'add_patient_controller.g.dart';

/// Holds the "Thêm bệnh nhân" form state (guidelines §2.1 Riverpod codegen).
///
/// Pre-filled with the sample patient, mirroring the React prototype's
/// `useState(patient)`.
@riverpod
class AddPatientController extends _$AddPatientController {
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

  void setInsurance(String value) => state = state.copyWith(insurance: value);

  void setAddress(String value) => state = state.copyWith(address: value);

  void setGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  /// Persists the profile. Repository integration lands with the API layer;
  /// for now saving simply returns the resulting [Patient].
  /// Persists the form into the active patient so every downstream
  /// screen (progress, wizard, detail) reflects the record just saved.
  Patient save() {
    final form = state;
    final patient = samplePatient.copyWith(
      name: form.name,
      code: form.code,
      dob: form.dob,
      gender: form.gender,
      insurance: form.insurance,
      address: form.address,
    );
    ref.read(activePatientControllerProvider.notifier).set(patient);
    return patient;
  }
}
