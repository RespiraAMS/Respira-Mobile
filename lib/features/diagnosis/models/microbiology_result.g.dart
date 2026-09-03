// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'microbiology_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreatmentOptionImpl _$$TreatmentOptionImplFromJson(
  Map<String, dynamic> json,
) => _$TreatmentOptionImpl(
  id: json['id'] as String,
  drug: json['drug'] as String,
  route: json['route'] as String,
  routeAbbrev: json['routeAbbrev'] as String,
  dosage: json['dosage'] as String,
  susceptibility: $enumDecode(_$SusceptibilityEnumMap, json['susceptibility']),
);

Map<String, dynamic> _$$TreatmentOptionImplToJson(
  _$TreatmentOptionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'drug': instance.drug,
  'route': instance.route,
  'routeAbbrev': instance.routeAbbrev,
  'dosage': instance.dosage,
  'susceptibility': _$SusceptibilityEnumMap[instance.susceptibility]!,
};

const _$SusceptibilityEnumMap = {
  Susceptibility.s: 's',
  Susceptibility.i: 'i',
  Susceptibility.r: 'r',
};

_$MicrobiologyResultImpl _$$MicrobiologyResultImplFromJson(
  Map<String, dynamic> json,
) => _$MicrobiologyResultImpl(
  bacteria: json['bacteria'] as String,
  antibiogramLine: json['antibiogramLine'] as String,
  options:
      (json['options'] as List<dynamic>?)
          ?.map((e) => TreatmentOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$MicrobiologyResultImplToJson(
  _$MicrobiologyResultImpl instance,
) => <String, dynamic>{
  'bacteria': instance.bacteria,
  'antibiogramLine': instance.antibiogramLine,
  'options': instance.options,
};
