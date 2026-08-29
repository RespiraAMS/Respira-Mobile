// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ForgotPasswordFormState _$ForgotPasswordFormStateFromJson(
  Map<String, dynamic> json,
) {
  return _ForgotPasswordFormState.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordFormState {
  String get email => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this ForgotPasswordFormState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordFormStateCopyWith<ForgotPasswordFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordFormStateCopyWith<$Res> {
  factory $ForgotPasswordFormStateCopyWith(
    ForgotPasswordFormState value,
    $Res Function(ForgotPasswordFormState) then,
  ) = _$ForgotPasswordFormStateCopyWithImpl<$Res, ForgotPasswordFormState>;
  @useResult
  $Res call({String email, String? errorMessage});
}

/// @nodoc
class _$ForgotPasswordFormStateCopyWithImpl<
  $Res,
  $Val extends ForgotPasswordFormState
>
    implements $ForgotPasswordFormStateCopyWith<$Res> {
  _$ForgotPasswordFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? errorMessage = freezed}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ForgotPasswordFormStateImplCopyWith<$Res>
    implements $ForgotPasswordFormStateCopyWith<$Res> {
  factory _$$ForgotPasswordFormStateImplCopyWith(
    _$ForgotPasswordFormStateImpl value,
    $Res Function(_$ForgotPasswordFormStateImpl) then,
  ) = __$$ForgotPasswordFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String? errorMessage});
}

/// @nodoc
class __$$ForgotPasswordFormStateImplCopyWithImpl<$Res>
    extends
        _$ForgotPasswordFormStateCopyWithImpl<
          $Res,
          _$ForgotPasswordFormStateImpl
        >
    implements _$$ForgotPasswordFormStateImplCopyWith<$Res> {
  __$$ForgotPasswordFormStateImplCopyWithImpl(
    _$ForgotPasswordFormStateImpl _value,
    $Res Function(_$ForgotPasswordFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ForgotPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? errorMessage = freezed}) {
    return _then(
      _$ForgotPasswordFormStateImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordFormStateImpl implements _ForgotPasswordFormState {
  const _$ForgotPasswordFormStateImpl({this.email = '', this.errorMessage});

  factory _$ForgotPasswordFormStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordFormStateImplFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ForgotPasswordFormState(email: $email, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordFormStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, errorMessage);

  /// Create a copy of ForgotPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordFormStateImplCopyWith<_$ForgotPasswordFormStateImpl>
  get copyWith =>
      __$$ForgotPasswordFormStateImplCopyWithImpl<
        _$ForgotPasswordFormStateImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordFormStateImplToJson(this);
  }
}

abstract class _ForgotPasswordFormState implements ForgotPasswordFormState {
  const factory _ForgotPasswordFormState({
    final String email,
    final String? errorMessage,
  }) = _$ForgotPasswordFormStateImpl;

  factory _ForgotPasswordFormState.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordFormStateImpl.fromJson;

  @override
  String get email;
  @override
  String? get errorMessage;

  /// Create a copy of ForgotPasswordFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordFormStateImplCopyWith<_$ForgotPasswordFormStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
