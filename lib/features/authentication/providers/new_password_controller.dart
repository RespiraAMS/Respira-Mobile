import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/new_password_form_state.dart';

part 'new_password_controller.g.dart';

/// Holds the create-new-password form state (wizard step 2/2).
@riverpod
class NewPasswordController extends _$NewPasswordController {
  @override
  NewPasswordFormState build() => const NewPasswordFormState();

  void setPassword(String value) =>
      state = state.copyWith(password: value);

  void setConfirmPassword(String value) =>
      state = state.copyWith(confirmPassword: value);
}
