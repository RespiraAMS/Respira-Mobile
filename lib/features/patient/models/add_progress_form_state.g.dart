// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_progress_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddProgressFormStateImpl _$$AddProgressFormStateImplFromJson(
  Map<String, dynamic> json,
) => _$AddProgressFormStateImpl(
  treatmentType:
      $enumDecodeNullable(_$TreatmentTypeEnumMap, json['treatmentType']) ??
      TreatmentType.empirical,
  microbiologyResult: json['microbiologyResult'] as bool? ?? true,
  poorResponse: json['poorResponse'] as bool? ?? false,
);

Map<String, dynamic> _$$AddProgressFormStateImplToJson(
  _$AddProgressFormStateImpl instance,
) => <String, dynamic>{
  'treatmentType': _$TreatmentTypeEnumMap[instance.treatmentType]!,
  'microbiologyResult': instance.microbiologyResult,
  'poorResponse': instance.poorResponse,
};

const _$TreatmentTypeEnumMap = {
  TreatmentType.empirical: 'empirical',
  TreatmentType.targeted: 'targeted',
};
