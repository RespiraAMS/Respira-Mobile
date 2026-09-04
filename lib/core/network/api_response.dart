import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Envelope every RespiraAMS endpoint answers with
/// (`Respira.ServiceDefaults.Dtos.ApiResponse<T>`).
@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required int statusCode,
    required bool success,
    String? message,
    T? data,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

/// Domain-specific failure surfaced from non-2xx or `success: false`
/// envelopes; controllers map it into error states (guidelines Rule 3/5).
class ApiException implements Exception {
  const ApiException(this.statusCode, this.message);

  final int statusCode;
  final String message;

  @override
  String toString() => 'ApiException($statusCode): $message';
}

/// True for statuses where a token refresh + retry can recover the call.
bool isAuthRetryable(int statusCode) =>
    statusCode == 401 || statusCode == 403;

/// Extracts the envelope's `data` as a typed value, throwing [ApiException]
/// on failure envelopes.
T unwrapData<T>(
  Response<dynamic> res,
  T Function(Map<String, dynamic> json) fromJson,
) {
  final json = res.data as Map<String, dynamic>;
  final success = json['success'] as bool? ?? false;
  if (!success) {
    throw ApiException(
      (json['statusCode'] as num?)?.toInt() ?? res.statusCode ?? 500,
      (json['message'] as String?) ?? 'Request failed',
    );
  }
  final data = json['data'];
  if (data == null) {
    throw ApiException(res.statusCode ?? 500, 'Empty response data');
  }
  return fromJson(data as Map<String, dynamic>);
}

/// Extracts the envelope's `data` field uncast (list endpoints answer
/// with a JSON array, object endpoints with a map). Throws [ApiException]
/// on failure envelopes.
Object? unwrapDataField(Response<dynamic> res) {
  final json = res.data as Map<String, dynamic>;
  final success = json['success'] as bool? ?? false;
  if (!success) {
    throw ApiException(
      (json['statusCode'] as num?)?.toInt() ?? res.statusCode ?? 500,
      (json['message'] as String?) ?? 'Request failed',
    );
  }
  return json['data'];
}

/// Extracts the whole envelope's `data` field (for non-single-object
/// payloads such as lists or tokens maps).
Map<String, dynamic> unwrapEnvelope(Response<dynamic> res) {
  final json = res.data as Map<String, dynamic>;
  final success = json['success'] as bool? ?? false;
  if (!success) {
    throw ApiException(
      (json['statusCode'] as num?)?.toInt() ?? res.statusCode ?? 500,
      (json['message'] as String?) ?? 'Request failed',
    );
  }
  return (json['data'] as Map<String, dynamic>? ?? {});
}
