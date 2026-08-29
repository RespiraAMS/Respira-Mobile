// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_patient_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddPatientFormStateImpl _$$AddPatientFormStateImplFromJson(
  Map<String, dynamic> json,
) => _$AddPatientFormStateImpl(
  name: json['name'] as String? ?? '',
  code: json['code'] as String? ?? '',
  dob: json['dob'] as String? ?? '',
  gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']) ?? Gender.nam,
  insurance: json['insurance'] as String? ?? '',
  address: json['address'] as String? ?? '',
);

Map<String, dynamic> _$$AddPatientFormStateImplToJson(
  _$AddPatientFormStateImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'code': instance.code,
  'dob': instance.dob,
  'gender': _$GenderEnumMap[instance.gender]!,
  'insurance': instance.insurance,
  'address': instance.address,
};

const _$GenderEnumMap = {Gender.nam: 'nam', Gender.nu: 'nu'};
