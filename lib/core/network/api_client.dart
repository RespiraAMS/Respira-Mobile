import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'token_storage.dart';

/// Base URL of the RespiraAMS gateway (YARP). Override with
/// `--dart-define=API_BASE_URL=https://...` for other environments.
const String kApiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://localhost:5016',
);

const String kApiVersion = '1';

/// Raw Dio instance shared by every service. Handles:
/// 1. Bearer header injection from [TokenStorage]
/// 2. Single-flight 401/403 recovery: POST /auth/refresh then retry once
final Provider<Dio> apiClientProvider = Provider<Dio>((ref) {
  final storage = TokenStorage(ref.watch(sharedPreferencesProvider));
  final dio = Dio(BaseOptions(
    baseUrl: kApiBaseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 20),
    headers: {'Accept': 'application/json'},
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = storage.accessToken;
      // Login/refresh/verify-email must go out unauthenticated.
      final isAuthRoute = options.path.contains('/auth/');
      if (token != null && !isAuthRoute) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
    },
    onError: (error, handler) async {
      final status = error.response?.statusCode;
      final isAuthRoute = error.requestOptions.path.contains('/auth/');

      if ((status == 401 || status == 403) &&
          !isAuthRoute &&
          storage.refreshToken != null) {
        final retried = await _refreshAndRetry(dio, storage, error);
        return handler.resolve(retried);
      }
      handler.next(error);
    },
  ));

  return dio;
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Override in ProviderScope/bootstrap');
});

/// Guard so parallel 401s trigger a single refresh call.
Future<Response<dynamic>>? _refreshing;

Future<Response<dynamic>> _refreshAndRetry(
  Dio dio,
  TokenStorage storage,
  DioException error,
) async {
  final requestOptions = error.requestOptions;

  // A retried request failing again must not loop.
  if (requestOptions.extra['__retried'] == true) {
    await storage.clear();
    throw error;
  }

  try {
    _refreshing ??= _performRefresh(dio, storage);
    final refreshResponse = await _refreshing!;
    final data = refreshResponse.data as Map<String, dynamic>;
    final tokens = data['data'] as Map<String, dynamic>;
    final access = tokens['accessToken'] as String;
    final refresh = tokens['refreshToken'] as String;
    await storage.save(accessToken: access, refreshToken: refresh);
    requestOptions.headers['Authorization'] = 'Bearer $access';
    requestOptions.extra['__retried'] = true;
    return dio.fetch(requestOptions);
  } on DioException {
    await storage.clear();
    rethrow;
  } finally {
    _refreshing = null;
  }
}

Future<Response<dynamic>> _performRefresh(
  Dio dio,
  TokenStorage storage,
) {
  final refreshDio = Dio(BaseOptions(baseUrl: kApiBaseUrl));
  return refreshDio.post(
    '/api/$kApiVersion/auth/refresh',
    data: {'refreshToken': storage.refreshToken},
  );
}

/// Builds a Dio pre-configured for an unauthenticated call (login).
Dio unauthenticatedDio() => Dio(BaseOptions(baseUrl: kApiBaseUrl));
