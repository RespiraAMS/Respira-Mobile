import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_form_state.freezed.dart';
part 'forgot_password_form_state.g.dart';

/// Editable state of the forgot-password form.
@freezed
class ForgotPasswordFormState with _$ForgotPasswordFormState {
  const factory ForgotPasswordFormState({
    @Default('') String email,
    String? errorMessage,
  }) = _ForgotPasswordFormState;

  factory ForgotPasswordFormState.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordFormStateFromJson(json);
}
