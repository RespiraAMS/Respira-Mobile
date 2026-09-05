import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_summary.freezed.dart';
part 'patient_summary.g.dart';

/// Clinical status shown on patient list cards (dot + label, never color
/// alone §12).
enum PatientStatus {
  treating('Đang điều trị'),
  recovered('Hồi phục'),
  deceased('Tử vong');

  const PatientStatus(this.displayName);

  final String displayName;
}

/// Lightweight row model of the patient list screen.
@freezed
class PatientSummary with _$PatientSummary {
  const factory PatientSummary({
    required String name,
    required String code,
    required String genderLabel,
    required int age,
    required PatientStatus status,
  }) = _PatientSummary;

  factory PatientSummary.fromJson(Map<String, dynamic> json) =>
      _$PatientSummaryFromJson(json);
}
