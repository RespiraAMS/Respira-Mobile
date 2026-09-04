import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../models/patient_dtos.dart';
import '../models/patient_summary.dart';
import '../services/patient_service.dart';

part 'patient_list_provider.freezed.dart';
part 'patient_list_provider.g.dart';

/// Triage filter chips of the patient list screen.
enum PatientListFilter { all, attention, highRisk }

/// Paged + filtered roster state backed by `GET /patients`.
///
/// The backend only filters by name / record code; the triage chips are
/// applied client-side over the loaded pages (user-approved limitation).
@freezed
class PatientListState with _$PatientListState {
  const factory PatientListState({
    @Default('') String query,
    @Default(PatientListFilter.all) PatientListFilter filter,
    @Default(false) bool prioritySort,
    @Default(false) bool loading,
    @Default(false) bool loadingMore,
    @Default(false) bool hasMore,
    String? errorMessage,
    @Default([]) List<PatientSummary> patients,
    @Default(1) int page,
  }) = _PatientListState;
}

@Riverpod(keepAlive: true)
class PatientListController extends _$PatientListController {
  PatientService get _service =>
      PatientService(ref.watch(apiClientProvider));

  @override
  PatientListState build() => const PatientListState();

  void setQuery(String value) {
    state = state.copyWith(query: value);
    refresh();
  }

  void setFilter(PatientListFilter filter) =>
      state = state.copyWith(filter: filter);

  void togglePrioritySort() =>
      state = state.copyWith(prioritySort: !state.prioritySort);

  /// Reloads page 1 (also used by pull-to-refresh).
  Future<void> refresh() async {
    state = state.copyWith(loading: true, errorMessage: null, page: 1);
    try {
      final paged = await _service.getPatients(
        fullName: state.query,
        medicalRecordCode: state.query,
      );
      state = state.copyWith(
        loading: false,
        patients: _map(paged.items),
        hasMore: paged.metadata.hasNextPage,
        page: 1,
      );
    } on ApiException catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.message);
    } on DioException {
      state = state.copyWith(
        loading: false,
        errorMessage: 'Không thể kết nối máy chủ.',
      );
    }
  }

  /// Loads the next page.
  Future<void> loadMore() async {
    if (state.loadingMore || !state.hasMore) return;
    state = state.copyWith(loadingMore: true);
    try {
      final nextPage = state.page + 1;
      final paged = await _service.getPatients(
        page: nextPage,
        fullName: state.query,
        medicalRecordCode: state.query,
      );
      state = state.copyWith(
        loadingMore: false,
        page: nextPage,
        hasMore: paged.metadata.hasNextPage,
        patients: [...state.patients, ..._map(paged.items)],
      );
    } on Exception {
      state = state.copyWith(loadingMore: false);
    }
  }

  List<PatientSummary> _map(Iterable<PatientListItemDto> items) =>
      items.map((dto) {
        final status = switch (dto.status) {
          PatientStatusDto.inTreatment => PatientStatus.treating,
          PatientStatusDto.recovered => PatientStatus.recovered,
          PatientStatusDto.death => PatientStatus.deceased,
        };
        return PatientSummary(
          id: dto.id,
          name: dto.fullName,
          code: dto.medicalRecordCode,
          genderLabel: dto.isMale ? 'Nam' : 'Nữ',
          age: dto.age,
          status: status,
        );
      }).toList();
}

/// Applies the triage chips + priority sort over the loaded roster.
@riverpod
List<PatientSummary> visiblePatients(VisiblePatientsRef ref) {
  final listState = ref.watch(patientListControllerProvider);
  final query = listState.query.trim().toLowerCase();

  var patients = listState.patients.where((p) {
    final matchesFilter = switch (listState.filter) {
      PatientListFilter.all => true,
      PatientListFilter.attention => p.status == PatientStatus.treating,
      PatientListFilter.highRisk => p.status == PatientStatus.deceased,
    };
    final matchesQuery = query.isEmpty ||
        p.name.toLowerCase().contains(query) ||
        p.code.toLowerCase().contains(query);
    return matchesFilter && matchesQuery;
  }).toList();

  if (listState.prioritySort) {
    int rank(PatientStatus s) => switch (s) {
          PatientStatus.deceased => 0,
          PatientStatus.treating => 1,
          PatientStatus.recovered => 2,
        };
    patients.sort((a, b) {
      final byRank = rank(a.status).compareTo(rank(b.status));
      return byRank != 0 ? byRank : a.name.compareTo(b.name);
    });
  }

  return patients;
}
