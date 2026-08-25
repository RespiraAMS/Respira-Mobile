import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/login_form_state.dart';

part 'login_controller.g.dart';

/// Holds the login form state.
///
/// Repository-backed authentication lands with the networking layer
/// (dio + retrofit); submitting currently just validates non-empty input.
@riverpod
class LoginController extends _$LoginController {
  @override
  LoginFormState build() => const LoginFormState();

  void setIdentifier(String value) =>
      state = state.copyWith(identifier: value);

  void setPassword(String value) => state = state.copyWith(password: value);

  bool get canSubmit =>
      state.identifier.trim().isNotEmpty && state.password.isNotEmpty;
}
