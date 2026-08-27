// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_patient_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddPatientFormState _$AddPatientFormStateFromJson(Map<String, dynamic> json) {
  return _AddPatientFormState.fromJson(json);
}

/// @nodoc
mixin _$AddPatientFormState {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  String get insurance => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  /// Serializes this AddPatientFormState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddPatientFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPatientFormStateCopyWith<AddPatientFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPatientFormStateCopyWith<$Res> {
  factory $AddPatientFormStateCopyWith(
    AddPatientFormState value,
    $Res Function(AddPatientFormState) then,
  ) = _$AddPatientFormStateCopyWithImpl<$Res, AddPatientFormState>;
  @useResult
  $Res call({
    String name,
    String code,
    String dob,
    Gender gender,
    String insurance,
    String address,
  });
}

/// @nodoc
class _$AddPatientFormStateCopyWithImpl<$Res, $Val extends AddPatientFormState>
    implements $AddPatientFormStateCopyWith<$Res> {
  _$AddPatientFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPatientFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? dob = null,
    Object? gender = null,
    Object? insurance = null,
    Object? address = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            dob: null == dob
                ? _value.dob
                : dob // ignore: cast_nullable_to_non_nullable
                      as String,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as Gender,
            insurance: null == insurance
                ? _value.insurance
                : insurance // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddPatientFormStateImplCopyWith<$Res>
    implements $AddPatientFormStateCopyWith<$Res> {
  factory _$$AddPatientFormStateImplCopyWith(
    _$AddPatientFormStateImpl value,
    $Res Function(_$AddPatientFormStateImpl) then,
  ) = __$$AddPatientFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String code,
    String dob,
    Gender gender,
    String insurance,
    String address,
  });
}

/// @nodoc
class __$$AddPatientFormStateImplCopyWithImpl<$Res>
    extends _$AddPatientFormStateCopyWithImpl<$Res, _$AddPatientFormStateImpl>
    implements _$$AddPatientFormStateImplCopyWith<$Res> {
  __$$AddPatientFormStateImplCopyWithImpl(
    _$AddPatientFormStateImpl _value,
    $Res Function(_$AddPatientFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddPatientFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? dob = null,
    Object? gender = null,
    Object? insurance = null,
    Object? address = null,
  }) {
    return _then(
      _$AddPatientFormStateImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        dob: null == dob
            ? _value.dob
            : dob // ignore: cast_nullable_to_non_nullable
                  as String,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as Gender,
        insurance: null == insurance
            ? _value.insurance
            : insurance // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddPatientFormStateImpl implements _AddPatientFormState {
  const _$AddPatientFormStateImpl({
    this.name = '',
    this.code = '',
    this.dob = '',
    this.gender = Gender.nam,
    this.insurance = '',
    this.address = '',
  });

  factory _$AddPatientFormStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddPatientFormStateImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String dob;
  @override
  @JsonKey()
  final Gender gender;
  @override
  @JsonKey()
  final String insurance;
  @override
  @JsonKey()
  final String address;

  @override
  String toString() {
    return 'AddPatientFormState(name: $name, code: $code, dob: $dob, gender: $gender, insurance: $insurance, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPatientFormStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.insurance, insurance) ||
                other.insurance == insurance) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, code, dob, gender, insurance, address);

  /// Create a copy of AddPatientFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPatientFormStateImplCopyWith<_$AddPatientFormStateImpl> get copyWith =>
      __$$AddPatientFormStateImplCopyWithImpl<_$AddPatientFormStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddPatientFormStateImplToJson(this);
  }
}

abstract class _AddPatientFormState implements AddPatientFormState {
  const factory _AddPatientFormState({
    final String name,
    final String code,
    final String dob,
    final Gender gender,
    final String insurance,
    final String address,
  }) = _$AddPatientFormStateImpl;

  factory _AddPatientFormState.fromJson(Map<String, dynamic> json) =
      _$AddPatientFormStateImpl.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  String get dob;
  @override
  Gender get gender;
  @override
  String get insurance;
  @override
  String get address;

  /// Create a copy of AddPatientFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPatientFormStateImplCopyWith<_$AddPatientFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
