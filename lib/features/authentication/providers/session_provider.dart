import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../../../core/network/token_storage.dart';
import '../services/auth_service.dart';
import '../services/doctor_service.dart';

part 'session_provider.g.dart';

/// Logged-in doctor identity shown on headers.
class DoctorProfile {
  const DoctorProfile({
    required this.id,
    required this.name,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final String? avatarUrl;
}

/// Holds the active session (null = logged out). The login screen drives
/// [login]; the app header's logout button drives [logout].
@Riverpod(keepAlive: true)
class SessionController extends _$SessionController {
  @override
  DoctorProfile? build() => _restore();

  DoctorProfile? _restore() {
    final storage = TokenStorage(ref.read(sharedPreferencesProvider));
    final id = storage.doctorId;
    final name = storage.doctorName;
    if (!storage.hasSession || id == null) return null;
    return DoctorProfile(id: id, name: name ?? id);
  }

  /// Calls the API, persists tokens, resolves the doctorId from the JWT
  /// `X-ID` claim and enriches the profile via the Doctor service.
  /// Throws [ApiException] on failure (guidelines Rule 3).
  Future<DoctorProfile> login({
    required String email,
    required String password,
  }) async {
    final service = AuthService(
      ref.read(apiClientProvider),
      TokenStorage(ref.read(sharedPreferencesProvider)),
    );
    final fallbackName = await service.login(email: email, password: password);

    final storage = TokenStorage(ref.read(sharedPreferencesProvider));
    final doctorId = storage.doctorId ?? '';

    // Enrich with the real profile (best-effort — fall back to email).
    var name = fallbackName;
    String? avatar;
    try {
      final profile = await ref
          .read(doctorServiceProvider)
          .getDoctor(doctorId);
      name = '${profile.firstName} ${profile.lastName}'.trim();
      avatar = profile.url;
    } on Exception {
      // Keep the email fallback.
    }

    await storage.saveDoctor(id: doctorId, name: name);
    final profile = DoctorProfile(id: doctorId, name: name, avatarUrl: avatar);
    state = profile;
    return profile;
  }

  /// Revokes the session server-side and resets local state.
  Future<void> logout() async {
    final service = AuthService(
      ref.read(apiClientProvider),
      TokenStorage(ref.read(sharedPreferencesProvider)),
    );
    await service.logout();
    state = null;
  }
}

/// Exposed for services that only need token storage.
@riverpod
TokenStorage tokenStorage(Ref ref) =>
    TokenStorage(ref.watch(sharedPreferencesProvider));

/// Convenience accessor so widgets/services can locate the doctor profile
/// without null-checking the session.
@riverpod
DoctorProfile? sessionDoctor(SessionDoctorRef ref) =>
    ref.watch(sessionControllerProvider);
