import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/diagnosis_state.dart';

part 'diagnosis_controller.g.dart';

/// Holds the measurements & selections of the diagnosis wizard
/// (vitals 1/5 · CURB-65 2/5 · ICU 3/5 · resistance 4/5 · other 5/5).
@Riverpod(keepAlive: true)
class DiagnosisCriteriaController extends _$DiagnosisCriteriaController {
  @override
  DiagnosisCriteriaState build() => const DiagnosisCriteriaState();

  // ── Step 1/5 · Vitals ─────────────────────────────────────────────
  void setHeightCm(String value) => state = state.copyWith(heightCm: value);

  void setWeightKg(String value) => state = state.copyWith(weightKg: value);

  void setSerumCreatinine(String value) =>
      state = state.copyWith(serumCreatinine: value);

  // ── Step 2/5 · CURB-65 ────────────────────────────────────────────
  void toggleConfusion() =>
      state = state.copyWith(confusion: !state.confusion);

  void setUrea(String value) => state = state.copyWith(urea: value);

  void setRespRate(String value) => state = state.copyWith(respRate: value);

  void setSbp(String value) => state = state.copyWith(sbp: value);

  void setDbp(String value) => state = state.copyWith(dbp: value);

  void setAge(String value) => state = state.copyWith(age: value);

  // ── Step 3/5 · ICU criteria ───────────────────────────────────────
  void setPao2Fio2(String value) => state = state.copyWith(pao2Fio2: value);

  void toggleIcuCriterionId(String criterionId) {
    final next = {...state.selectedIcuCriteriaIds};
    if (!next.remove(criterionId)) {
      next.add(criterionId);
    }
    state = state.copyWith(selectedIcuCriteriaIds: next);
  }

  // ── Step 4/5 · Resistance risks ───────────────────────────────────
  void toggleResistanceRiskId(String criterionId) {
    final next = {...state.selectedResistanceRiskIds};
    if (!next.remove(criterionId)) {
      next.add(criterionId);
    }
    state = state.copyWith(selectedResistanceRiskIds: next);
  }

  // ── Step 5/5 · Other criteria ─────────────────────────────────────
  void toggleOtherCriterionId(String criterionId) {
    final next = {...state.selectedOtherCriteriaIds};
    if (!next.remove(criterionId)) {
      next.add(criterionId);
    }
    state = state.copyWith(selectedOtherCriteriaIds: next);
  }
}
