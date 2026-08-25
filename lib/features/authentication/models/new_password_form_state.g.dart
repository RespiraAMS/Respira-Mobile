// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_password_form_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewPasswordFormStateImpl _$$NewPasswordFormStateImplFromJson(
  Map<String, dynamic> json,
) => _$NewPasswordFormStateImpl(
  password: json['password'] as String? ?? '',
  confirmPassword: json['confirmPassword'] as String? ?? '',
);

Map<String, dynamic> _$$NewPasswordFormStateImplToJson(
  _$NewPasswordFormStateImpl instance,
) => <String, dynamic>{
  'password': instance.password,
  'confirmPassword': instance.confirmPassword,
};
