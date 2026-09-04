import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinical_dtos.freezed.dart';
part 'clinical_dtos.g.dart';

/// `GET /diseases/list` item.
@freezed
class DiseaseItemDto with _$DiseaseItemDto {
  const factory DiseaseItemDto({required String id, required String name}) =
      _DiseaseItemDto;

  factory DiseaseItemDto.fromJson(Map<String, dynamic> json) =>
      _$DiseaseItemDtoFromJson(json);
}

/// One criterion of a disease's wizard steps (`CriterionItem`).
@freezed
class CriterionItemDto with _$CriterionItemDto {
  const factory CriterionItemDto({required String id, required String name}) =
      _CriterionItemDto;

  factory CriterionItemDto.fromJson(Map<String, dynamic> json) =>
      _$CriterionItemDtoFromJson(json);
}

/// `GET /diseases/{id}/criteria` — the three wizard check-lists.
@freezed
class DiseaseCriteriaDto with _$DiseaseCriteriaDto {
  const factory DiseaseCriteriaDto({
    @Default([]) List<CriterionItemDto> icuHospitalizeCriteria,
    @Default([]) List<CriterionItemDto> resistanceRiskFactorCriteria,
    @Default([]) List<CriterionItemDto> otherCriteria,
  }) = _DiseaseCriteriaDto;

  factory DiseaseCriteriaDto.fromJson(Map<String, dynamic> json) =>
      _$DiseaseCriteriaDtoFromJson(json);
}

/// `GET /pathogens/list` item.
@freezed
class PathogenItemDto with _$PathogenItemDto {
  const factory PathogenItemDto({required String id, required String name}) =
      _PathogenItemDto;

  factory PathogenItemDto.fromJson(Map<String, dynamic> json) =>
      _$PathogenItemDtoFromJson(json);
}

/// One recommended antibiotic (`AntibioticResult`).
@freezed
class AntibioticResultDto with _$AntibioticResultDto {
  const factory AntibioticResultDto({
    required String id,
    required String name,
    required String antibioticGroupName,
    required String classification,
    @Default([]) List<DosageDto> dosages,
  }) = _AntibioticResultDto;

  factory AntibioticResultDto.fromJson(Map<String, dynamic> json) =>
      _$AntibioticResultDtoFromJson(json);
}

/// Adjusted dose of one antibiotic (`DosageResult`).
@freezed
class DosageDto with _$DosageDto {
  const factory DosageDto({
    required String routeOfAdministration,
    required String dose,
  }) = _DosageDto;

  factory DosageDto.fromJson(Map<String, dynamic> json) =>
      _$DosageDtoFromJson(json);
}

/// Infection probability (`InfectionProbability`).
@freezed
class InfectionProbabilityDto with _$InfectionProbabilityDto {
  const factory InfectionProbabilityDto({
    required String pathogenId,
    required String pathogenName,
    required double probability,
  }) = _InfectionProbabilityDto;

  factory InfectionProbabilityDto.fromJson(Map<String, dynamic> json) =>
      _$InfectionProbabilityDtoFromJson(json);
}

/// Reference protocol (`EmpiricalTreatmentProtocolResult`).
@freezed
class ReferenceDto with _$ReferenceDto {
  const factory ReferenceDto({
    required String id,
    required String name,
    required String issuer,
    required int version,
  }) = _ReferenceDto;

  factory ReferenceDto.fromJson(Map<String, dynamic> json) =>
      _$ReferenceDtoFromJson(json);
}

/// `POST /diagnose/empirical` response.
@freezed
class EmpiricalDiagnoseResultDto with _$EmpiricalDiagnoseResultDto {
  const factory EmpiricalDiagnoseResultDto({
    required double crcl,
    required String severity, // Mild | Moderate | Severe
    required String treatmentSite, // Outpatient | Inpatient | IntensiveCareUnit
    @Default([]) List<AntibioticResultDto> recommendations,
    @Default([]) List<AntibioticResultDto> medicines,
    @Default([]) List<InfectionProbabilityDto> infectionProbabilities,
    @Default([]) List<ReferenceDto> references,
  }) = _EmpiricalDiagnoseResultDto;

