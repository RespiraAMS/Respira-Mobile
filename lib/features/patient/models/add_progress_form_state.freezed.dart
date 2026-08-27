// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_progress_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddProgressFormState _$AddProgressFormStateFromJson(Map<String, dynamic> json) {
  return _AddProgressFormState.fromJson(json);
}

/// @nodoc
mixin _$AddProgressFormState {
  TreatmentType get treatmentType => throw _privateConstructorUsedError;

  /// "Có kết quả vi sinh".
  bool get microbiologyResult => throw _privateConstructorUsedError;

  /// "Đáp ứng kém".
  bool get poorResponse => throw _privateConstructorUsedError;

  /// Serializes this AddProgressFormState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddProgressFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddProgressFormStateCopyWith<AddProgressFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddProgressFormStateCopyWith<$Res> {
  factory $AddProgressFormStateCopyWith(
    AddProgressFormState value,
    $Res Function(AddProgressFormState) then,
  ) = _$AddProgressFormStateCopyWithImpl<$Res, AddProgressFormState>;
  @useResult
  $Res call({
    TreatmentType treatmentType,
    bool microbiologyResult,
    bool poorResponse,
  });
}

/// @nodoc
class _$AddProgressFormStateCopyWithImpl<
  $Res,
  $Val extends AddProgressFormState
>
    implements $AddProgressFormStateCopyWith<$Res> {
  _$AddProgressFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddProgressFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treatmentType = null,
    Object? microbiologyResult = null,
    Object? poorResponse = null,
  }) {
    return _then(
      _value.copyWith(
            treatmentType: null == treatmentType
                ? _value.treatmentType
                : treatmentType // ignore: cast_nullable_to_non_nullable
                      as TreatmentType,
            microbiologyResult: null == microbiologyResult
                ? _value.microbiologyResult
                : microbiologyResult // ignore: cast_nullable_to_non_nullable
                      as bool,
            poorResponse: null == poorResponse
                ? _value.poorResponse
                : poorResponse // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddProgressFormStateImplCopyWith<$Res>
    implements $AddProgressFormStateCopyWith<$Res> {
  factory _$$AddProgressFormStateImplCopyWith(
    _$AddProgressFormStateImpl value,
    $Res Function(_$AddProgressFormStateImpl) then,
  ) = __$$AddProgressFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TreatmentType treatmentType,
    bool microbiologyResult,
    bool poorResponse,
  });
}

/// @nodoc
class __$$AddProgressFormStateImplCopyWithImpl<$Res>
    extends _$AddProgressFormStateCopyWithImpl<$Res, _$AddProgressFormStateImpl>
    implements _$$AddProgressFormStateImplCopyWith<$Res> {
  __$$AddProgressFormStateImplCopyWithImpl(
    _$AddProgressFormStateImpl _value,
    $Res Function(_$AddProgressFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddProgressFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? treatmentType = null,
    Object? microbiologyResult = null,
    Object? poorResponse = null,
  }) {
    return _then(
      _$AddProgressFormStateImpl(
        treatmentType: null == treatmentType
            ? _value.treatmentType
            : treatmentType // ignore: cast_nullable_to_non_nullable
                  as TreatmentType,
        microbiologyResult: null == microbiologyResult
            ? _value.microbiologyResult
            : microbiologyResult // ignore: cast_nullable_to_non_nullable
                  as bool,
        poorResponse: null == poorResponse
            ? _value.poorResponse
            : poorResponse // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddProgressFormStateImpl implements _AddProgressFormState {
  const _$AddProgressFormStateImpl({
    this.treatmentType = TreatmentType.empirical,
    this.microbiologyResult = true,
    this.poorResponse = false,
  });

  factory _$AddProgressFormStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddProgressFormStateImplFromJson(json);

  @override
  @JsonKey()
  final TreatmentType treatmentType;

  /// "Có kết quả vi sinh".
  @override
  @JsonKey()
  final bool microbiologyResult;

  /// "Đáp ứng kém".
  @override
  @JsonKey()
  final bool poorResponse;

  @override
  String toString() {
    return 'AddProgressFormState(treatmentType: $treatmentType, microbiologyResult: $microbiologyResult, poorResponse: $poorResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProgressFormStateImpl &&
            (identical(other.treatmentType, treatmentType) ||
                other.treatmentType == treatmentType) &&
            (identical(other.microbiologyResult, microbiologyResult) ||
                other.microbiologyResult == microbiologyResult) &&
            (identical(other.poorResponse, poorResponse) ||
                other.poorResponse == poorResponse));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, treatmentType, microbiologyResult, poorResponse);

  /// Create a copy of AddProgressFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProgressFormStateImplCopyWith<_$AddProgressFormStateImpl>
  get copyWith =>
      __$$AddProgressFormStateImplCopyWithImpl<_$AddProgressFormStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddProgressFormStateImplToJson(this);
  }
}

abstract class _AddProgressFormState implements AddProgressFormState {
  const factory _AddProgressFormState({
    final TreatmentType treatmentType,
    final bool microbiologyResult,
    final bool poorResponse,
  }) = _$AddProgressFormStateImpl;

  factory _AddProgressFormState.fromJson(Map<String, dynamic> json) =
      _$AddProgressFormStateImpl.fromJson;

  @override
  TreatmentType get treatmentType;

  /// "Có kết quả vi sinh".
  @override
  bool get microbiologyResult;

  /// "Đáp ứng kém".
  @override
  bool get poorResponse;

  /// Create a copy of AddProgressFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddProgressFormStateImplCopyWith<_$AddProgressFormStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
