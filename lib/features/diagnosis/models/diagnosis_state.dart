import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosis_state.freezed.dart';
part 'diagnosis_state.g.dart';

/// ICU admission criteria ("Tiêu chuẩn nhập ICU") of the diagnosis
/// wizard, step 3/5. Criteria come from the disease-criteria API and are
/// selected by ID.
///
/// The PaO₂/FiO₂ ratio is *measured* on the same step rather than ticked.
enum IcuCriterion {
  invasiveVentilation('Cần thở máy xâm nhập', 'Tiêu chuẩn nặng.'),
  septicShock('Sốc nhiễm khuẩn', 'Cần vận mạch.');

  const IcuCriterion(this.title, this.description);

  final String title;
  final String description;
}

/// Antibiotic-resistance risk factors of the diagnosis wizard,
/// step 4/5 ("Nguy cơ kháng thuốc") — rendered from API criteria.
///
/// Static demo rows kept as fallback descriptions.
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
/// Criteria selections hold **API criterion IDs** (GUIDs) required by
/// `POST /diagnose/empirical`. Measured fields start empty.
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
    @Default(<String>{}) Set<String> selectedIcuCriteriaIds,

    // ── Step 4/5 · Resistance risks ────────────────────────────────
    @Default(<String>{}) Set<String> selectedResistanceRiskIds,

    // ── Step 5/5 · Other criteria ──────────────────────────────────
    @Default(<String>{}) Set<String> selectedOtherCriteriaIds,
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

  /// CURB-65 score 0–5, one point per met criterion.
  int get curb65Score => [
        hasConfusion,
        hasHighUrea,
        hasTachypnea,
        hasHypotension,
        hasAgeOver65,
      ].where((met) => met).length;

  /// Body-mass index proxy for later steps / clinical display.
  double? get bmi {
    final height = _parse(heightCm);
    final weight = _parse(weightKg);
    if (height == null || weight == null || height == 0) return null;
    final meters = height / 100;
    return weight / (meters * meters);
  }
}