  factory EmpiricalDiagnoseResultDto.fromJson(Map<String, dynamic> json) =>
      _$EmpiricalDiagnoseResultDtoFromJson(json);
}

/// `POST /diagnose/target` response.
@freezed
class TargetedDiagnoseResultDto with _$TargetedDiagnoseResultDto {
  const factory TargetedDiagnoseResultDto({
    required double crcl,
    @Default([]) List<AntibioticResultDto> recommendations,
  }) = _TargetedDiagnoseResultDto;

  factory TargetedDiagnoseResultDto.fromJson(Map<String, dynamic> json) =>
      _$TargetedDiagnoseResultDtoFromJson(json);
}

/// Body of `POST /diagnose/empirical` (`EmpiricalDiagnoseQuery`).
class EmpiricalDiagnoseRequest {
  EmpiricalDiagnoseRequest({
    required this.diseaseId,
    required this.dateOfBirth, // yyyy-MM-dd
    required this.isMale,
    required this.weight, // kg
    required this.height, // meters
    required this.serumCreatine,
    required this.confusion,
    required this.respiratory,
    required this.systolicBloodPressure,
    required this.diastolicBloodPressure,
    required this.icuHospitalizeCriteria,
    required this.resistanceRiskFactors,
    required this.otherCriteria,
    this.urea,
  });

  final String diseaseId;
  final String dateOfBirth;
  final bool isMale;
  final double weight;
  final double height;
  final double serumCreatine;
  final bool confusion;
  final double? urea;
  final int respiratory;
  final double systolicBloodPressure;
  final double diastolicBloodPressure;
  final List<String> icuHospitalizeCriteria;
  final List<String> resistanceRiskFactors;
  final List<String> otherCriteria;

  Map<String, dynamic> toJson() => {
        'diseaseId': diseaseId,
        'dateOfBirth': dateOfBirth,
        'isMale': isMale,
        'weight': weight,
        'height': height,
        'serumCreatine': serumCreatine,
        'confusion': confusion,
        if (urea != null) 'urea': urea,
        'respiratory': respiratory,
        'systolicBloodPressure': systolicBloodPressure,
        'diastolicBloodPressure': diastolicBloodPressure,
        'icuHospitalizeCriteria': icuHospitalizeCriteria,
        'resistanceRiskFactors': resistanceRiskFactors,
        'otherCriteria': otherCriteria,
      };
}

/// Body of `POST /diagnose/target` (`TargetedDiagnoseQuery`).
class TargetedDiagnoseRequest {
  TargetedDiagnoseRequest({
    required this.pathogenId,
    required this.dateOfBirth, // yyyy-MM-dd
    required this.isMale,
    required this.weight, // kg
    required this.height, // meters
    required this.serumCreatine,
  });

  final String pathogenId;
  final String dateOfBirth;
  final bool isMale;
  final double weight;
  final double height;
  final double serumCreatine;

  Map<String, dynamic> toJson() => {
        'pathogenId': pathogenId,
        'dateOfBirth': dateOfBirth,
        'isMale': isMale,
        'weight': weight,
        'height': height,
        'serumCreatine': serumCreatine,
      };
}

/// Body of `POST /patients/{id}/treatments` `pathogen` field
/// (`PathogenRecord`).
class PathogenRecordDto {
  PathogenRecordDto({required this.id, required this.name});

  final String id;
  final String name;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

/// Body of `POST /patients/{id}/treatments` medicine record
/// (`MedicineRecord`).
class MedicineRecordDto {
  MedicineRecordDto({
    required this.id,
    required this.name,
    required this.classification,
    required this.routeOfAdministration,
    required this.dose,
  });

  final String id;
  final String name;
  final String classification;
  final String routeOfAdministration;
  final String dose;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'classification': classification,
        'routeOfAdministration': routeOfAdministration,
        'dose': dose,
      };
}
