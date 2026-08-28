// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosisCriteriaStateImpl _$$DiagnosisCriteriaStateImplFromJson(
  Map<String, dynamic> json,
) => _$DiagnosisCriteriaStateImpl(
  selectedCurb65Criteria:
      (json['selectedCurb65Criteria'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$Curb65CriterionEnumMap, e))
          .toSet() ??
      const <Curb65Criterion>{
        Curb65Criterion.confusion,
        Curb65Criterion.highUrea,
        Curb65Criterion.ageOver65,
      },
  selectedIcuCriteria:
      (json['selectedIcuCriteria'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$IcuCriterionEnumMap, e))
          .toSet() ??
      const <IcuCriterion>{IcuCriterion.pao2fio2Low},
  selectedResistanceRisks:
      (json['selectedResistanceRisks'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ResistanceRiskFactorEnumMap, e))
          .toSet() ??
      const <ResistanceRiskFactor>{ResistanceRiskFactor.recentAntibiotics},
);

Map<String, dynamic> _$$DiagnosisCriteriaStateImplToJson(
  _$DiagnosisCriteriaStateImpl instance,
) => <String, dynamic>{
  'selectedCurb65Criteria': instance.selectedCurb65Criteria
      .map((e) => _$Curb65CriterionEnumMap[e]!)
      .toList(),
  'selectedIcuCriteria': instance.selectedIcuCriteria
      .map((e) => _$IcuCriterionEnumMap[e]!)
      .toList(),
  'selectedResistanceRisks': instance.selectedResistanceRisks
      .map((e) => _$ResistanceRiskFactorEnumMap[e]!)
      .toList(),
};

const _$Curb65CriterionEnumMap = {
  Curb65Criterion.confusion: 'confusion',
  Curb65Criterion.highUrea: 'highUrea',
  Curb65Criterion.tachypnea: 'tachypnea',
  Curb65Criterion.hypotension: 'hypotension',
  Curb65Criterion.ageOver65: 'ageOver65',
};

const _$IcuCriterionEnumMap = {
  IcuCriterion.invasiveVentilation: 'invasiveVentilation',
  IcuCriterion.septicShock: 'septicShock',
  IcuCriterion.pao2fio2Low: 'pao2fio2Low',
};

const _$ResistanceRiskFactorEnumMap = {
  ResistanceRiskFactor.recentAntibiotics: 'recentAntibiotics',
  ResistanceRiskFactor.prolongedHospitalization: 'prolongedHospitalization',
};
