import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// Canned response for one mocked route.
class MockedResponse {
  const MockedResponse(this.status, this.body);

  final int status;
  final Map<String, dynamic> body;
}/// Offline [HttpClientAdapter] for widget tests: matches requests by
/// method + path (substring) against canned JSON envelopes, so flow tests
/// never touch the network (CI-safe).
class FakeApiAdapter implements HttpClientAdapter {
  FakeApiAdapter({Map<String, MockedResponse> overrides = const {}})
      : _handlers = {..._defaultHandlers, ...overrides};

  /// Key format: `'METHOD /api/1/...'` (path may be a substring of the
  /// real path; first matching entry wins).
  final Map<String, MockedResponse> _handlers;

  void add(String key, MockedResponse response) =>
      _handlers[key] = response;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    for (final entry in _handlers.entries) {
      final space = entry.key.indexOf(' ');
      final method = entry.key.substring(0, space);
      final path = entry.key.substring(space + 1);
      if (options.method == method && options.path.contains(path)) {
        return ResponseBody.fromString(
          jsonEncode(entry.value.body),
          entry.value.status,
          headers: _jsonHeaders,
        );
      }
    }
    return ResponseBody.fromString(
      jsonEncode({
        'statusCode': 404,
        'success': false,
        'message': 'Not mocked: ${options.method} ${options.path}',
      }),
      404,
      headers: _jsonHeaders,
    );
  }

  static const _jsonHeaders = {
    Headers.contentTypeHeader: [Headers.jsonContentType],
  };

  static Map<String, dynamic> envelope(Map<String, dynamic> data,
      {int code = 200}) =>
      {
        'statusCode': code,
        'success': true,
        'data': data,
      };

  /// Envelope with an array payload — mirrors list endpoints, which
  /// answer `data: [...]` directly (no wrapping key).
  static Map<String, dynamic> envelopeList(List<dynamic> data,
      {int code = 200}) =>
      {
        'statusCode': code,
        'success': true,
        'data': data,
      };

  // ── Default demo dataset (mirrors the retired demo providers) ──────

  static const _sampleDoctorId = '3fa85f64-5717-4562-b3fc-2c963f66afa6';

  static final Map<String, MockedResponse> _defaultHandlers = {
    'POST /api/1/auth/login': MockedResponse(
      200,
      envelope({
        'accessToken':
            'header.${base64Url.encode(utf8.encode(jsonEncode({'X-ID': _sampleDoctorId})))}.sig',
        'refreshToken': 'fake-refresh-token',
      }),
    ),
    'POST /api/1/auth/logout': MockedResponse(
      200,
      envelope({'message': 'Logout successful'}),
    ),
    'POST /api/1/auth/refresh': MockedResponse(
      200,
      envelope({
        'accessToken': 'fake-access-2',
        'refreshToken': 'fake-refresh-2',
      }),
    ),
    'GET /api/1/doctors/': MockedResponse(
      200,
      envelope({
        'email': 'bs.minh@respira.vn',
        'phone': '0900000000',
        'role': 'Doctor',
        'isEmailConfirmed': true,
        'status': 'Active',
        'firstName': 'Lê Hoàng',
        'lastName': 'Minh',
        'degrees': [],
        'academicTitle': 'BS.',
        'position': 'Doctor',
        'gender': 'Male',
        'citizenIdentificationNumber': '012345678901',
        'address': 'Cần Thơ',
      }),
    ),
    'GET /api/1/patients': MockedResponse(
      200,
      envelope({
        'metadata': {
          'hasNextPage': false,
          'hasPreviousPage': false,
          'totalItemCount': 2,
          'pageCount': 1,
          'currentPage': 1,
          'pageSize': 10,
        },
        'items': [
          _patient('Khoa', 'BA-2026-0001', 55, 'InTreatment'),
          _patient('An', 'BA-2026-0002', 47, 'InTreatment'),
        ],
      }),
    ),
    'POST /api/1/patients': MockedResponse(
      201,
      envelope({
        'id': '11111111-1111-1111-1111-111111111111',
      }),
    ),
    'GET /api/1/diseases/list': MockedResponse(
      200,
      envelopeList([
        {'id': 'disease-1', 'name': 'Viêm phổi cộng đồng'},
      ]),
    ),
    'GET /api/1/diseases/disease-1/criteria': MockedResponse(
      200,
      envelope({
        'icuHospitalizeCriteria': [
          {'id': 'icu-1', 'name': 'Cần thở máy xâm nhập', 'type': 'Boolean'},
          {'id': 'icu-2', 'name': 'Sốc nhiễm khuẩn', 'type': 'Boolean'},
        ],
        'resistanceRiskFactorCriteria': [
          {
            'id': 'rrf-1',
            'name': 'Dùng kháng sinh 90 ngày gần đây',
            'type': 'Boolean',
          },
          {'id': 'rrf-2', 'name': 'Nằm viện ≥ 5 ngày', 'type': 'Boolean'},
        ],
        'otherCriteria': [
          {'id': 'other-1', 'name': 'Không dung nạp thuốc', 'type': 'Boolean'},
        ],
      }),
    ),
    'POST /api/1/patients/': MockedResponse(
      204,
      envelope({}),
    ),
    'POST /api/1/diagnose/empirical': MockedResponse(
      200,
      envelope(_empiricalResult()),
    ),
    'POST /api/1/diagnose/target': MockedResponse(
      200,
      envelope({
        'crcl': 92.5,
        'medicines': [
          _medicine('Meropenem', 'Intravenous'),
          _medicine('Amoxicillin', 'Oral'),
          _medicine('Amikacin', 'Intravenous'),
        ],
      }),
    ),
    'GET /api/1/pathogens/list': MockedResponse(
      200,
      envelopeList([
        {'id': 'k-pneumoniae-id', 'name': 'Klebsiella pneumoniae'},
      ]),
    ),
  };

  static Map<String, dynamic> _patient(
    String name,
    String code,
    int age,
    String status,
  ) =>
      {
        'id': 'patient-$code',
        'fullName': name,
        'age': age,
        'isMale': true,
        'medicalRecordCode': code,
        'status': status,
      };

  static Map<String, dynamic> _medicine(
    String name,
    String route,
  ) =>
      {
        'id': 'med-$name',
        'name': name,
        'antibioticGroupId': 'group-1',
        'antibioticGroup': {'id': 'group-1', 'name': 'Beta-lactam'},
        'classification': 'Access',
        'dosages': [
          {'routeOfAdministration': route, 'dose': '1 g mỗi 8 giờ'},
        ],
      };

  static Map<String, dynamic> _empiricalResult() => {
        'crcl': 84.2,
        'severity': 'Severe',
        'treatmentSite': 'Inpatient',
        'medicines': [
          _medicine('Meropenem', 'Intravenous'),
          _medicine('Amoxicillin', 'Oral'),
        ],
        'infectionProbabilities': [
          {
            'pathogen': {
              'id': 'k-pneumoniae-id',
              'name': 'Klebsiella pneumoniae',
            },
            'probability': 0.72,
          },
        ],
        'references': [
          {
            'id': 'ref-1',
            'name': 'Phác đồ A · Viêm phổi cộng đồng',
            'issuer': 'Bộ Y tế',
            'issueDate': '2024-01-01',
            'version': 3,
          },
        ],
      };
}
