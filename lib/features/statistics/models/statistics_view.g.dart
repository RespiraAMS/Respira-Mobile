// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KpiStatImpl _$$KpiStatImplFromJson(Map<String, dynamic> json) =>
    _$KpiStatImpl(
      label: json['label'] as String,
      value: (json['value'] as num).toInt(),
      deltaPercent: (json['deltaPercent'] as num).toInt(),
    );

Map<String, dynamic> _$$KpiStatImplToJson(_$KpiStatImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'deltaPercent': instance.deltaPercent,
    };

_$WeeklyBarImpl _$$WeeklyBarImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyBarImpl(
      label: json['label'] as String,
      value: (json['value'] as num).toInt(),
    );

Map<String, dynamic> _$$WeeklyBarImplToJson(_$WeeklyBarImpl instance) =>
    <String, dynamic>{'label': instance.label, 'value': instance.value};

_$PathogenStatImpl _$$PathogenStatImplFromJson(Map<String, dynamic> json) =>
    _$PathogenStatImpl(
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$$PathogenStatImplToJson(_$PathogenStatImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
      'rank': instance.rank,
    };

_$StatisticsViewImpl _$$StatisticsViewImplFromJson(Map<String, dynamic> json) =>
    _$StatisticsViewImpl(
      kpis:
          (json['kpis'] as List<dynamic>?)
              ?.map((e) => KpiStat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bars:
          (json['bars'] as List<dynamic>?)
              ?.map((e) => WeeklyBar.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pathogens:
          (json['pathogens'] as List<dynamic>?)
              ?.map((e) => PathogenStat.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StatisticsViewImplToJson(
  _$StatisticsViewImpl instance,
) => <String, dynamic>{
  'kpis': instance.kpis,
  'bars': instance.bars,
  'pathogens': instance.pathogens,
};
