// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_providers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Curb65CalculatorState {
  Curb65Input get input => throw _privateConstructorUsedError;

  /// Whether the result card is visible (set by the Tính button).
  bool get resultVisible => throw _privateConstructorUsedError;

  /// Create a copy of Curb65CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Curb65CalculatorStateCopyWith<Curb65CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Curb65CalculatorStateCopyWith<$Res> {
  factory $Curb65CalculatorStateCopyWith(
    Curb65CalculatorState value,
    $Res Function(Curb65CalculatorState) then,
  ) = _$Curb65CalculatorStateCopyWithImpl<$Res, Curb65CalculatorState>;
  @useResult
  $Res call({Curb65Input input, bool resultVisible});

  $Curb65InputCopyWith<$Res> get input;
}

/// @nodoc
class _$Curb65CalculatorStateCopyWithImpl<
  $Res,
  $Val extends Curb65CalculatorState
>
    implements $Curb65CalculatorStateCopyWith<$Res> {
  _$Curb65CalculatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Curb65CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? input = null, Object? resultVisible = null}) {
    return _then(
      _value.copyWith(
            input: null == input
                ? _value.input
                : input // ignore: cast_nullable_to_non_nullable
                      as Curb65Input,
            resultVisible: null == resultVisible
                ? _value.resultVisible
                : resultVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of Curb65CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Curb65InputCopyWith<$Res> get input {
    return $Curb65InputCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$Curb65CalculatorStateImplCopyWith<$Res>
    implements $Curb65CalculatorStateCopyWith<$Res> {
  factory _$$Curb65CalculatorStateImplCopyWith(
    _$Curb65CalculatorStateImpl value,
    $Res Function(_$Curb65CalculatorStateImpl) then,
  ) = __$$Curb65CalculatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Curb65Input input, bool resultVisible});

  @override
  $Curb65InputCopyWith<$Res> get input;
}

/// @nodoc
class __$$Curb65CalculatorStateImplCopyWithImpl<$Res>
    extends
        _$Curb65CalculatorStateCopyWithImpl<$Res, _$Curb65CalculatorStateImpl>
    implements _$$Curb65CalculatorStateImplCopyWith<$Res> {
  __$$Curb65CalculatorStateImplCopyWithImpl(
    _$Curb65CalculatorStateImpl _value,
    $Res Function(_$Curb65CalculatorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Curb65CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? input = null, Object? resultVisible = null}) {
    return _then(
      _$Curb65CalculatorStateImpl(
        input: null == input
            ? _value.input
            : input // ignore: cast_nullable_to_non_nullable
                  as Curb65Input,
        resultVisible: null == resultVisible
            ? _value.resultVisible
            : resultVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$Curb65CalculatorStateImpl implements _Curb65CalculatorState {
  const _$Curb65CalculatorStateImpl({
    this.input = const Curb65Input(),
    this.resultVisible = false,
  });

  @override
  @JsonKey()
  final Curb65Input input;

  /// Whether the result card is visible (set by the Tính button).
  @override
  @JsonKey()
  final bool resultVisible;

  @override
  String toString() {
    return 'Curb65CalculatorState(input: $input, resultVisible: $resultVisible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Curb65CalculatorStateImpl &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.resultVisible, resultVisible) ||
                other.resultVisible == resultVisible));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input, resultVisible);

  /// Create a copy of Curb65CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Curb65CalculatorStateImplCopyWith<_$Curb65CalculatorStateImpl>
  get copyWith =>
      __$$Curb65CalculatorStateImplCopyWithImpl<_$Curb65CalculatorStateImpl>(
        this,
        _$identity,
      );
}

abstract class _Curb65CalculatorState implements Curb65CalculatorState {
  const factory _Curb65CalculatorState({
    final Curb65Input input,
    final bool resultVisible,
  }) = _$Curb65CalculatorStateImpl;

  @override
  Curb65Input get input;

  /// Whether the result card is visible (set by the Tính button).
  @override
  bool get resultVisible;

  /// Create a copy of Curb65CalculatorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Curb65CalculatorStateImplCopyWith<_$Curb65CalculatorStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
