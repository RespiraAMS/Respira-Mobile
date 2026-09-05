import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/statistics_view.dart';

part 'statistics_provider.g.dart';

/// Selected overview range of the statistics screen.
@Riverpod(keepAlive: true)
class StatisticsPeriodController extends _$StatisticsPeriodController {
  @override
  PeriodRange build() => PeriodRange.last30Days;

  void setPeriod(PeriodRange period) => state = period;
}

const _thirtyDays = StatisticsView(
  kpis: [
    KpiStat(label: 'Chẩn đoán', value: 128, deltaPercent: 12),
    KpiStat(label: 'Đã lưu', value: 116, deltaPercent: 9),
    KpiStat(label: 'Vi sinh', value: 34, deltaPercent: 5),
  ],
  bars: [
    WeeklyBar(label: 'T1', value: 14),
    WeeklyBar(label: 'T2', value: 20),
    WeeklyBar(label: 'T3', value: 16),
    WeeklyBar(label: 'T4', value: 26),
    WeeklyBar(label: 'T5', value: 22),
    WeeklyBar(label: 'T6', value: 31),
  ],
  pathogens: [
    PathogenStat(name: 'S. pneumoniae', count: 32, rank: 0),
    PathogenStat(name: 'K. pneumoniae', count: 24, rank: 1),
    PathogenStat(name: 'P. aeruginosa', count: 18, rank: 2),
  ],
);

const _thisQuarter = StatisticsView(
  kpis: [
    KpiStat(label: 'Chẩn đoán', value: 384, deltaPercent: 8),
    KpiStat(label: 'Đã lưu', value: 351, deltaPercent: 6),
    KpiStat(label: 'Vi sinh', value: 97, deltaPercent: 4),
  ],
  bars: [
    WeeklyBar(label: 'T1', value: 58),
    WeeklyBar(label: 'T2', value: 71),
    WeeklyBar(label: 'T3', value: 64),
    WeeklyBar(label: 'T4', value: 83),
    WeeklyBar(label: 'T5', value: 77),
    WeeklyBar(label: 'T6', value: 92),
  ],
  pathogens: [
    PathogenStat(name: 'S. pneumoniae', count: 96, rank: 0),
    PathogenStat(name: 'K. pneumoniae', count: 74, rank: 1),
    PathogenStat(name: 'P. aeruginosa', count: 53, rank: 2),
  ],
);

const _thisYear = StatisticsView(
  kpis: [
    KpiStat(label: 'Chẩn đoán', value: 1523, deltaPercent: 15),
    KpiStat(label: 'Đã lưu', value: 1387, deltaPercent: 11),
    KpiStat(label: 'Vi sinh', value: 402, deltaPercent: 7),
  ],
  bars: [
    WeeklyBar(label: 'T1', value: 212),
    WeeklyBar(label: 'T2', value: 248),
    WeeklyBar(label: 'T3', value: 230),
    WeeklyBar(label: 'T4', value: 276),
    WeeklyBar(label: 'T5', value: 259),
    WeeklyBar(label: 'T6', value: 298),
  ],
  pathogens: [
    PathogenStat(name: 'S. pneumoniae', count: 371, rank: 0),
    PathogenStat(name: 'K. pneumoniae', count: 289, rank: 1),
    PathogenStat(name: 'P. aeruginosa', count: 206, rank: 2),
  ],
);

/// Demo datasets per range — swap for a repository call once the
/// networking layer exists.
@Riverpod(keepAlive: true)
StatisticsView statisticsView(StatisticsViewRef ref) {
  final period = ref.watch(statisticsPeriodControllerProvider);
  return switch (period) {
    PeriodRange.last30Days => _thirtyDays,
    PeriodRange.thisQuarter => _thisQuarter,
    PeriodRange.thisYear => _thisYear,
  };
}
