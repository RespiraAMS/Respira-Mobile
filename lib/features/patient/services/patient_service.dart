import 'package:dio/dio.dart';

import '../../../core/network/api_response.dart';
import '../../../core/network/pagination_dto.dart';
import '../models/patient_dtos.dart';

/// Patient endpoints of Respira.Patient (`/api/1/patients/*`).
class PatientService {
  PatientService(this._dio);

  final Dio _dio;

  /// `GET /patients` — paged roster, optional name / record-code filter.
  Future<Paged<PatientListItemDto>> getPatients({
    int page = 1,
    int size = 10,
    String? fullName,
    String? medicalRecordCode,
  }) async {
    final res = await _dio.get(
      '/api/1/patients',
      queryParameters: {
        'page': page,
        'size': size,
        if (fullName != null && fullName.isNotEmpty) 'fullName': fullName,
        if (medicalRecordCode != null && medicalRecordCode.isNotEmpty)
          'medicalRecordCode': medicalRecordCode,
      },
    );
    final json = unwrapEnvelope(res);
    return Paged.fromJson(json, PatientListItemDto.fromJson);
  }

  /// `GET /patients/{id}` — full profile + treatment timeline.
  Future<PatientDetailDto> getPatient(String id) async {
    final res = await _dio.get('/api/1/patients/$id');
    return unwrapData(
      res,
      (json) => PatientDetailDto.fromJson(json),
    );
  }

  /// `POST /patients` — returns the created patient's ID.
  Future<String> createPatient({
    required String fullName,
    required String dateOfBirth, // yyyy-MM-dd
    required bool isMale,
    required String medicalRecordCode,
    required String healthInsuranceCardNumber,
    required String address,
    required String city,
    required String country,
  }) async {
    final res = await _dio.post(
      '/api/1/patients',
      data: {
        'fullName': fullName,
        'dateOfBirth': dateOfBirth,
        'isMale': isMale,
        'medicalRecordCode': medicalRecordCode,
        'healthInsuranceCardNumber': healthInsuranceCardNumber,
        'address': address,
        'city': city,
        'country': country,
      },
    );
    final created = unwrapData(
      res,
      (json) => CreatedPatientDto.fromJson(json),
    );
    return created.id;
  }

  /// `POST /patients/{patientId}/treatments` — persists one diagnosis
  /// record (202-style NoContent / empty body on success).
  Future<void> createTreatment(
    String patientId,
    CreateTreatmentRequest request,
  ) async {
    await _dio.post(
      '/api/1/patients/$patientId/treatments',
      data: request.toJson(),
    );
  }
}
