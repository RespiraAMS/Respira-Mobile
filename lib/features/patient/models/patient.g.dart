// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String,
      code: json['code'] as String,
      dob: json['dob'] as String,
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      insurance: json['insurance'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'dob': instance.dob,
      'gender': _$GenderEnumMap[instance.gender]!,
      'insurance': instance.insurance,
      'address': instance.address,
    };

const _$GenderEnumMap = {Gender.nam: 'nam', Gender.nu: 'nu'};
