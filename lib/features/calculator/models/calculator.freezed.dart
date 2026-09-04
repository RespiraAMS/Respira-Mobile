// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Curb65Input _$Curb65InputFromJson(Map<String, dynamic> json) {
  return _Curb65Input.fromJson(json);
}

/// @nodoc
mixin _$Curb65Input {
  bool get confusion => throw _privateConstructorUsedError;
  String get urea => throw _privateConstructorUsedError;
  String get respRate => throw _privateConstructorUsedError;
  String get sbp => throw _privateConstructorUsedError;
  String get dbp => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;

  /// Serializes this Curb65Input to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Curb65Input
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Curb65InputCopyWith<Curb65Input> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Curb65InputCopyWith<$Res> {
  factory $Curb65InputCopyWith(
    Curb65Input value,
    $Res Function(Curb65Input) then,
  ) = _$Curb65InputCopyWithImpl<$Res, Curb65Input>;
  @useResult
  $Res call({
    bool confusion,
    String urea,
    String respRate,
    String sbp,
    String dbp,
    String age,
  });
}

/// @nodoc
class _$Curb65InputCopyWithImpl<$Res, $Val extends Curb65Input>
    implements $Curb65InputCopyWith<$Res> {
  _$Curb65InputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Curb65Input
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confusion = null,
    Object? urea = null,
    Object? respRate = null,
    Object? sbp = null,
    Object? dbp = null,
    Object? age = null,
  }) {
    return _then(
      _value.copyWith(
            confusion: null == confusion
                ? _value.confusion
                : confusion // ignore: cast_nullable_to_non_nullable
                      as bool,
            urea: null == urea
                ? _value.urea
                : urea // ignore: cast_nullable_to_non_nullable
                      as String,
            respRate: null == respRate
                ? _value.respRate
                : respRate // ignore: cast_nullable_to_non_nullable
                      as String,
            sbp: null == sbp
                ? _value.sbp
                : sbp // ignore: cast_nullable_to_non_nullable
                      as String,
            dbp: null == dbp
                ? _value.dbp
                : dbp // ignore: cast_nullable_to_non_nullable
                      as String,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$Curb65InputImplCopyWith<$Res>
    implements $Curb65InputCopyWith<$Res> {
  factory _$$Curb65InputImplCopyWith(
    _$Curb65InputImpl value,
    $Res Function(_$Curb65InputImpl) then,
  ) = __$$Curb65InputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool confusion,
    String urea,
    String respRate,
    String sbp,
    String dbp,
    String age,
  });
}

/// @nodoc
class __$$Curb65InputImplCopyWithImpl<$Res>
    extends _$Curb65InputCopyWithImpl<$Res, _$Curb65InputImpl>
    implements _$$Curb65InputImplCopyWith<$Res> {
  __$$Curb65InputImplCopyWithImpl(
    _$Curb65InputImpl _value,
    $Res Function(_$Curb65InputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Curb65Input
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confusion = null,
    Object? urea = null,
    Object? respRate = null,
    Object? sbp = null,
    Object? dbp = null,
    Object? age = null,
  }) {
    return _then(
      _$Curb65InputImpl(
        confusion: null == confusion
            ? _value.confusion
            : confusion // ignore: cast_nullable_to_non_nullable
                  as bool,
        urea: null == urea
            ? _value.urea
            : urea // ignore: cast_nullable_to_non_nullable
                  as String,
        respRate: null == respRate
            ? _value.respRate
            : respRate // ignore: cast_nullable_to_non_nullable
                  as String,
        sbp: null == sbp
            ? _value.sbp
            : sbp // ignore: cast_nullable_to_non_nullable
                  as String,
        dbp: null == dbp
            ? _value.dbp
            : dbp // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$Curb65InputImpl implements _Curb65Input {
  const _$Curb65InputImpl({
    this.confusion = false,
    this.urea = '',
    this.respRate = '',
    this.sbp = '',
    this.dbp = '',
    this.age = '',
  });

  factory _$Curb65InputImpl.fromJson(Map<String, dynamic> json) =>
      _$$Curb65InputImplFromJson(json);

  @override
  @JsonKey()
  final bool confusion;
  @override
  @JsonKey()
  final String urea;
  @override
  @JsonKey()
  final String respRate;
  @override
  @JsonKey()
  final String sbp;
  @override
  @JsonKey()
  final String dbp;
  @override
  @JsonKey()
  final String age;

  @override
  String toString() {
    return 'Curb65Input(confusion: $confusion, urea: $urea, respRate: $respRate, sbp: $sbp, dbp: $dbp, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Curb65InputImpl &&
            (identical(other.confusion, confusion) ||
                other.confusion == confusion) &&
            (identical(other.urea, urea) || other.urea == urea) &&
            (identical(other.respRate, respRate) ||
                other.respRate == respRate) &&
            (identical(other.sbp, sbp) || other.sbp == sbp) &&
            (identical(other.dbp, dbp) || other.dbp == dbp) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, confusion, urea, respRate, sbp, dbp, age);

  /// Create a copy of Curb65Input
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Curb65InputImplCopyWith<_$Curb65InputImpl> get copyWith =>
      __$$Curb65InputImplCopyWithImpl<_$Curb65InputImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$Curb65InputImplToJson(this);
  }
}

abstract class _Curb65Input implements Curb65Input {
  const factory _Curb65Input({
    final bool confusion,
    final String urea,
    final String respRate,
    final String sbp,
    final String dbp,
    final String age,
  }) = _$Curb65InputImpl;

  factory _Curb65Input.fromJson(Map<String, dynamic> json) =
      _$Curb65InputImpl.fromJson;

  @override
  bool get confusion;
  @override
  String get urea;
  @override
  String get respRate;
  @override
  String get sbp;
  @override
  String get dbp;
  @override
  String get age;

  /// Create a copy of Curb65Input
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Curb65InputImplCopyWith<_$Curb65InputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
