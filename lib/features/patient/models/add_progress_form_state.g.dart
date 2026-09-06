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
);

Map<String, dynamic> _$$AddProgressFormStateImplToJson(
  _$AddProgressFormStateImpl instance,
) => <String, dynamic>{
  'treatmentType': _$TreatmentTypeEnumMap[instance.treatmentType]!,
};

const _$TreatmentTypeEnumMap = {
  TreatmentType.empirical: 'empirical',
  TreatmentType.targeted: 'targeted',
};
