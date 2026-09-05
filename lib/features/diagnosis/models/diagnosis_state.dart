import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosis_state.freezed.dart';
part 'diagnosis_state.g.dart';

/// ICU admission criteria ("Tiêu chuẩn nhập ICU") of the diagnosis
/// wizard, step 3/5. The PaO₂/FiO₂ ratio is *measured* on the same step
/// rather than ticked, so it lives in the state's numeric fields.
enum IcuCriterion {
  invasiveVentilation('Cần thở máy xâm nhập', 'Tiêu chuẩn nặng.'),
  septicShock('Sốc nhiễm khuẩn', 'Cần vận mạch.');

  const IcuCriterion(this.title, this.description);

  final String title;
  final String description;
}

/// Antibiotic-resistance risk factors of the empirical treatment wizard,
/// step 4/5 ("Nguy cơ kháng thuốc").
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

/// Selections & measurements across the diagnosis wizard (5 steps).
///
/// Step defaults mirror the Figma templates: confusion checked; the
/// resistance step has "Dùng kháng sinh 90 ngày gần đây" pre-checked.
/// Measured fields (vitals, CURB-65 parameters, PaO₂/FiO₂) start empty.
@freezed
class DiagnosisCriteriaState with _$DiagnosisCriteriaState {
  const factory DiagnosisCriteriaState({
    // ── Step 1/5 · Vitals ──────────────────────────────────────────
    @Default('') String heightCm,
    @Default('') String weightKg,
    @Default('') String serumCreatinine,

    // ── Step 2/5 · CURB-65 ─────────────────────────────────────────
    @Default(true) bool confusion,
    @Default('') String urea,
    @Default('') String respRate,
    @Default('') String sbp,
    @Default('') String dbp,
    @Default('') String age,

    // ── Step 3/5 · ICU criteria ────────────────────────────────────
    @Default('') String pao2Fio2,
    @Default(<IcuCriterion>{IcuCriterion.septicShock})
    Set<IcuCriterion> selectedIcuCriteria,
    @Default(<ResistanceRiskFactor>{ResistanceRiskFactor.recentAntibiotics})
    Set<ResistanceRiskFactor> selectedResistanceRisks,
  }) = _DiagnosisCriteriaState;

  factory DiagnosisCriteriaState.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisCriteriaStateFromJson(json);
}

/// Live CURB-65 derivation — the score is computed from measured inputs
/// instead of manually ticked checkboxes. Empty fields count as unmet.
extension DiagnosisCriteriaX on DiagnosisCriteriaState {
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

  /// Measured on step 3/5: the ratio meets the criterion when ≤ 250
  /// (empty = not evaluated).
  bool get hasPao2Fio2Low {
    final ratio = _parse(pao2Fio2);
    return ratio != null && ratio <= 250;
  }

  /// CURB-65 score 0–5, one point per met criterion.
  int get curb65Score => [
        hasConfusion,
        hasHighUrea,
        hasTachypnea,
        hasHypotension,
        hasAgeOver65,
      ].whereType<bool>().where((met) => met).length;

  /// Body-surface proxy for later steps / clinical display.
  double? get bmi {
    final height = _parse(heightCm);
    final weight = _parse(weightKg);
    if (height == null || weight == null || height == 0) return null;
    final meters = height / 100;
    return weight / (meters * meters);
  }
}
