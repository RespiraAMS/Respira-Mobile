// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_password_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NewPasswordFormState _$NewPasswordFormStateFromJson(Map<String, dynamic> json) {
  return _NewPasswordFormState.fromJson(json);
}

/// @nodoc
mixin _$NewPasswordFormState {
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  /// Serializes this NewPasswordFormState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewPasswordFormStateCopyWith<NewPasswordFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPasswordFormStateCopyWith<$Res> {
  factory $NewPasswordFormStateCopyWith(
    NewPasswordFormState value,
    $Res Function(NewPasswordFormState) then,
  ) = _$NewPasswordFormStateCopyWithImpl<$Res, NewPasswordFormState>;
  @useResult
  $Res call({String password, String confirmPassword});
}

/// @nodoc
class _$NewPasswordFormStateCopyWithImpl<
  $Res,
  $Val extends NewPasswordFormState
>
    implements $NewPasswordFormStateCopyWith<$Res> {
  _$NewPasswordFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = null, Object? confirmPassword = null}) {
    return _then(
      _value.copyWith(
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            confirmPassword: null == confirmPassword
                ? _value.confirmPassword
                : confirmPassword // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NewPasswordFormStateImplCopyWith<$Res>
    implements $NewPasswordFormStateCopyWith<$Res> {
  factory _$$NewPasswordFormStateImplCopyWith(
    _$NewPasswordFormStateImpl value,
    $Res Function(_$NewPasswordFormStateImpl) then,
  ) = __$$NewPasswordFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password, String confirmPassword});
}

/// @nodoc
class __$$NewPasswordFormStateImplCopyWithImpl<$Res>
    extends _$NewPasswordFormStateCopyWithImpl<$Res, _$NewPasswordFormStateImpl>
    implements _$$NewPasswordFormStateImplCopyWith<$Res> {
  __$$NewPasswordFormStateImplCopyWithImpl(
    _$NewPasswordFormStateImpl _value,
    $Res Function(_$NewPasswordFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NewPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? password = null, Object? confirmPassword = null}) {
    return _then(
      _$NewPasswordFormStateImpl(
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        confirmPassword: null == confirmPassword
            ? _value.confirmPassword
            : confirmPassword // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NewPasswordFormStateImpl implements _NewPasswordFormState {
  const _$NewPasswordFormStateImpl({
    this.password = '',
    this.confirmPassword = '',
  });

  factory _$NewPasswordFormStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewPasswordFormStateImplFromJson(json);

  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;

  @override
  String toString() {
    return 'NewPasswordFormState(password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPasswordFormStateImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, password, confirmPassword);

  /// Create a copy of NewPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPasswordFormStateImplCopyWith<_$NewPasswordFormStateImpl>
  get copyWith =>
      __$$NewPasswordFormStateImplCopyWithImpl<_$NewPasswordFormStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NewPasswordFormStateImplToJson(this);
  }
}

abstract class _NewPasswordFormState implements NewPasswordFormState {
  const factory _NewPasswordFormState({
    final String password,
    final String confirmPassword,
  }) = _$NewPasswordFormStateImpl;

  factory _NewPasswordFormState.fromJson(Map<String, dynamic> json) =
      _$NewPasswordFormStateImpl.fromJson;

  @override
  String get password;
  @override
  String get confirmPassword;

  /// Create a copy of NewPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewPasswordFormStateImplCopyWith<_$NewPasswordFormStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
