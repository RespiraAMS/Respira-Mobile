import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_dtos.freezed.dart';
part 'patient_dtos.g.dart';

/// `Domain.Enums.PatientStatus` (string-serialized, PascalCase on the wire).
enum PatientStatusDto {
  @JsonValue('InTreatment')
  inTreatment,
  @JsonValue('Recovered')
  recovered,
  @JsonValue('Death')
  death,
}

/// Row of `GET /patients` (`PagedPatientItem`).
@freezed
class PatientListItemDto with _$PatientListItemDto {
  const factory PatientListItemDto({
    required String id,
    required String fullName,
    required int age,
    required bool isMale,
    required String medicalRecordCode,
    required PatientStatusDto status,
  }) = _PatientListItemDto;

  factory PatientListItemDto.fromJson(Map<String, dynamic> json) =>
      _$PatientListItemDtoFromJson(json);
}

/// Result of `POST /patients` (`CreatePatientResult`).
@freezed
class CreatedPatientDto with _$CreatedPatientDto {
  const factory CreatedPatientDto({required String id}) = _CreatedPatientDto;

  factory CreatedPatientDto.fromJson(Map<String, dynamic> json) =>
      _$CreatedPatientDtoFromJson(json);
}

/// Result of `GET /patients/{id}` (`PatientResult` incl. treatments).
@freezed
class PatientDetailDto with _$PatientDetailDto {
  const factory PatientDetailDto({
    required String id,
    required String fullName,
    required String dateOfBirth,
    required bool isMale,
    required String medicalRecordCode,
    required String healthInsuranceCardNumber,
    required String address,
    required String city,
    required String country,
    required String admission,
    String? discharge,
    required PatientStatusDto status,
    @Default([]) List<TreatmentItemDto> treatments,
  }) = _PatientDetailDto;

  factory PatientDetailDto.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailDtoFromJson(json);
}

/// One treatment in the patient's timeline (`TreatmentResult`).
@freezed
class TreatmentItemDto with _$TreatmentItemDto {
  const factory TreatmentItemDto({
    required String id,
    required String start,
    required String treatmentType,
    required String status,
  }) = _TreatmentItemDto;

  factory TreatmentItemDto.fromJson(Map<String, dynamic> json) =>
      _$TreatmentItemDtoFromJson(json);
}

/// Body of `POST /patients/{id}/treatments` (`CreateTreatmentRequestDto`).
class CreateTreatmentRequest {
  CreateTreatmentRequest({
    required this.doctorId,
    required this.treatmentType,
    required this.crcl,
    required this.systemRecommendedMedicines,
    required this.doctorChosenMedicines,
    this.severity,
    this.treatmentSite,
    this.infectionProbabilityRecords = const [],
    this.pathogen,
    this.reasonForDifferentChoice,
  });

  final String doctorId;
  final String treatmentType; // EmpiricalTherapy | TargetedTherapy
  final double crcl;
  final List<Map<String, dynamic>> systemRecommendedMedicines;
  final List<Map<String, dynamic>> doctorChosenMedicines;
  final String? severity;
  final String? treatmentSite;
  final List<Map<String, dynamic>> infectionProbabilityRecords;
  final Map<String, dynamic>? pathogen;
  final String? reasonForDifferentChoice;

  Map<String, dynamic> toJson() => {
        'doctorId': doctorId,
        'treatmentType': treatmentType,
        'diagnosisRecord': {
          'crcl': crcl,
          'systemRecommendedMedicines': systemRecommendedMedicines,
          'doctorChosenMedicines': doctorChosenMedicines,
          if (severity != null) 'severity': severity,
          if (treatmentSite != null) 'treatmentSite': treatmentSite,
          if (infectionProbabilityRecords.isNotEmpty)
            'infectionProbabilityRecords': infectionProbabilityRecords,
          if (pathogen != null) 'pathogen': pathogen,
          if (reasonForDifferentChoice != null)
            'reasonForDifferentChoice': reasonForDifferentChoice,
        },
      };
}
