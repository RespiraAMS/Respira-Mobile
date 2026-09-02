import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_view.freezed.dart';
part 'statistics_view.g.dart';

/// Overview ranges of the statistics screen.
enum PeriodRange {
  last30Days('30 ngày'),
  thisQuarter('Quý này'),
  thisYear('Năm nay');

  const PeriodRange(this.displayName);

  final String displayName;
}

/// One headline KPI tile ("Chẩn đoán · 128 · +12%").
@freezed
class KpiStat with _$KpiStat {
  const factory KpiStat({
    required String label,
    required int value,
    required int deltaPercent,
  }) = _KpiStat;

  factory KpiStat.fromJson(Map<String, dynamic> json) => _$KpiStatFromJson(json);
}

/// One weekly bar of the "Chẩn đoán theo tuần" chart.
@freezed
class WeeklyBar with _$WeeklyBar {
  const factory WeeklyBar({
    required String label,
    required int value,
  }) = _WeeklyBar;

  factory WeeklyBar.fromJson(Map<String, dynamic> json) =>
      _$WeeklyBarFromJson(json);
}

/// One pathogen row of the "Tác nhân thường gặp" ranking.
@freezed
class PathogenStat with _$PathogenStat {
  const factory PathogenStat({
    required String name,
    required int count,

    /// 0 = most frequent; drives the semantic bar color (primary/warning/
    /// success — label + color together, never color alone §12).
    required int rank,
  }) = _PathogenStat;

  factory PathogenStat.fromJson(Map<String, dynamic> json) =>
      _$PathogenStatFromJson(json);
}

/// Aggregate view model for one [PeriodRange].
@freezed
class StatisticsView with _$StatisticsView {
  const factory StatisticsView({
    @Default([]) List<KpiStat> kpis,
    @Default([]) List<WeeklyBar> bars,
    @Default([]) List<PathogenStat> pathogens,
  }) = _StatisticsView;

  factory StatisticsView.fromJson(Map<String, dynamic> json) =>
      _$StatisticsViewFromJson(json);
}
