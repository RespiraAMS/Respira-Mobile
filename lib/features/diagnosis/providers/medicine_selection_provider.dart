import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'medicine_selection_provider.freezed.dart';
part 'medicine_selection_provider.g.dart';

/// Doctor's edits over the empirical 'Thuốc khuyến nghị' tab:
/// same-group replacements (recommended id → pool medicine id) and
/// removals (recommended ids excluded from the chosen list).
@freezed
class MedicineSelectionState with _$MedicineSelectionState {
  const factory MedicineSelectionState({
    @Default({}) Map<String, String> replacements,
    @Default({}) Set<String> removed,
  }) = _MedicineSelectionState;
}

/// Tracks medicine edits for the empirical 'Thuốc khuyến nghị' tab.
///
/// Identity by default (every recommendation stays as suggested); the
/// backend requires a non-empty `reasonForDifferentChoice` on save only
/// when changes exist — a replacement or a removal makes the doctor's
/// chosen list differ from the system recommendation.
@Riverpod(keepAlive: true)
class MedicineSelectionController extends _$MedicineSelectionController {
  @override
  MedicineSelectionState build() => const MedicineSelectionState();

  void replace(String recommendedId, String chosenId) {
    if (chosenId == recommendedId) {
      restore(recommendedId);
      return;
    }
    state = state.copyWith(
      replacements: {...state.replacements, recommendedId: chosenId},
      removed: {...state.removed}..remove(recommendedId),
    );
  }

  void remove(String recommendedId) {
    state = state.copyWith(
      replacements: {...state.replacements}..remove(recommendedId),
      removed: {...state.removed, recommendedId},
    );
  }

  void restore(String recommendedId) {
    state = state.copyWith(
      replacements: {...state.replacements}..remove(recommendedId),
      removed: {...state.removed}..remove(recommendedId),
    );
  }

  /// The effective chosen id for a recommendation — null when removed.
  String? chosenFor(String recommendedId) =>
      state.removed.contains(recommendedId)
          ? null
          : state.replacements[recommendedId] ?? recommendedId;

  bool isRemoved(String recommendedId) =>
      state.removed.contains(recommendedId);

  bool get hasChanges =>
      state.replacements.isNotEmpty || state.removed.isNotEmpty;

  int get changedCount => state.replacements.length + state.removed.length;

  void reset() => state = const MedicineSelectionState();
}
