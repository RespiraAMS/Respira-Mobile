import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosis_result.freezed.dart';
part 'diagnosis_result.g.dart';

/// Tabs of the diagnosis-result screen.
enum DiagnosisTab {
  result('Kết quả'),
  medicines('Thuốc khuyến nghị'),
  references('Tham khảo');

  const DiagnosisTab(this.label);

  final String label;
}

@freezed
class DiagnosisMedicine with _$DiagnosisMedicine {
  const factory DiagnosisMedicine({
    required String name,

    /// e.g. "Phác đồ A · Kháng sinh".
    required String regimenLine,
  }) = _DiagnosisMedicine;

  factory DiagnosisMedicine.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisMedicineFromJson(json);
}

@freezed
class DiagnosisReference with _$DiagnosisReference {
  const factory DiagnosisReference({
    /// e.g. "Bộ Y tế · v3 · 2024".
    required String source,
    required String detail,
  }) = _DiagnosisReference;

  factory DiagnosisReference.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisReferenceFromJson(json);
}

/// Aggregated view model of the diagnosis-result screen.
@freezed
class DiagnosisResult with _$DiagnosisResult {
  const factory DiagnosisResult({
    /// e.g. "Viêm phổi cộng đồng".
    required String diagnosisName,

    /// Selected approach, e.g. "Kinh nghiệm" — shown in the app bar subtitle.
    required String modeLabel,
    required int curbScore,
    required String severityLabel,
    required bool severityIsHigh,
    required String careSettingLabel,
    required String riskLabel,
    @Default([]) List<DiagnosisMedicine> medicines,
    @Default([]) List<DiagnosisReference> references,
  }) = _DiagnosisResult;

  factory DiagnosisResult.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisResultFromJson(json);
}

extension DiagnosisResultX on DiagnosisResult {
  /// Distinct regimens across the recommended medicines ("2 phác đồ").
  int get regimenCount =>
      medicines.map((m) => m.regimenLine.split('·').first.trim()).toSet().length;

  /// "Đã chọn 2 phác đồ · 4 thuốc" for the confirmation dialog strip.
  String get confirmationSummaryLabel =>
      'Đã chọn $regimenCount phác đồ · ${medicines.length} thuốc';
}
