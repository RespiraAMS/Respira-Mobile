import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosis_state.freezed.dart';
part 'diagnosis_state.g.dart';

/// CURB-65 criteria of the empirical treatment wizard, step 1/4.
enum Curb65Criterion {
  confusion('Lú lẫn mới xuất hiện', 'Confusion'),
  highUrea('Urea > 7 mmol/L', 'Blood urea nitrogen'),
  tachypnea('Nhịp thở ≥ 30 lần/phút', 'Respiratory rate'),
  hypotension('Huyết áp thấp', 'SBP < 90 hoặc DBP ≤ 60'),
  ageOver65('Tuổi ≥ 65', 'Age criterion');

  const Curb65Criterion(this.title, this.description);

  final String title;
  final String description;
}

/// ICU admission criteria ("Tiêu chuẩn nhập ICU") of the empirical
/// treatment wizard, step 2/4.
enum IcuCriterion {
  invasiveVentilation('Cần thở máy xâm nhập', 'Tiêu chuẩn nặng.'),
  septicShock('Sốc nhiễm khuẩn', 'Cần vận mạch.'),
  pao2fio2Low('PaO₂/FiO₂ ≤ 250', 'Tiêu chí hỗ trợ.');

  const IcuCriterion(this.title, this.description);

  final String title;
  final String description;
}

/// Antibiotic-resistance risk factors of the empirical treatment wizard,
/// step 3/4 ("Nguy cơ kháng thuốc").
enum ResistanceRiskFactor {
  recentAntibiotics(
    'Dùng kháng sinh 90 ngày gần đây',
    'Yếu tố nguy cơ.',
  ),
  prolongedHospitalization('Nằm viện ≥ 5 ngày', 'Yếu tố phơi nhiễm.');

  const ResistanceRiskFactor(this.title, this.description);

  final String title;
  final String description;
}

/// Selections across the empirical-treatment wizard steps.
///
/// Defaults mirror the Figma templates: CURB-65 has Confusion / Urea /
/// Age ≥ 65 pre-checked; step 2/4 has "PaO₂/FiO₂ ≤ 250" pre-checked;
/// step 3/4 has "Dùng kháng sinh 90 ngày gần đây" pre-checked.
@freezed
class DiagnosisCriteriaState with _$DiagnosisCriteriaState {
  const factory DiagnosisCriteriaState({
    @Default(<Curb65Criterion>{
      Curb65Criterion.confusion,
      Curb65Criterion.highUrea,
      Curb65Criterion.ageOver65,
    })
    Set<Curb65Criterion> selectedCurb65Criteria,
    @Default(<IcuCriterion>{IcuCriterion.pao2fio2Low})
    Set<IcuCriterion> selectedIcuCriteria,
    @Default(<ResistanceRiskFactor>{ResistanceRiskFactor.recentAntibiotics})
    Set<ResistanceRiskFactor> selectedResistanceRisks,
  }) = _DiagnosisCriteriaState;

  factory DiagnosisCriteriaState.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisCriteriaStateFromJson(json);
}
