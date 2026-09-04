import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'token_storage.dart';

/// Base URL of the RespiraAMS gateway (YARP). Override with
/// `--dart-define=API_BASE_URL=https://...` for other environments.
///
/// Defaults to the gateway's HTTPS endpoint — its HTTP port only 307-
/// redirects back here, and the Aspire dev certificate (`CN=localhost`)
/// is trusted on developer machines. Debug builds additionally accept
/// self-signed certs so emulators (`10.0.2.2`) and LAN devices work.
const String kApiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'https://localhost:7283',
);

const String kApiVersion = '1';

/// Base options shared by every Dio instance in the app.
BaseOptions gatewayBaseOptions({String? baseUrl}) => BaseOptions(
      baseUrl: baseUrl ?? kApiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 20),
      headers: {'Accept': 'application/json'},
    );

/// Trusts the .NET dev certificate in debug builds only (Aspire's
/// `CN=localhost` cert fails hostname validation for `10.0.2.2` / LAN
/// IPs). Release builds keep strict TLS validation.
void attachDebugTrust(Dio dio) {
  if (!kDebugMode) return;
  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () => HttpClient()
      ..badCertificateCallback = (cert, host, port) => true,
  );
}

/// Raw Dio instance shared by every service. Handles:
/// 1. Bearer header injection from [TokenStorage]
/// 2. Single-flight 401/403 recovery: POST /auth/refresh then retry once
final Provider<Dio> apiClientProvider = Provider<Dio>((ref) {
  final storage = TokenStorage(ref.watch(sharedPreferencesProvider));
  final dio = Dio(gatewayBaseOptions());
  attachDebugTrust(dio);

  dio.interceptors.add(
    InterceptorsWrapper(
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
          final retried = await refreshAndRetry(dio, storage, error);
          return handler.resolve(retried);
        }
        handler.next(error);
      },
    ),
  );

  return dio;
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Override in ProviderScope/bootstrap');
});

/// Single refresh call shared by every client; parallel 401s trigger
/// only one `POST /auth/refresh`.
Future<Response<dynamic>>? _refreshing;

/// Recovers from a 401/403 by refreshing the token pair and retrying the
/// original request once. Throws the original [DioException] when the
/// retried request fails again (after clearing the session).
Future<Response<dynamic>> refreshAndRetry(
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

Future<Response<dynamic>> _performRefresh(Dio dio, TokenStorage storage) {
  final refreshDio = Dio(gatewayBaseOptions());
  attachDebugTrust(refreshDio);
  return refreshDio.post(
    '/api/$kApiVersion/auth/refresh',
    data: {'refreshToken': storage.refreshToken},
  );
}

/// Builds a Dio pre-configured for an unauthenticated call (login).
Dio unauthenticatedDio() {
  final dio = Dio(gatewayBaseOptions());
  attachDebugTrust(dio);
  return dio;
}

/// Compatibility client for lookup-feature repositories
/// (`AntibioticRepository`, `PathogenRepository`, …).
///
/// Builds a [Dio] with the `/api/1` base appended so their relative paths
/// (`/antibiotics`, `/pathogens`, …) resolve against the gateway. The
/// default instance is fully auth-aware — bearer injection, single-flight
/// 401/403 refresh recovery and debug TLS trust — because the lookup
/// screens construct it outside any Riverpod scope.
class ApiClient {
  final Dio dio;

  ApiClient({Dio? dioOverride}) : dio = _buildDio(dioOverride);

  static Dio _buildDio(Dio? dioOverride) {
    if (dioOverride != null) return dioOverride;
    final dio =
        Dio(gatewayBaseOptions(baseUrl: '$kApiBaseUrl/api/$kApiVersion'));
    attachDebugTrust(dio);
    dio.interceptors.add(_authInterceptor(dio));
    return dio;
  }

  /// Bearer injection + refresh recovery for instances that load their
  /// own [TokenStorage] (constructed without a Riverpod scope).
  static InterceptorsWrapper _authInterceptor(Dio dio) {
    Future<TokenStorage> loadStorage() async =>
        TokenStorage(await SharedPreferences.getInstance());

    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = (await loadStorage()).accessToken;
        // Login/refresh/verify-email must go out unauthenticated.
        final isAuthRoute = options.path.contains('/auth/');
        if (token != null && token.isNotEmpty && !isAuthRoute) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        final status = error.response?.statusCode;
        final isAuthRoute = error.requestOptions.path.contains('/auth/');
        if ((status == 401 || status == 403) && !isAuthRoute) {
          final storage = await loadStorage();
          if (storage.refreshToken != null) {
            try {
              final retried = await refreshAndRetry(dio, storage, error);
              return handler.resolve(retried);
            } on DioException {
              // Refresh failed — tokens were cleared; surface the
              // original error instead.
            }
          }
        }
        handler.next(error);
      },
    );
  }
}
