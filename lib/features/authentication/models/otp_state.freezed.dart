// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OtpState _$OtpStateFromJson(Map<String, dynamic> json) {
  return _OtpState.fromJson(json);
}

/// @nodoc
mixin _$OtpState {
  /// Up to 6 digits captured by the hidden input field.
  String get digits => throw _privateConstructorUsedError;

  /// Seconds until "Gửi lại mã" becomes available.
  int get secondsRemaining => throw _privateConstructorUsedError;

  /// Serializes this OtpState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
  @useResult
  $Res call({String digits, int secondsRemaining});
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? digits = null, Object? secondsRemaining = null}) {
    return _then(
      _value.copyWith(
            digits: null == digits
                ? _value.digits
                : digits // ignore: cast_nullable_to_non_nullable
                      as String,
            secondsRemaining: null == secondsRemaining
                ? _value.secondsRemaining
                : secondsRemaining // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtpStateImplCopyWith<$Res>
    implements $OtpStateCopyWith<$Res> {
  factory _$$OtpStateImplCopyWith(
    _$OtpStateImpl value,
    $Res Function(_$OtpStateImpl) then,
  ) = __$$OtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String digits, int secondsRemaining});
}

/// @nodoc
class __$$OtpStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpStateImpl>
    implements _$$OtpStateImplCopyWith<$Res> {
  __$$OtpStateImplCopyWithImpl(
    _$OtpStateImpl _value,
    $Res Function(_$OtpStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? digits = null, Object? secondsRemaining = null}) {
    return _then(
      _$OtpStateImpl(
        digits: null == digits
            ? _value.digits
            : digits // ignore: cast_nullable_to_non_nullable
                  as String,
        secondsRemaining: null == secondsRemaining
            ? _value.secondsRemaining
            : secondsRemaining // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpStateImpl implements _OtpState {
  const _$OtpStateImpl({
    this.digits = '',
    this.secondsRemaining = kOtpResendSeconds,
  });

  factory _$OtpStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpStateImplFromJson(json);

  /// Up to 6 digits captured by the hidden input field.
  @override
  @JsonKey()
  final String digits;

  /// Seconds until "Gửi lại mã" becomes available.
  @override
  @JsonKey()
  final int secondsRemaining;

  @override
  String toString() {
    return 'OtpState(digits: $digits, secondsRemaining: $secondsRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpStateImpl &&
            (identical(other.digits, digits) || other.digits == digits) &&
            (identical(other.secondsRemaining, secondsRemaining) ||
                other.secondsRemaining == secondsRemaining));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, digits, secondsRemaining);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      __$$OtpStateImplCopyWithImpl<_$OtpStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpStateImplToJson(this);
  }
}

abstract class _OtpState implements OtpState {
  const factory _OtpState({final String digits, final int secondsRemaining}) =
      _$OtpStateImpl;

  factory _OtpState.fromJson(Map<String, dynamic> json) =
      _$OtpStateImpl.fromJson;

  /// Up to 6 digits captured by the hidden input field.
  @override
  String get digits;

  /// Seconds until "Gửi lại mã" becomes available.
  @override
  int get secondsRemaining;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
