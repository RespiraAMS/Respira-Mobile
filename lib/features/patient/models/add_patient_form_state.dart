import 'package:freezed_annotation/freezed_annotation.dart';

import 'patient.dart';

part 'add_patient_form_state.freezed.dart';
part 'add_patient_form_state.g.dart';

/// Editable state of the "Thêm bệnh nhân" form.
@freezed
class AddPatientFormState with _$AddPatientFormState {
  const factory AddPatientFormState({
    @Default('') String name,
    @Default('') String code,
    @Default('') String dob,
    @Default(Gender.nam) Gender gender,
    @Default('') String insurance,
    @Default('') String address,
  }) = _AddPatientFormState;

  factory AddPatientFormState.fromJson(Map<String, dynamic> json) =>
      _$AddPatientFormStateFromJson(json);
}
