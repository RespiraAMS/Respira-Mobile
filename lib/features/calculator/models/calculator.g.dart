// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Curb65InputImpl _$$Curb65InputImplFromJson(Map<String, dynamic> json) =>
    _$Curb65InputImpl(
      confusion: json['confusion'] as bool? ?? false,
      urea: json['urea'] as String? ?? '',
      respRate: json['respRate'] as String? ?? '',
      sbp: json['sbp'] as String? ?? '',
      dbp: json['dbp'] as String? ?? '',
      age: json['age'] as String? ?? '',
    );

Map<String, dynamic> _$$Curb65InputImplToJson(_$Curb65InputImpl instance) =>
    <String, dynamic>{
      'confusion': instance.confusion,
      'urea': instance.urea,
      'respRate': instance.respRate,
      'sbp': instance.sbp,
      'dbp': instance.dbp,
      'age': instance.age,
    };
