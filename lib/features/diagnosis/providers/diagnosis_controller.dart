import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/diagnosis_state.dart';

part 'diagnosis_controller.g.dart';

/// Holds the criteria selections of the empirical-treatment wizard
/// (CURB-65 step 1/4 and ICU-criteria step 2/4).
@Riverpod(keepAlive: true)
class DiagnosisCriteriaController extends _$DiagnosisCriteriaController {
  @override
  DiagnosisCriteriaState build() => const DiagnosisCriteriaState();

  void toggleCurb65(Curb65Criterion criterion) {
    state = state.copyWith(
      selectedCurb65Criteria: _toggled(state.selectedCurb65Criteria, criterion),
    );
  }

  void toggleIcu(IcuCriterion criterion) {
    state = state.copyWith(
      selectedIcuCriteria: _toggled(state.selectedIcuCriteria, criterion),
    );
  }

  void toggleResistanceRisk(ResistanceRiskFactor factor) {
    state = state.copyWith(
      selectedResistanceRisks:
          _toggled(state.selectedResistanceRisks, factor),
    );
  }

  /// CURB-65 score: one point per met criterion (0–5).
  int get curb65Score => state.selectedCurb65Criteria.length;

  Set<T> _toggled<T>(Set<T> current, T value) {
    final next = {...current};
    if (!next.remove(value)) {
      next.add(value);
    }
    return next;
  }
}
