import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

/// Patient gender with Vietnamese display labels.
enum Gender {
  nam('Nam'),
  nu('Nữ');

  const Gender(this.displayName);

  final String displayName;
}

@freezed
class Patient with _$Patient {
  const factory Patient({
    @Default('') String id,
    required String name,
    required String code,
    /// Date of birth, formatted dd/MM/yyyy.
    required String dob,
    required Gender gender,
    /// Health insurance number (Số thẻ BHYT).
    required String insurance,
    required String address,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

/// Demo record mirroring the React prototype until a repository exists.
const samplePatient = Patient(
  name: 'Nguyễn Minh Khôi',
  code: 'BA-2026-0231',
  dob: '12/08/1970',
  gender: Gender.nam,
  insurance: 'DN 4 01 0012345678',
  address: 'Ninh Kiều, Cần Thơ',
);
