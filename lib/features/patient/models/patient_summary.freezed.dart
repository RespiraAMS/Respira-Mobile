// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PatientSummary _$PatientSummaryFromJson(Map<String, dynamic> json) {
  return _PatientSummary.fromJson(json);
}

/// @nodoc
mixin _$PatientSummary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get genderLabel => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  PatientStatus get status => throw _privateConstructorUsedError;

  /// Serializes this PatientSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientSummaryCopyWith<PatientSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientSummaryCopyWith<$Res> {
  factory $PatientSummaryCopyWith(
    PatientSummary value,
    $Res Function(PatientSummary) then,
  ) = _$PatientSummaryCopyWithImpl<$Res, PatientSummary>;
  @useResult
  $Res call({
    String id,
    String name,
    String code,
    String genderLabel,
    int age,
    PatientStatus status,
  });
}

/// @nodoc
class _$PatientSummaryCopyWithImpl<$Res, $Val extends PatientSummary>
    implements $PatientSummaryCopyWith<$Res> {
  _$PatientSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? genderLabel = null,
    Object? age = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
            genderLabel: null == genderLabel
                ? _value.genderLabel
                : genderLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PatientStatus,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientSummaryImplCopyWith<$Res>
    implements $PatientSummaryCopyWith<$Res> {
  factory _$$PatientSummaryImplCopyWith(
    _$PatientSummaryImpl value,
    $Res Function(_$PatientSummaryImpl) then,
  ) = __$$PatientSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String code,
    String genderLabel,
    int age,
    PatientStatus status,
  });
}

/// @nodoc
class __$$PatientSummaryImplCopyWithImpl<$Res>
    extends _$PatientSummaryCopyWithImpl<$Res, _$PatientSummaryImpl>
    implements _$$PatientSummaryImplCopyWith<$Res> {
  __$$PatientSummaryImplCopyWithImpl(
    _$PatientSummaryImpl _value,
    $Res Function(_$PatientSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
    Object? genderLabel = null,
    Object? age = null,
    Object? status = null,
  }) {
    return _then(
      _$PatientSummaryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        genderLabel: null == genderLabel
            ? _value.genderLabel
            : genderLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PatientStatus,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientSummaryImpl implements _PatientSummary {
  const _$PatientSummaryImpl({
    required this.id,
    required this.name,
    required this.code,
    required this.genderLabel,
    required this.age,
    required this.status,
  });

  factory _$PatientSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientSummaryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String code;
  @override
  final String genderLabel;
  @override
  final int age;
  @override
  final PatientStatus status;

  @override
  String toString() {
    return 'PatientSummary(id: $id, name: $name, code: $code, genderLabel: $genderLabel, age: $age, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.genderLabel, genderLabel) ||
                other.genderLabel == genderLabel) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, code, genderLabel, age, status);

  /// Create a copy of PatientSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientSummaryImplCopyWith<_$PatientSummaryImpl> get copyWith =>
      __$$PatientSummaryImplCopyWithImpl<_$PatientSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientSummaryImplToJson(this);
  }
}

abstract class _PatientSummary implements PatientSummary {
  const factory _PatientSummary({
    required final String id,
    required final String name,
    required final String code,
    required final String genderLabel,
    required final int age,
    required final PatientStatus status,
  }) = _$PatientSummaryImpl;

  factory _PatientSummary.fromJson(Map<String, dynamic> json) =
      _$PatientSummaryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get code;
  @override
  String get genderLabel;
  @override
  int get age;
  @override
  PatientStatus get status;

  /// Create a copy of PatientSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientSummaryImplCopyWith<_$PatientSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
