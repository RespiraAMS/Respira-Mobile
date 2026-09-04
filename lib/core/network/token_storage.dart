import 'package:shared_preferences/shared_preferences.dart';

/// Persisted auth tokens + doctor identity (guidelines §2.5: key-value
/// storage behind this small interface).
class TokenStorage {
  TokenStorage(this._prefs);

  static const _kAccess = 'auth.accessToken';
  static const _kRefresh = 'auth.refreshToken';
  static const _kDoctorId = 'auth.doctorId';
  static const _kDoctorName = 'auth.doctorName';

  final SharedPreferences _prefs;

  String? get accessToken => _prefs.getString(_kAccess);
  String? get refreshToken => _prefs.getString(_kRefresh);
  String? get doctorId => _prefs.getString(_kDoctorId);
  String? get doctorName => _prefs.getString(_kDoctorName);

  bool get hasSession => accessToken != null && refreshToken != null;

  Future<void> save({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _prefs.setString(_kAccess, accessToken);
    await _prefs.setString(_kRefresh, refreshToken);
  }

  Future<void> saveDoctor({required String id, required String name}) async {
    await _prefs.setString(_kDoctorId, id);
    await _prefs.setString(_kDoctorName, name);
  }

  Future<void> clear() async {
    await _prefs.remove(_kAccess);
    await _prefs.remove(_kRefresh);
    await _prefs.remove(_kDoctorId);
    await _prefs.remove(_kDoctorName);
  }
}
