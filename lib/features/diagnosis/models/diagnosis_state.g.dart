// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosisCriteriaStateImpl _$$DiagnosisCriteriaStateImplFromJson(
  Map<String, dynamic> json,
) => _$DiagnosisCriteriaStateImpl(
  heightCm: json['heightCm'] as String? ?? '',
  weightKg: json['weightKg'] as String? ?? '',
  serumCreatinine: json['serumCreatinine'] as String? ?? '',
  confusion: json['confusion'] as bool? ?? true,
  urea: json['urea'] as String? ?? '',
  respRate: json['respRate'] as String? ?? '',
  sbp: json['sbp'] as String? ?? '',
  dbp: json['dbp'] as String? ?? '',
  age: json['age'] as String? ?? '',
  pao2Fio2: json['pao2Fio2'] as String? ?? '',
  selectedIcuCriteriaIds:
      (json['selectedIcuCriteriaIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  selectedResistanceRiskIds:
      (json['selectedResistanceRiskIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  selectedOtherCriteriaIds:
      (json['selectedOtherCriteriaIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
);

Map<String, dynamic> _$$DiagnosisCriteriaStateImplToJson(
  _$DiagnosisCriteriaStateImpl instance,
) => <String, dynamic>{
  'heightCm': instance.heightCm,
  'weightKg': instance.weightKg,
  'serumCreatinine': instance.serumCreatinine,
  'confusion': instance.confusion,
  'urea': instance.urea,
  'respRate': instance.respRate,
  'sbp': instance.sbp,
  'dbp': instance.dbp,
  'age': instance.age,
  'pao2Fio2': instance.pao2Fio2,
  'selectedIcuCriteriaIds': instance.selectedIcuCriteriaIds.toList(),
  'selectedResistanceRiskIds': instance.selectedResistanceRiskIds.toList(),
  'selectedOtherCriteriaIds': instance.selectedOtherCriteriaIds.toList(),
};
