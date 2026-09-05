import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/core/network/api_response.dart';

/// Unit tests for [apiErrorMessage] — the user-facing mapper for Dio
/// failures. Covers envelope bodies (camel/PascalCase), ProblemDetails,
/// and every status/type-aware fallback.

DioException _err({
  Object? data,
  int? status,
  DioExceptionType type = DioExceptionType.badResponse,
}) {
  final options = RequestOptions(path: '/api/1/test');
  return DioException(
    requestOptions: options,
    type: type,
    response: status == null
        ? null
        : Response<dynamic>(
            requestOptions: options,
            statusCode: status,
            data: data,
          ),
  );
}

void main() {
  test('surfaces camelCase envelope message', () {
    final message = apiErrorMessage(_err(
      data: {
        'statusCode': 400,
        'success': false,
        'message': 'Bad request: Invalid diagnosis record',
      },
      status: 400,
    ));
    expect(message, 'Bad request: Invalid diagnosis record');
  });

  test('surfaces PascalCase envelope message', () {
    final message = apiErrorMessage(_err(
      data: {'StatusCode': 500, 'Success': false, 'Message': 'Server fault'},
      status: 500,
    ));
    expect(message, 'Server fault');
  });

  test('surfaces ProblemDetails title', () {
    final message = apiErrorMessage(_err(
      data: {'title': 'One or more validation errors occurred.'},
      status: 400,
    ));
    expect(message, 'One or more validation errors occurred.');
  });

  test('429 with a non-envelope body maps to the rate-limit message', () {
    final message = apiErrorMessage(_err(data: {'error': 'Too many'}, status: 429));
    expect(message, contains('Quá nhiều yêu cầu'));
  });

  test('401 without a body maps to the session-expiry message', () {
    final message = apiErrorMessage(_err(data: '', status: 401));
    expect(message, contains('Phiên đăng nhập'));
  });

  test('5xx without a body maps to the server-fault message', () {
    final message = apiErrorMessage(_err(data: null, status: 502));
    expect(message, 'Lỗi máy chủ (502). Vui lòng thử lại sau.');
  });

  test('receiveTimeout maps to the timeout message', () {
    final message = apiErrorMessage(_err(type: DioExceptionType.receiveTimeout));
    expect(message, contains('Hết thời gian chờ'));
  });

  test('connection error maps to the connection message', () {
    final message =
        apiErrorMessage(_err(type: DioExceptionType.connectionError));
    expect(message, contains('Không thể kết nối máy chủ'));
  });
}
