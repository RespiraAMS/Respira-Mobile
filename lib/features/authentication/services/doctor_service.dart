import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_client.dart';

import '../../../../core/network/api_response.dart';

/// Doctor profile + list endpoints of Respira.Doctor
/// (`/api/1/doctors/*`).
class DoctorService {
  DoctorService(this._dio);

  final Dio _dio;

  /// `GET /doctors/{id}` — profile used to enrich the session.
  Future<DoctorProfileDto> getDoctor(String id) async {
    final res = await _dio.get('/api/1/doctors/$id');
    return unwrapData(res, DoctorProfileDto.fromJson);
  }
}

class DoctorProfileDto {
  DoctorProfileDto({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.url,
  });

  factory DoctorProfileDto.fromJson(Map<String, dynamic> json) {
    return DoctorProfileDto(
      email: json['email'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      url: json['url'] as String?,
    );
  }

  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String? url;
}

/// DI'd with the shared authenticated Dio.
final doctorServiceProvider = Provider<DoctorService>(
  (ref) => DoctorService(ref.watch(apiClientProvider)),
);
