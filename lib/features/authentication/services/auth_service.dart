import 'package:dio/dio.dart';

import '../../../core/network/api_response.dart';
import '../../../core/network/token_storage.dart';
import '../../../core/utils/jwt.dart';

/// Auth endpoints of Respira.Auth (`/api/1/auth/*`).
/// Uses the shared (mockable) Dio and [TokenStorage].
class AuthService {
  AuthService(this._dio, this._storage);

  final Dio _dio;
  final TokenStorage _storage;

  /// Logs in with email/password, persists the token pair and the
  /// doctorId parsed from the JWT `X-ID` claim.
  /// Returns the doctor's display-name source (email) on success.
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final res = await _dio.post(
      '/api/1/auth/login',
      data: {'email': email, 'password': password},
    );
    final tokens = unwrapEnvelope(res);
    final access = tokens['accessToken'] as String?;
    final refresh = tokens['refreshToken'] as String?;
    if (access == null || refresh == null) {
      throw const ApiException(500, 'Malformed login response');
    }
    await _storage.save(accessToken: access, refreshToken: refresh);

    final doctorId = doctorIdFromToken(access) ?? '';
    await _storage.saveDoctor(id: doctorId, name: email);
    return email;
  }

  /// Revokes the current session server-side (idempotent) and clears
  /// local storage. Best-effort: local session always ends.
  Future<void> logout() async {
    final access = _storage.accessToken;
    final refresh = _storage.refreshToken;
    try {
      if (access != null && refresh != null) {
        await _dio.post(
          '/api/1/auth/logout',
          data: {'accessToken': access, 'refreshToken': refresh},
        );
      }
    } on DioException {
      // Idempotent server-side; ignore transport failures.
    } finally {
      await _storage.clear();
    }
  }
}
