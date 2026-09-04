// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientListItemDtoImpl _$$PatientListItemDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PatientListItemDtoImpl(
  id: json['id'] as String,
  fullName: json['fullName'] as String,
  age: (json['age'] as num).toInt(),
  isMale: json['isMale'] as bool,
  medicalRecordCode: json['medicalRecordCode'] as String,
  status: $enumDecode(_$PatientStatusDtoEnumMap, json['status']),
);

Map<String, dynamic> _$$PatientListItemDtoImplToJson(
  _$PatientListItemDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'age': instance.age,
  'isMale': instance.isMale,
  'medicalRecordCode': instance.medicalRecordCode,
  'status': _$PatientStatusDtoEnumMap[instance.status]!,
};

const _$PatientStatusDtoEnumMap = {
  PatientStatusDto.inTreatment: 'InTreatment',
  PatientStatusDto.recovered: 'Recovered',
  PatientStatusDto.death: 'Death',
};

_$CreatedPatientDtoImpl _$$CreatedPatientDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CreatedPatientDtoImpl(id: json['id'] as String);

Map<String, dynamic> _$$CreatedPatientDtoImplToJson(
  _$CreatedPatientDtoImpl instance,
) => <String, dynamic>{'id': instance.id};

_$PatientDetailDtoImpl _$$PatientDetailDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PatientDetailDtoImpl(
  id: json['id'] as String,
  fullName: json['fullName'] as String,
  dateOfBirth: json['dateOfBirth'] as String,
  isMale: json['isMale'] as bool,
  medicalRecordCode: json['medicalRecordCode'] as String,
  healthInsuranceCardNumber: json['healthInsuranceCardNumber'] as String,
  address: json['address'] as String,
  city: json['city'] as String,
  country: json['country'] as String,
  admission: json['admission'] as String,
  discharge: json['discharge'] as String?,
  status: $enumDecode(_$PatientStatusDtoEnumMap, json['status']),
  treatments:
      (json['treatments'] as List<dynamic>?)
          ?.map((e) => TreatmentItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$PatientDetailDtoImplToJson(
  _$PatientDetailDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'dateOfBirth': instance.dateOfBirth,
  'isMale': instance.isMale,
  'medicalRecordCode': instance.medicalRecordCode,
  'healthInsuranceCardNumber': instance.healthInsuranceCardNumber,
  'address': instance.address,
  'city': instance.city,
  'country': instance.country,
  'admission': instance.admission,
  'discharge': instance.discharge,
  'status': _$PatientStatusDtoEnumMap[instance.status]!,
  'treatments': instance.treatments,
};

_$TreatmentItemDtoImpl _$$TreatmentItemDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TreatmentItemDtoImpl(
  id: json['id'] as String,
  start: json['start'] as String,
  treatmentType: json['treatmentType'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$$TreatmentItemDtoImplToJson(
  _$TreatmentItemDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'start': instance.start,
  'treatmentType': instance.treatmentType,
  'status': instance.status,
};
