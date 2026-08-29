import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'patient_list_controller.freezed.dart';
part 'patient_list_controller.g.dart';

/// Triage filter chips of the patient list screen.
enum PatientListFilter { all, attention, highRisk }

/// Search / filter / sort state of the patient list screen.
@freezed
class PatientListState with _$PatientListState {
  const factory PatientListState({
    @Default('') String query,
    @Default(PatientListFilter.all) PatientListFilter filter,

    /// "Ưu tiên" toggle: clinical priority order (critical first, §01).
    @Default(false) bool prioritySort,
  }) = _PatientListState;
}

@Riverpod(keepAlive: true)
class PatientListController extends _$PatientListController {
  @override
  PatientListState build() => const PatientListState();

  void setQuery(String value) => state = state.copyWith(query: value);

  void setFilter(PatientListFilter filter) =>
      state = state.copyWith(filter: filter);

  void togglePrioritySort() =>
      state = state.copyWith(prioritySort: !state.prioritySort);
}
