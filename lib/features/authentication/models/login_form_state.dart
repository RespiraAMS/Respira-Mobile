import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';
part 'login_form_state.g.dart';

/// Editable state of the login form.
@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    /// Email or staff code ("Email hoặc mã nhân viên").
    @Default('') String identifier,
    @Default('') String password,
  }) = _LoginFormState;

  factory LoginFormState.fromJson(Map<String, dynamic> json) =>
      _$LoginFormStateFromJson(json);
}
