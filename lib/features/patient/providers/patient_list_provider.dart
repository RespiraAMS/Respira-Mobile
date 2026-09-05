import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/patient_summary.dart';
import 'patient_list_controller.dart';

part 'patient_list_provider.g.dart';

/// Demo roster — sized so the template's derived counts are real:
/// 12 total · 3 "Cần chú ý" (treating) · 1 "Nguy cơ cao" (deceased).
/// Swap for a repository call once the networking layer exists.
@Riverpod(keepAlive: true)
List<PatientSummary> patientList(PatientListRef ref) => const [
      PatientSummary(
        name: 'Nguyễn Văn An',
        code: 'BA-2026-0182',
        genderLabel: 'Nam',
        age: 64,
        status: PatientStatus.treating,
      ),
      PatientSummary(
        name: 'Trần Minh Khoa',
        code: 'BA-2026-0214',
        genderLabel: 'Nam',
        age: 58,
        status: PatientStatus.deceased,
      ),
      PatientSummary(
        name: 'Lê Thu Hà',
        code: 'BA-2026-0208',
        genderLabel: 'Nữ',
        age: 72,
        status: PatientStatus.recovered,
      ),
      PatientSummary(
        name: 'Phạm Quốc Bảo',
        code: 'BA-2026-0196',
        genderLabel: 'Nam',
        age: 47,
        status: PatientStatus.treating,
      ),
      PatientSummary(
        name: 'Bùi Thanh Tùng',
        code: 'BA-2026-0158',
        genderLabel: 'Nam',
        age: 51,
        status: PatientStatus.treating,
      ),
      PatientSummary(
        name: 'Võ Thị Mai',
        code: 'BA-2026-0177',
        genderLabel: 'Nữ',
        age: 55,
        status: PatientStatus.recovered,
      ),
      PatientSummary(
        name: 'Đặng Quốc Huy',
        code: 'BA-2026-0169',
        genderLabel: 'Nam',
        age: 39,
        status: PatientStatus.recovered,
      ),
      PatientSummary(
        name: 'Hoàng Ngọc Lan',
        code: 'BA-2026-0163',
        genderLabel: 'Nữ',
        age: 68,
        status: PatientStatus.recovered,
      ),
      PatientSummary(
        name: 'Đỗ Khánh Linh',
        code: 'BA-2026-0151',
        genderLabel: 'Nữ',
        age: 44,
        status: PatientStatus.recovered,
      ),
      PatientSummary(
        name: 'Ngô Văn Đức',
        code: 'BA-2026-0145',
        genderLabel: 'Nam',
        age: 61,
        status: PatientStatus.recovered,
      ),
      PatientSummary(
        name: 'Phan Thị Yến Nhi',
        code: 'BA-2026-0139',
        genderLabel: 'Nữ',
        age: 33,
        status: PatientStatus.recovered,
      ),
      PatientSummary(
        name: 'Lý Quốc Cường',
        code: 'BA-2026-0132',
        genderLabel: 'Nam',
        age: 70,
        status: PatientStatus.recovered,
      ),
    ];

/// Applies the current query / filter / sort on top of the roster.
@Riverpod(keepAlive: true)
List<PatientSummary> visiblePatients(VisiblePatientsRef ref) {
  final patients = ref.watch(patientListProvider);
  final state = ref.watch(patientListControllerProvider);

  final query = state.query.trim().toLowerCase();
  final filtered = patients.where((p) {
    final matchesFilter = switch (state.filter) {
      PatientListFilter.all => true,
      PatientListFilter.attention => p.status == PatientStatus.treating,
      PatientListFilter.highRisk => p.status == PatientStatus.deceased,
    };
    final matchesQuery = query.isEmpty ||
        p.name.toLowerCase().contains(query) ||
        p.code.toLowerCase().contains(query);
    return matchesFilter && matchesQuery;
  }).toList();

  if (state.prioritySort) {
    int rank(PatientStatus s) => switch (s) {
          PatientStatus.deceased => 0,
          PatientStatus.treating => 1,
          PatientStatus.recovered => 2,
        };
    filtered.sort((a, b) {
      final byRank = rank(a.status).compareTo(rank(b.status));
      return byRank != 0 ? byRank : a.name.compareTo(b.name);
    });
  }

  return filtered;
}
