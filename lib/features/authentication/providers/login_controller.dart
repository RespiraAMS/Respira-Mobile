import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_response.dart';
import 'session_provider.dart';

part 'login_controller.freezed.dart';
part 'login_controller.g.dart';


/// Login form state + submission. Submits through the real
/// `POST /auth/login`; API failures surface as [LoginFailure] states
/// (guidelines Rule 3/5 — error text, never color alone).
@freezed
class LoginUiState with _$LoginUiState {
  const factory LoginUiState({
    @Default('') String identifier,
    @Default('') String password,
    @Default(false) bool submitting,
    String? errorMessage,
  }) = _LoginUiState;
}

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginUiState build() => const LoginUiState();

  void setIdentifier(String value) =>
      state = state.copyWith(identifier: value, errorMessage: null);

  void setPassword(String value) =>
      state = state.copyWith(password: value, errorMessage: null);

  bool get canSubmit =>
      state.identifier.trim().isNotEmpty && state.password.isNotEmpty;

  /// Returns true on success; on failure sets [LoginUiState.errorMessage].
  Future<bool> submit() async {
    if (!canSubmit || state.submitting) return false;
    state = state.copyWith(submitting: true, errorMessage: null);
    try {
      await ref
          .read(sessionControllerProvider.notifier)
          .login(email: state.identifier.trim(), password: state.password);
      state = state.copyWith(submitting: false);
      return true;
    } on ApiException catch (e) {
      state = state.copyWith(submitting: false, errorMessage: e.message);
      return false;
    } catch (_) {
      state = state.copyWith(
        submitting: false,
        errorMessage: 'Không thể kết nối máy chủ. Vui lòng thử lại.',
      );
      return false;
    }
  }
}
