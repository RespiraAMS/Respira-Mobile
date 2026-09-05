import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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

/// Best-effort human message from a [DioException].
///
/// Order of precedence:
/// 1. A message from the response body — camelCase envelope (`message`),
///    PascalCase (`Message`) or ProblemDetails (`title`/`detail`).
/// 2. A status/type-aware fallback: 429 rate-limit, 401 session expiry,
///    5xx server fault, timeout/connection failure.
///
/// Never shows raw exception text to the user; in debug builds the full
/// failure (method, URL, status, type, body) is printed for diagnosis.
String apiErrorMessage(DioException error) {
  if (kDebugMode) {
    debugPrint(
      'API failure ${error.requestOptions.method} '
      '${error.requestOptions.uri} → '
      'type=${error.type} status=${error.response?.statusCode} '
      'body=${error.response?.data}',
    );
  }

  final data = error.response?.data;
  if (data is Map) {
    for (final key in ['message', 'Message', 'detail', 'title']) {
      final value = data[key];
      if (value is String && value.trim().isNotEmpty) return value;
    }
  }
  if (data is String && data.trim().isNotEmpty && !data.contains('<')) {
    return data.trim();
  }

  final status = error.response?.statusCode;
  switch (error.type) {
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return 'Hết thời gian chờ máy chủ. Vui lòng thử lại.';
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.connectionError:
      return 'Không thể kết nối máy chủ. Vui lòng thử lại.';
    default:
      break;
  }
  if (status != null) {
    if (status == 429) {
      return 'Quá nhiều yêu cầu trong phút này. '
          'Vui lòng đợi khoảng một phút rồi thử lại.';
    }
    if (status == 401) {
      return 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.';
    }
    if (status == 403) {
      return 'Bạn không có quyền thực hiện thao tác này.';
    }
    if (status >= 500) {
      return 'Lỗi máy chủ ($status). Vui lòng thử lại sau.';
    }
    if (status >= 400) {
      return 'Yêu cầu không hợp lệ ($status).';
    }
  }
  return 'Không thể kết nối máy chủ.';
}

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
