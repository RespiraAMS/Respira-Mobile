// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiseaseItemDtoImpl _$$DiseaseItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$DiseaseItemDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$DiseaseItemDtoImplToJson(
  _$DiseaseItemDtoImpl instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_$CriterionItemDtoImpl _$$CriterionItemDtoImplFromJson(
  Map<String, dynamic> json,
) => _$CriterionItemDtoImpl(
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$$CriterionItemDtoImplToJson(
  _$CriterionItemDtoImpl instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_$EntityRefDtoImpl _$$EntityRefDtoImplFromJson(Map<String, dynamic> json) =>
    _$EntityRefDtoImpl(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$$EntityRefDtoImplToJson(_$EntityRefDtoImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_$DiseaseCriteriaDtoImpl _$$DiseaseCriteriaDtoImplFromJson(
  Map<String, dynamic> json,
) => _$DiseaseCriteriaDtoImpl(
  icuHospitalizeCriteria:
      (json['icuHospitalizeCriteria'] as List<dynamic>?)
          ?.map((e) => CriterionItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  resistanceRiskFactorCriteria:
      (json['resistanceRiskFactorCriteria'] as List<dynamic>?)
          ?.map((e) => CriterionItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  otherCriteria:
      (json['otherCriteria'] as List<dynamic>?)
          ?.map((e) => CriterionItemDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$DiseaseCriteriaDtoImplToJson(
  _$DiseaseCriteriaDtoImpl instance,
) => <String, dynamic>{
  'icuHospitalizeCriteria': instance.icuHospitalizeCriteria,
  'resistanceRiskFactorCriteria': instance.resistanceRiskFactorCriteria,
  'otherCriteria': instance.otherCriteria,
};

_$PathogenItemDtoImpl _$$PathogenItemDtoImplFromJson(
  Map<String, dynamic> json,
) => _$PathogenItemDtoImpl(
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$$PathogenItemDtoImplToJson(
  _$PathogenItemDtoImpl instance,
) => <String, dynamic>{'id': instance.id, 'name': instance.name};

_$AntibioticResultDtoImpl _$$AntibioticResultDtoImplFromJson(
  Map<String, dynamic> json,
) => _$AntibioticResultDtoImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  antibioticGroupName: json['antibioticGroupName'] as String? ?? '',
  classification: json['classification'] as String? ?? '',
  dosages:
      (json['dosages'] as List<dynamic>?)
          ?.map((e) => DosageDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AntibioticResultDtoImplToJson(
  _$AntibioticResultDtoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'antibioticGroupName': instance.antibioticGroupName,
  'classification': instance.classification,
  'dosages': instance.dosages,
};

_$DosageDtoImpl _$$DosageDtoImplFromJson(Map<String, dynamic> json) =>
    _$DosageDtoImpl(
      routeOfAdministration: json['routeOfAdministration'] as String,
      dose: json['dose'] as String,
    );

Map<String, dynamic> _$$DosageDtoImplToJson(_$DosageDtoImpl instance) =>
    <String, dynamic>{
      'routeOfAdministration': instance.routeOfAdministration,
      'dose': instance.dose,
    };

_$InfectionProbabilityDtoImpl _$$InfectionProbabilityDtoImplFromJson(
  Map<String, dynamic> json,
) => _$InfectionProbabilityDtoImpl(
  pathogenId: json['pathogenId'] as String? ?? '',
  pathogenName: json['pathogenName'] as String? ?? '',
  probability: (json['probability'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$$InfectionProbabilityDtoImplToJson(
  _$InfectionProbabilityDtoImpl instance,
) => <String, dynamic>{
  'pathogenId': instance.pathogenId,
  'pathogenName': instance.pathogenName,
  'probability': instance.probability,
};

_$ReferenceDtoImpl _$$ReferenceDtoImplFromJson(Map<String, dynamic> json) =>
    _$ReferenceDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      issuer: json['issuer'] as String,
      version: (json['version'] as num).toInt(),
    );

Map<String, dynamic> _$$ReferenceDtoImplToJson(_$ReferenceDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'issuer': instance.issuer,
      'version': instance.version,
    };

_$EmpiricalDiagnoseResultDtoImpl _$$EmpiricalDiagnoseResultDtoImplFromJson(
  Map<String, dynamic> json,
) => _$EmpiricalDiagnoseResultDtoImpl(
  crcl: (json['crcl'] as num).toDouble(),
  severity: json['severity'] as String,
  treatmentSite: json['treatmentSite'] as String,
  medicines:
      (json['medicines'] as List<dynamic>?)
          ?.map((e) => AntibioticResultDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  infectionProbabilities:
      (json['infectionProbabilities'] as List<dynamic>?)
          ?.map(
            (e) => InfectionProbabilityDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  references:
      (json['references'] as List<dynamic>?)
          ?.map((e) => ReferenceDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$EmpiricalDiagnoseResultDtoImplToJson(
  _$EmpiricalDiagnoseResultDtoImpl instance,
) => <String, dynamic>{
  'crcl': instance.crcl,
  'severity': instance.severity,
  'treatmentSite': instance.treatmentSite,
  'medicines': instance.medicines,
  'infectionProbabilities': instance.infectionProbabilities,
  'references': instance.references,
};

_$TargetedDiagnoseResultDtoImpl _$$TargetedDiagnoseResultDtoImplFromJson(
  Map<String, dynamic> json,
) => _$TargetedDiagnoseResultDtoImpl(
  crcl: (json['crcl'] as num).toDouble(),
  medicines:
      (json['medicines'] as List<dynamic>?)
          ?.map((e) => AntibioticResultDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TargetedDiagnoseResultDtoImplToJson(
  _$TargetedDiagnoseResultDtoImpl instance,
) => <String, dynamic>{'crcl': instance.crcl, 'medicines': instance.medicines};
