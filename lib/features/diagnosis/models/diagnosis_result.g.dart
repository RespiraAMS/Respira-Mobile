// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosisMedicineImpl _$$DiagnosisMedicineImplFromJson(
  Map<String, dynamic> json,
) => _$DiagnosisMedicineImpl(
  name: json['name'] as String,
  regimenLine: json['regimenLine'] as String,
);

Map<String, dynamic> _$$DiagnosisMedicineImplToJson(
  _$DiagnosisMedicineImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'regimenLine': instance.regimenLine,
};

_$DiagnosisReferenceImpl _$$DiagnosisReferenceImplFromJson(
  Map<String, dynamic> json,
) => _$DiagnosisReferenceImpl(
  source: json['source'] as String,
  detail: json['detail'] as String,
);

Map<String, dynamic> _$$DiagnosisReferenceImplToJson(
  _$DiagnosisReferenceImpl instance,
) => <String, dynamic>{'source': instance.source, 'detail': instance.detail};

_$DiagnosisResultImpl _$$DiagnosisResultImplFromJson(
  Map<String, dynamic> json,
) => _$DiagnosisResultImpl(
  diagnosisName: json['diagnosisName'] as String,
  modeLabel: json['modeLabel'] as String,
  curbScore: (json['curbScore'] as num).toInt(),
  severityLabel: json['severityLabel'] as String,
  severityIsHigh: json['severityIsHigh'] as bool,
  careSettingLabel: json['careSettingLabel'] as String,
  riskLabel: json['riskLabel'] as String,
  medicines:
      (json['medicines'] as List<dynamic>?)
          ?.map((e) => DiagnosisMedicine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  references:
      (json['references'] as List<dynamic>?)
          ?.map((e) => DiagnosisReference.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$DiagnosisResultImplToJson(
  _$DiagnosisResultImpl instance,
) => <String, dynamic>{
  'diagnosisName': instance.diagnosisName,
  'modeLabel': instance.modeLabel,
  'curbScore': instance.curbScore,
  'severityLabel': instance.severityLabel,
  'severityIsHigh': instance.severityIsHigh,
  'careSettingLabel': instance.careSettingLabel,
  'riskLabel': instance.riskLabel,
  'medicines': instance.medicines,
  'references': instance.references,
};
