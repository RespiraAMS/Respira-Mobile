import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_password_form_state.freezed.dart';
part 'new_password_form_state.g.dart';

/// Editable state of the create-new-password form (step 2/2).
@freezed
class NewPasswordFormState with _$NewPasswordFormState {
  const factory NewPasswordFormState({
    @Default('') String password,
    @Default('') String confirmPassword,
  }) = _NewPasswordFormState;

  factory NewPasswordFormState.fromJson(Map<String, dynamic> json) =>
      _$NewPasswordFormStateFromJson(json);
}

/// Password rules shown on the requirements card, evaluated live.
extension NewPasswordRulesX on NewPasswordFormState {
  bool get hasMinLength => password.length >= 8;

  bool get hasUppercase => password.contains(RegExp(r'[A-Z]'));

  bool get hasDigitOrSpecial =>
      password.contains(RegExp(r'[0-9]')) ||
      password.contains(RegExp(r'[^A-Za-z0-9]'));

  bool get allRulesMet => hasMinLength && hasUppercase && hasDigitOrSpecial;

  bool get passwordsMatch =>
      confirmPassword.isNotEmpty && password == confirmPassword;

  bool get canSubmit => allRulesMet && passwordsMatch;
}
