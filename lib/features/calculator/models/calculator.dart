import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculator.freezed.dart';
part 'calculator.g.dart';

/// Clinical calculators offered on the 'Máy tính' tab.
enum CalculatorId {
  curb65('CURB-65', 'Đánh giá mức độ nặng viêm phổi'),
  egfr('eGFR', 'Ước tính chức năng thận'),
  crcl('CrCl', 'Độ thanh thải creatinin'),
  bmi('BMI', 'Chỉ số khối cơ thể'),
  qsofa('qSOFA', 'Đánh giá nhanh nguy cơ nhiễm khuẩn');

  const CalculatorId(this.title, this.description);

  final String title;
  final String description;
}

/// Raw CURB-65 inputs of the calculator. Empty fields count as unmet
/// (same semantics as the diagnosis wizard).
@freezed
class Curb65Input with _$Curb65Input {
  const factory Curb65Input({
    @Default(false) bool confusion,
    @Default('') String urea,
    @Default('') String respRate,
    @Default('') String sbp,
    @Default('') String dbp,
    @Default('') String age,
  }) = _Curb65Input;

  factory Curb65Input.fromJson(Map<String, dynamic> json) =>
      _$Curb65InputFromJson(json);
}

extension Curb65InputX on Curb65Input {
  static double? _parse(String raw) {
    final value = double.tryParse(raw.trim().replaceAll(',', '.'));
    return (value == null || value < 0) ? null : value;
  }

  bool get hasConfusion => confusion;

  bool get hasHighUrea => (_parse(urea) ?? 0) > 7;

  bool get hasTachypnea => (_parse(respRate) ?? 0) >= 30;

  bool get hasHypotension {
    final systolic = _parse(sbp);
    final diastolic = _parse(dbp);
    if (systolic == null && diastolic == null) return false;
    return (systolic != null && systolic < 90) ||
        (diastolic != null && diastolic <= 60);
  }

  bool get hasAgeOver65 => (_parse(age) ?? 0) >= 65;

  /// CURB-65 score 0–5, one point per met criterion.
  int get score => [
        hasConfusion,
        hasHighUrea,
        hasTachypnea,
        hasHypotension,
        hasAgeOver65,
      ].where((met) => met).length;
}
