// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinical_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiseaseItemDto _$DiseaseItemDtoFromJson(Map<String, dynamic> json) {
  return _DiseaseItemDto.fromJson(json);
}

/// @nodoc
mixin _$DiseaseItemDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this DiseaseItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiseaseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiseaseItemDtoCopyWith<DiseaseItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseItemDtoCopyWith<$Res> {
  factory $DiseaseItemDtoCopyWith(
    DiseaseItemDto value,
    $Res Function(DiseaseItemDto) then,
  ) = _$DiseaseItemDtoCopyWithImpl<$Res, DiseaseItemDto>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$DiseaseItemDtoCopyWithImpl<$Res, $Val extends DiseaseItemDto>
    implements $DiseaseItemDtoCopyWith<$Res> {
  _$DiseaseItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiseaseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiseaseItemDtoImplCopyWith<$Res>
    implements $DiseaseItemDtoCopyWith<$Res> {
  factory _$$DiseaseItemDtoImplCopyWith(
    _$DiseaseItemDtoImpl value,
    $Res Function(_$DiseaseItemDtoImpl) then,
  ) = __$$DiseaseItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$DiseaseItemDtoImplCopyWithImpl<$Res>
    extends _$DiseaseItemDtoCopyWithImpl<$Res, _$DiseaseItemDtoImpl>
    implements _$$DiseaseItemDtoImplCopyWith<$Res> {
  __$$DiseaseItemDtoImplCopyWithImpl(
    _$DiseaseItemDtoImpl _value,
    $Res Function(_$DiseaseItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiseaseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$DiseaseItemDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiseaseItemDtoImpl implements _DiseaseItemDto {
  const _$DiseaseItemDtoImpl({required this.id, required this.name});

  factory _$DiseaseItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiseaseItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'DiseaseItemDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiseaseItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of DiseaseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiseaseItemDtoImplCopyWith<_$DiseaseItemDtoImpl> get copyWith =>
      __$$DiseaseItemDtoImplCopyWithImpl<_$DiseaseItemDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiseaseItemDtoImplToJson(this);
  }
}

abstract class _DiseaseItemDto implements DiseaseItemDto {
  const factory _DiseaseItemDto({
    required final String id,
    required final String name,
  }) = _$DiseaseItemDtoImpl;

  factory _DiseaseItemDto.fromJson(Map<String, dynamic> json) =
      _$DiseaseItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of DiseaseItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiseaseItemDtoImplCopyWith<_$DiseaseItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CriterionItemDto _$CriterionItemDtoFromJson(Map<String, dynamic> json) {
  return _CriterionItemDto.fromJson(json);
}

/// @nodoc
mixin _$CriterionItemDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CriterionItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CriterionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CriterionItemDtoCopyWith<CriterionItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CriterionItemDtoCopyWith<$Res> {
  factory $CriterionItemDtoCopyWith(
    CriterionItemDto value,
    $Res Function(CriterionItemDto) then,
  ) = _$CriterionItemDtoCopyWithImpl<$Res, CriterionItemDto>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$CriterionItemDtoCopyWithImpl<$Res, $Val extends CriterionItemDto>
    implements $CriterionItemDtoCopyWith<$Res> {
  _$CriterionItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CriterionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CriterionItemDtoImplCopyWith<$Res>
    implements $CriterionItemDtoCopyWith<$Res> {
  factory _$$CriterionItemDtoImplCopyWith(
    _$CriterionItemDtoImpl value,
    $Res Function(_$CriterionItemDtoImpl) then,
  ) = __$$CriterionItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$CriterionItemDtoImplCopyWithImpl<$Res>
    extends _$CriterionItemDtoCopyWithImpl<$Res, _$CriterionItemDtoImpl>
    implements _$$CriterionItemDtoImplCopyWith<$Res> {
  __$$CriterionItemDtoImplCopyWithImpl(
    _$CriterionItemDtoImpl _value,
    $Res Function(_$CriterionItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CriterionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$CriterionItemDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CriterionItemDtoImpl implements _CriterionItemDto {
  const _$CriterionItemDtoImpl({required this.id, required this.name});

  factory _$CriterionItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CriterionItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'CriterionItemDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CriterionItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of CriterionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CriterionItemDtoImplCopyWith<_$CriterionItemDtoImpl> get copyWith =>
      __$$CriterionItemDtoImplCopyWithImpl<_$CriterionItemDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CriterionItemDtoImplToJson(this);
  }
}

abstract class _CriterionItemDto implements CriterionItemDto {
  const factory _CriterionItemDto({
    required final String id,
    required final String name,
  }) = _$CriterionItemDtoImpl;

  factory _CriterionItemDto.fromJson(Map<String, dynamic> json) =
      _$CriterionItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of CriterionItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CriterionItemDtoImplCopyWith<_$CriterionItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiseaseCriteriaDto _$DiseaseCriteriaDtoFromJson(Map<String, dynamic> json) {
  return _DiseaseCriteriaDto.fromJson(json);
}

/// @nodoc
mixin _$DiseaseCriteriaDto {
  List<CriterionItemDto> get icuHospitalizeCriteria =>
      throw _privateConstructorUsedError;
  List<CriterionItemDto> get resistanceRiskFactorCriteria =>
      throw _privateConstructorUsedError;
  List<CriterionItemDto> get otherCriteria =>
      throw _privateConstructorUsedError;

  /// Serializes this DiseaseCriteriaDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiseaseCriteriaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiseaseCriteriaDtoCopyWith<DiseaseCriteriaDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiseaseCriteriaDtoCopyWith<$Res> {
  factory $DiseaseCriteriaDtoCopyWith(
    DiseaseCriteriaDto value,
    $Res Function(DiseaseCriteriaDto) then,
  ) = _$DiseaseCriteriaDtoCopyWithImpl<$Res, DiseaseCriteriaDto>;
  @useResult
  $Res call({
    List<CriterionItemDto> icuHospitalizeCriteria,
    List<CriterionItemDto> resistanceRiskFactorCriteria,
    List<CriterionItemDto> otherCriteria,
  });
}

/// @nodoc
class _$DiseaseCriteriaDtoCopyWithImpl<$Res, $Val extends DiseaseCriteriaDto>
    implements $DiseaseCriteriaDtoCopyWith<$Res> {
  _$DiseaseCriteriaDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiseaseCriteriaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icuHospitalizeCriteria = null,
    Object? resistanceRiskFactorCriteria = null,
    Object? otherCriteria = null,
  }) {
    return _then(
      _value.copyWith(
            icuHospitalizeCriteria: null == icuHospitalizeCriteria
                ? _value.icuHospitalizeCriteria
                : icuHospitalizeCriteria // ignore: cast_nullable_to_non_nullable
                      as List<CriterionItemDto>,
            resistanceRiskFactorCriteria: null == resistanceRiskFactorCriteria
                ? _value.resistanceRiskFactorCriteria
                : resistanceRiskFactorCriteria // ignore: cast_nullable_to_non_nullable
                      as List<CriterionItemDto>,
            otherCriteria: null == otherCriteria
                ? _value.otherCriteria
                : otherCriteria // ignore: cast_nullable_to_non_nullable
                      as List<CriterionItemDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiseaseCriteriaDtoImplCopyWith<$Res>
    implements $DiseaseCriteriaDtoCopyWith<$Res> {
  factory _$$DiseaseCriteriaDtoImplCopyWith(
    _$DiseaseCriteriaDtoImpl value,
    $Res Function(_$DiseaseCriteriaDtoImpl) then,
  ) = __$$DiseaseCriteriaDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CriterionItemDto> icuHospitalizeCriteria,
    List<CriterionItemDto> resistanceRiskFactorCriteria,
    List<CriterionItemDto> otherCriteria,
  });
}

/// @nodoc
class __$$DiseaseCriteriaDtoImplCopyWithImpl<$Res>
    extends _$DiseaseCriteriaDtoCopyWithImpl<$Res, _$DiseaseCriteriaDtoImpl>
    implements _$$DiseaseCriteriaDtoImplCopyWith<$Res> {
  __$$DiseaseCriteriaDtoImplCopyWithImpl(
    _$DiseaseCriteriaDtoImpl _value,
    $Res Function(_$DiseaseCriteriaDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiseaseCriteriaDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icuHospitalizeCriteria = null,
    Object? resistanceRiskFactorCriteria = null,
    Object? otherCriteria = null,
  }) {
    return _then(
      _$DiseaseCriteriaDtoImpl(
        icuHospitalizeCriteria: null == icuHospitalizeCriteria
            ? _value._icuHospitalizeCriteria
            : icuHospitalizeCriteria // ignore: cast_nullable_to_non_nullable
                  as List<CriterionItemDto>,
        resistanceRiskFactorCriteria: null == resistanceRiskFactorCriteria
            ? _value._resistanceRiskFactorCriteria
            : resistanceRiskFactorCriteria // ignore: cast_nullable_to_non_nullable
                  as List<CriterionItemDto>,
        otherCriteria: null == otherCriteria
            ? _value._otherCriteria
            : otherCriteria // ignore: cast_nullable_to_non_nullable
                  as List<CriterionItemDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiseaseCriteriaDtoImpl implements _DiseaseCriteriaDto {
  const _$DiseaseCriteriaDtoImpl({
    final List<CriterionItemDto> icuHospitalizeCriteria = const [],
    final List<CriterionItemDto> resistanceRiskFactorCriteria = const [],
    final List<CriterionItemDto> otherCriteria = const [],
  }) : _icuHospitalizeCriteria = icuHospitalizeCriteria,
       _resistanceRiskFactorCriteria = resistanceRiskFactorCriteria,
       _otherCriteria = otherCriteria;

  factory _$DiseaseCriteriaDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiseaseCriteriaDtoImplFromJson(json);

  final List<CriterionItemDto> _icuHospitalizeCriteria;
  @override
  @JsonKey()
  List<CriterionItemDto> get icuHospitalizeCriteria {
    if (_icuHospitalizeCriteria is EqualUnmodifiableListView)
      return _icuHospitalizeCriteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_icuHospitalizeCriteria);
  }

  final List<CriterionItemDto> _resistanceRiskFactorCriteria;
  @override
  @JsonKey()
  List<CriterionItemDto> get resistanceRiskFactorCriteria {
    if (_resistanceRiskFactorCriteria is EqualUnmodifiableListView)
      return _resistanceRiskFactorCriteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resistanceRiskFactorCriteria);
  }

  final List<CriterionItemDto> _otherCriteria;
  @override
  @JsonKey()
  List<CriterionItemDto> get otherCriteria {
    if (_otherCriteria is EqualUnmodifiableListView) return _otherCriteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_otherCriteria);
  }

  @override
  String toString() {
    return 'DiseaseCriteriaDto(icuHospitalizeCriteria: $icuHospitalizeCriteria, resistanceRiskFactorCriteria: $resistanceRiskFactorCriteria, otherCriteria: $otherCriteria)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiseaseCriteriaDtoImpl &&
            const DeepCollectionEquality().equals(
              other._icuHospitalizeCriteria,
              _icuHospitalizeCriteria,
            ) &&
            const DeepCollectionEquality().equals(
              other._resistanceRiskFactorCriteria,
              _resistanceRiskFactorCriteria,
            ) &&
            const DeepCollectionEquality().equals(
              other._otherCriteria,
              _otherCriteria,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_icuHospitalizeCriteria),
    const DeepCollectionEquality().hash(_resistanceRiskFactorCriteria),
    const DeepCollectionEquality().hash(_otherCriteria),
  );

  /// Create a copy of DiseaseCriteriaDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiseaseCriteriaDtoImplCopyWith<_$DiseaseCriteriaDtoImpl> get copyWith =>
      __$$DiseaseCriteriaDtoImplCopyWithImpl<_$DiseaseCriteriaDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiseaseCriteriaDtoImplToJson(this);
  }
}

abstract class _DiseaseCriteriaDto implements DiseaseCriteriaDto {
  const factory _DiseaseCriteriaDto({
    final List<CriterionItemDto> icuHospitalizeCriteria,
    final List<CriterionItemDto> resistanceRiskFactorCriteria,
    final List<CriterionItemDto> otherCriteria,
  }) = _$DiseaseCriteriaDtoImpl;

  factory _DiseaseCriteriaDto.fromJson(Map<String, dynamic> json) =
      _$DiseaseCriteriaDtoImpl.fromJson;

  @override
  List<CriterionItemDto> get icuHospitalizeCriteria;
  @override
  List<CriterionItemDto> get resistanceRiskFactorCriteria;
  @override
  List<CriterionItemDto> get otherCriteria;

  /// Create a copy of DiseaseCriteriaDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiseaseCriteriaDtoImplCopyWith<_$DiseaseCriteriaDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PathogenItemDto _$PathogenItemDtoFromJson(Map<String, dynamic> json) {
  return _PathogenItemDto.fromJson(json);
}

/// @nodoc
mixin _$PathogenItemDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PathogenItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PathogenItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PathogenItemDtoCopyWith<PathogenItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathogenItemDtoCopyWith<$Res> {
  factory $PathogenItemDtoCopyWith(
    PathogenItemDto value,
    $Res Function(PathogenItemDto) then,
  ) = _$PathogenItemDtoCopyWithImpl<$Res, PathogenItemDto>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$PathogenItemDtoCopyWithImpl<$Res, $Val extends PathogenItemDto>
    implements $PathogenItemDtoCopyWith<$Res> {
  _$PathogenItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PathogenItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PathogenItemDtoImplCopyWith<$Res>
    implements $PathogenItemDtoCopyWith<$Res> {
  factory _$$PathogenItemDtoImplCopyWith(
    _$PathogenItemDtoImpl value,
    $Res Function(_$PathogenItemDtoImpl) then,
  ) = __$$PathogenItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$PathogenItemDtoImplCopyWithImpl<$Res>
    extends _$PathogenItemDtoCopyWithImpl<$Res, _$PathogenItemDtoImpl>
    implements _$$PathogenItemDtoImplCopyWith<$Res> {
  __$$PathogenItemDtoImplCopyWithImpl(
    _$PathogenItemDtoImpl _value,
    $Res Function(_$PathogenItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PathogenItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _$PathogenItemDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PathogenItemDtoImpl implements _PathogenItemDto {
  const _$PathogenItemDtoImpl({required this.id, required this.name});

  factory _$PathogenItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PathogenItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'PathogenItemDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathogenItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of PathogenItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PathogenItemDtoImplCopyWith<_$PathogenItemDtoImpl> get copyWith =>
      __$$PathogenItemDtoImplCopyWithImpl<_$PathogenItemDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PathogenItemDtoImplToJson(this);
  }
}

abstract class _PathogenItemDto implements PathogenItemDto {
  const factory _PathogenItemDto({
    required final String id,
    required final String name,
  }) = _$PathogenItemDtoImpl;

  factory _PathogenItemDto.fromJson(Map<String, dynamic> json) =
      _$PathogenItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;

  /// Create a copy of PathogenItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PathogenItemDtoImplCopyWith<_$PathogenItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AntibioticResultDto _$AntibioticResultDtoFromJson(Map<String, dynamic> json) {
  return _AntibioticResultDto.fromJson(json);
}

/// @nodoc
mixin _$AntibioticResultDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get antibioticGroupName => throw _privateConstructorUsedError;
  String get classification => throw _privateConstructorUsedError;
  List<DosageDto> get dosages => throw _privateConstructorUsedError;

  /// Serializes this AntibioticResultDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AntibioticResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AntibioticResultDtoCopyWith<AntibioticResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AntibioticResultDtoCopyWith<$Res> {
  factory $AntibioticResultDtoCopyWith(
    AntibioticResultDto value,
    $Res Function(AntibioticResultDto) then,
  ) = _$AntibioticResultDtoCopyWithImpl<$Res, AntibioticResultDto>;
  @useResult
  $Res call({
    String id,
    String name,
    String antibioticGroupName,
    String classification,
    List<DosageDto> dosages,
  });
}

/// @nodoc
class _$AntibioticResultDtoCopyWithImpl<$Res, $Val extends AntibioticResultDto>
    implements $AntibioticResultDtoCopyWith<$Res> {
  _$AntibioticResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AntibioticResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? antibioticGroupName = null,
    Object? classification = null,
    Object? dosages = null,
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
            antibioticGroupName: null == antibioticGroupName
                ? _value.antibioticGroupName
                : antibioticGroupName // ignore: cast_nullable_to_non_nullable
                      as String,
            classification: null == classification
                ? _value.classification
                : classification // ignore: cast_nullable_to_non_nullable
                      as String,
            dosages: null == dosages
                ? _value.dosages
                : dosages // ignore: cast_nullable_to_non_nullable
                      as List<DosageDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AntibioticResultDtoImplCopyWith<$Res>
    implements $AntibioticResultDtoCopyWith<$Res> {
  factory _$$AntibioticResultDtoImplCopyWith(
    _$AntibioticResultDtoImpl value,
    $Res Function(_$AntibioticResultDtoImpl) then,
  ) = __$$AntibioticResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String antibioticGroupName,
    String classification,
    List<DosageDto> dosages,
  });
}

/// @nodoc
class __$$AntibioticResultDtoImplCopyWithImpl<$Res>
    extends _$AntibioticResultDtoCopyWithImpl<$Res, _$AntibioticResultDtoImpl>
    implements _$$AntibioticResultDtoImplCopyWith<$Res> {
  __$$AntibioticResultDtoImplCopyWithImpl(
    _$AntibioticResultDtoImpl _value,
    $Res Function(_$AntibioticResultDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AntibioticResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? antibioticGroupName = null,
    Object? classification = null,
    Object? dosages = null,
  }) {
    return _then(
      _$AntibioticResultDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        antibioticGroupName: null == antibioticGroupName
            ? _value.antibioticGroupName
            : antibioticGroupName // ignore: cast_nullable_to_non_nullable
                  as String,
        classification: null == classification
            ? _value.classification
            : classification // ignore: cast_nullable_to_non_nullable
                  as String,
        dosages: null == dosages
            ? _value._dosages
            : dosages // ignore: cast_nullable_to_non_nullable
                  as List<DosageDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AntibioticResultDtoImpl implements _AntibioticResultDto {
  const _$AntibioticResultDtoImpl({
    required this.id,
    required this.name,
    required this.antibioticGroupName,
    required this.classification,
    final List<DosageDto> dosages = const [],
  }) : _dosages = dosages;

  factory _$AntibioticResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AntibioticResultDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String antibioticGroupName;
  @override
  final String classification;
  final List<DosageDto> _dosages;
  @override
  @JsonKey()
  List<DosageDto> get dosages {
    if (_dosages is EqualUnmodifiableListView) return _dosages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dosages);
  }

  @override
  String toString() {
    return 'AntibioticResultDto(id: $id, name: $name, antibioticGroupName: $antibioticGroupName, classification: $classification, dosages: $dosages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AntibioticResultDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.antibioticGroupName, antibioticGroupName) ||
                other.antibioticGroupName == antibioticGroupName) &&
            (identical(other.classification, classification) ||
                other.classification == classification) &&
            const DeepCollectionEquality().equals(other._dosages, _dosages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    antibioticGroupName,
    classification,
    const DeepCollectionEquality().hash(_dosages),
  );

  /// Create a copy of AntibioticResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AntibioticResultDtoImplCopyWith<_$AntibioticResultDtoImpl> get copyWith =>
      __$$AntibioticResultDtoImplCopyWithImpl<_$AntibioticResultDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AntibioticResultDtoImplToJson(this);
  }
}

abstract class _AntibioticResultDto implements AntibioticResultDto {
  const factory _AntibioticResultDto({
    required final String id,
    required final String name,
    required final String antibioticGroupName,
    required final String classification,
    final List<DosageDto> dosages,
  }) = _$AntibioticResultDtoImpl;

  factory _AntibioticResultDto.fromJson(Map<String, dynamic> json) =
      _$AntibioticResultDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get antibioticGroupName;
  @override
  String get classification;
  @override
  List<DosageDto> get dosages;

  /// Create a copy of AntibioticResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AntibioticResultDtoImplCopyWith<_$AntibioticResultDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DosageDto _$DosageDtoFromJson(Map<String, dynamic> json) {
  return _DosageDto.fromJson(json);
}

/// @nodoc
mixin _$DosageDto {
  String get routeOfAdministration => throw _privateConstructorUsedError;
  String get dose => throw _privateConstructorUsedError;

  /// Serializes this DosageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DosageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DosageDtoCopyWith<DosageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DosageDtoCopyWith<$Res> {
  factory $DosageDtoCopyWith(DosageDto value, $Res Function(DosageDto) then) =
      _$DosageDtoCopyWithImpl<$Res, DosageDto>;
  @useResult
  $Res call({String routeOfAdministration, String dose});
}

/// @nodoc
class _$DosageDtoCopyWithImpl<$Res, $Val extends DosageDto>
    implements $DosageDtoCopyWith<$Res> {
  _$DosageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DosageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? routeOfAdministration = null, Object? dose = null}) {
    return _then(
      _value.copyWith(
            routeOfAdministration: null == routeOfAdministration
                ? _value.routeOfAdministration
                : routeOfAdministration // ignore: cast_nullable_to_non_nullable
                      as String,
            dose: null == dose
                ? _value.dose
                : dose // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DosageDtoImplCopyWith<$Res>
    implements $DosageDtoCopyWith<$Res> {
  factory _$$DosageDtoImplCopyWith(
    _$DosageDtoImpl value,
    $Res Function(_$DosageDtoImpl) then,
  ) = __$$DosageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String routeOfAdministration, String dose});
}

/// @nodoc
class __$$DosageDtoImplCopyWithImpl<$Res>
    extends _$DosageDtoCopyWithImpl<$Res, _$DosageDtoImpl>
    implements _$$DosageDtoImplCopyWith<$Res> {
  __$$DosageDtoImplCopyWithImpl(
    _$DosageDtoImpl _value,
    $Res Function(_$DosageDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DosageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? routeOfAdministration = null, Object? dose = null}) {
    return _then(
      _$DosageDtoImpl(
        routeOfAdministration: null == routeOfAdministration
            ? _value.routeOfAdministration
            : routeOfAdministration // ignore: cast_nullable_to_non_nullable
                  as String,
        dose: null == dose
            ? _value.dose
            : dose // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DosageDtoImpl implements _DosageDto {
  const _$DosageDtoImpl({
    required this.routeOfAdministration,
    required this.dose,
  });

  factory _$DosageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DosageDtoImplFromJson(json);

  @override
  final String routeOfAdministration;
  @override
  final String dose;

  @override
  String toString() {
    return 'DosageDto(routeOfAdministration: $routeOfAdministration, dose: $dose)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DosageDtoImpl &&
            (identical(other.routeOfAdministration, routeOfAdministration) ||
                other.routeOfAdministration == routeOfAdministration) &&
            (identical(other.dose, dose) || other.dose == dose));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, routeOfAdministration, dose);

  /// Create a copy of DosageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DosageDtoImplCopyWith<_$DosageDtoImpl> get copyWith =>
      __$$DosageDtoImplCopyWithImpl<_$DosageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DosageDtoImplToJson(this);
  }
}

abstract class _DosageDto implements DosageDto {
  const factory _DosageDto({
    required final String routeOfAdministration,
    required final String dose,
  }) = _$DosageDtoImpl;

  factory _DosageDto.fromJson(Map<String, dynamic> json) =
      _$DosageDtoImpl.fromJson;

  @override
  String get routeOfAdministration;
  @override
  String get dose;

  /// Create a copy of DosageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DosageDtoImplCopyWith<_$DosageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InfectionProbabilityDto _$InfectionProbabilityDtoFromJson(
  Map<String, dynamic> json,
) {
  return _InfectionProbabilityDto.fromJson(json);
}

/// @nodoc
mixin _$InfectionProbabilityDto {
  String get pathogenId => throw _privateConstructorUsedError;
  String get pathogenName => throw _privateConstructorUsedError;
  double get probability => throw _privateConstructorUsedError;

  /// Serializes this InfectionProbabilityDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfectionProbabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfectionProbabilityDtoCopyWith<InfectionProbabilityDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfectionProbabilityDtoCopyWith<$Res> {
  factory $InfectionProbabilityDtoCopyWith(
    InfectionProbabilityDto value,
    $Res Function(InfectionProbabilityDto) then,
  ) = _$InfectionProbabilityDtoCopyWithImpl<$Res, InfectionProbabilityDto>;
  @useResult
  $Res call({String pathogenId, String pathogenName, double probability});
}

/// @nodoc
class _$InfectionProbabilityDtoCopyWithImpl<
  $Res,
  $Val extends InfectionProbabilityDto
>
    implements $InfectionProbabilityDtoCopyWith<$Res> {
  _$InfectionProbabilityDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfectionProbabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathogenId = null,
    Object? pathogenName = null,
    Object? probability = null,
  }) {
    return _then(
      _value.copyWith(
            pathogenId: null == pathogenId
                ? _value.pathogenId
                : pathogenId // ignore: cast_nullable_to_non_nullable
                      as String,
            pathogenName: null == pathogenName
                ? _value.pathogenName
                : pathogenName // ignore: cast_nullable_to_non_nullable
                      as String,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InfectionProbabilityDtoImplCopyWith<$Res>
    implements $InfectionProbabilityDtoCopyWith<$Res> {
  factory _$$InfectionProbabilityDtoImplCopyWith(
    _$InfectionProbabilityDtoImpl value,
    $Res Function(_$InfectionProbabilityDtoImpl) then,
  ) = __$$InfectionProbabilityDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pathogenId, String pathogenName, double probability});
}

/// @nodoc
class __$$InfectionProbabilityDtoImplCopyWithImpl<$Res>
    extends
        _$InfectionProbabilityDtoCopyWithImpl<
          $Res,
          _$InfectionProbabilityDtoImpl
        >
    implements _$$InfectionProbabilityDtoImplCopyWith<$Res> {
  __$$InfectionProbabilityDtoImplCopyWithImpl(
    _$InfectionProbabilityDtoImpl _value,
    $Res Function(_$InfectionProbabilityDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InfectionProbabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathogenId = null,
    Object? pathogenName = null,
    Object? probability = null,
  }) {
    return _then(
      _$InfectionProbabilityDtoImpl(
        pathogenId: null == pathogenId
            ? _value.pathogenId
            : pathogenId // ignore: cast_nullable_to_non_nullable
                  as String,
        pathogenName: null == pathogenName
            ? _value.pathogenName
            : pathogenName // ignore: cast_nullable_to_non_nullable
                  as String,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InfectionProbabilityDtoImpl implements _InfectionProbabilityDto {
  const _$InfectionProbabilityDtoImpl({
    required this.pathogenId,
    required this.pathogenName,
    required this.probability,
  });

  factory _$InfectionProbabilityDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfectionProbabilityDtoImplFromJson(json);

  @override
  final String pathogenId;
  @override
  final String pathogenName;
  @override
  final double probability;

  @override
  String toString() {
    return 'InfectionProbabilityDto(pathogenId: $pathogenId, pathogenName: $pathogenName, probability: $probability)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfectionProbabilityDtoImpl &&
            (identical(other.pathogenId, pathogenId) ||
                other.pathogenId == pathogenId) &&
            (identical(other.pathogenName, pathogenName) ||
                other.pathogenName == pathogenName) &&
            (identical(other.probability, probability) ||
                other.probability == probability));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pathogenId, pathogenName, probability);

  /// Create a copy of InfectionProbabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfectionProbabilityDtoImplCopyWith<_$InfectionProbabilityDtoImpl>
  get copyWith =>
      __$$InfectionProbabilityDtoImplCopyWithImpl<
        _$InfectionProbabilityDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfectionProbabilityDtoImplToJson(this);
  }
}

abstract class _InfectionProbabilityDto implements InfectionProbabilityDto {
  const factory _InfectionProbabilityDto({
    required final String pathogenId,
    required final String pathogenName,
    required final double probability,
  }) = _$InfectionProbabilityDtoImpl;

  factory _InfectionProbabilityDto.fromJson(Map<String, dynamic> json) =
      _$InfectionProbabilityDtoImpl.fromJson;

  @override
  String get pathogenId;
  @override
  String get pathogenName;
  @override
  double get probability;

  /// Create a copy of InfectionProbabilityDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfectionProbabilityDtoImplCopyWith<_$InfectionProbabilityDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ReferenceDto _$ReferenceDtoFromJson(Map<String, dynamic> json) {
  return _ReferenceDto.fromJson(json);
}

/// @nodoc
mixin _$ReferenceDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get issuer => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;

  /// Serializes this ReferenceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReferenceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReferenceDtoCopyWith<ReferenceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferenceDtoCopyWith<$Res> {
  factory $ReferenceDtoCopyWith(
    ReferenceDto value,
    $Res Function(ReferenceDto) then,
  ) = _$ReferenceDtoCopyWithImpl<$Res, ReferenceDto>;
  @useResult
  $Res call({String id, String name, String issuer, int version});
}

/// @nodoc
class _$ReferenceDtoCopyWithImpl<$Res, $Val extends ReferenceDto>
    implements $ReferenceDtoCopyWith<$Res> {
  _$ReferenceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReferenceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? issuer = null,
    Object? version = null,
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
            issuer: null == issuer
                ? _value.issuer
                : issuer // ignore: cast_nullable_to_non_nullable
                      as String,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReferenceDtoImplCopyWith<$Res>
    implements $ReferenceDtoCopyWith<$Res> {
  factory _$$ReferenceDtoImplCopyWith(
    _$ReferenceDtoImpl value,
    $Res Function(_$ReferenceDtoImpl) then,
  ) = __$$ReferenceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String issuer, int version});
}

/// @nodoc
class __$$ReferenceDtoImplCopyWithImpl<$Res>
    extends _$ReferenceDtoCopyWithImpl<$Res, _$ReferenceDtoImpl>
    implements _$$ReferenceDtoImplCopyWith<$Res> {
  __$$ReferenceDtoImplCopyWithImpl(
    _$ReferenceDtoImpl _value,
    $Res Function(_$ReferenceDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReferenceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? issuer = null,
    Object? version = null,
  }) {
    return _then(
      _$ReferenceDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        issuer: null == issuer
            ? _value.issuer
            : issuer // ignore: cast_nullable_to_non_nullable
                  as String,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReferenceDtoImpl implements _ReferenceDto {
  const _$ReferenceDtoImpl({
    required this.id,
    required this.name,
    required this.issuer,
    required this.version,
  });

  factory _$ReferenceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReferenceDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String issuer;
  @override
  final int version;

  @override
  String toString() {
    return 'ReferenceDto(id: $id, name: $name, issuer: $issuer, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReferenceDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.issuer, issuer) || other.issuer == issuer) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, issuer, version);

  /// Create a copy of ReferenceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReferenceDtoImplCopyWith<_$ReferenceDtoImpl> get copyWith =>
      __$$ReferenceDtoImplCopyWithImpl<_$ReferenceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReferenceDtoImplToJson(this);
  }
}

abstract class _ReferenceDto implements ReferenceDto {
  const factory _ReferenceDto({
    required final String id,
    required final String name,
    required final String issuer,
    required final int version,
  }) = _$ReferenceDtoImpl;

  factory _ReferenceDto.fromJson(Map<String, dynamic> json) =
      _$ReferenceDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get issuer;
  @override
  int get version;

  /// Create a copy of ReferenceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReferenceDtoImplCopyWith<_$ReferenceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmpiricalDiagnoseResultDto _$EmpiricalDiagnoseResultDtoFromJson(
  Map<String, dynamic> json,
) {
  return _EmpiricalDiagnoseResultDto.fromJson(json);
}

/// @nodoc
mixin _$EmpiricalDiagnoseResultDto {
  double get crcl => throw _privateConstructorUsedError;
  String get severity =>
      throw _privateConstructorUsedError; // Mild | Moderate | Severe
  String get treatmentSite =>
      throw _privateConstructorUsedError; // Outpatient | Inpatient | IntensiveCareUnit
  List<AntibioticResultDto> get recommendations =>
      throw _privateConstructorUsedError;
  List<AntibioticResultDto> get medicines => throw _privateConstructorUsedError;
  List<InfectionProbabilityDto> get infectionProbabilities =>
      throw _privateConstructorUsedError;
  List<ReferenceDto> get references => throw _privateConstructorUsedError;

  /// Serializes this EmpiricalDiagnoseResultDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmpiricalDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmpiricalDiagnoseResultDtoCopyWith<EmpiricalDiagnoseResultDto>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmpiricalDiagnoseResultDtoCopyWith<$Res> {
  factory $EmpiricalDiagnoseResultDtoCopyWith(
    EmpiricalDiagnoseResultDto value,
    $Res Function(EmpiricalDiagnoseResultDto) then,
  ) =
      _$EmpiricalDiagnoseResultDtoCopyWithImpl<
        $Res,
        EmpiricalDiagnoseResultDto
      >;
  @useResult
  $Res call({
    double crcl,
    String severity,
    String treatmentSite,
    List<AntibioticResultDto> recommendations,
    List<AntibioticResultDto> medicines,
    List<InfectionProbabilityDto> infectionProbabilities,
    List<ReferenceDto> references,
  });
}

/// @nodoc
class _$EmpiricalDiagnoseResultDtoCopyWithImpl<
  $Res,
  $Val extends EmpiricalDiagnoseResultDto
>
    implements $EmpiricalDiagnoseResultDtoCopyWith<$Res> {
  _$EmpiricalDiagnoseResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmpiricalDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crcl = null,
    Object? severity = null,
    Object? treatmentSite = null,
    Object? recommendations = null,
    Object? medicines = null,
    Object? infectionProbabilities = null,
    Object? references = null,
  }) {
    return _then(
      _value.copyWith(
            crcl: null == crcl
                ? _value.crcl
                : crcl // ignore: cast_nullable_to_non_nullable
                      as double,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as String,
            treatmentSite: null == treatmentSite
                ? _value.treatmentSite
                : treatmentSite // ignore: cast_nullable_to_non_nullable
                      as String,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<AntibioticResultDto>,
            medicines: null == medicines
                ? _value.medicines
                : medicines // ignore: cast_nullable_to_non_nullable
                      as List<AntibioticResultDto>,
            infectionProbabilities: null == infectionProbabilities
                ? _value.infectionProbabilities
                : infectionProbabilities // ignore: cast_nullable_to_non_nullable
                      as List<InfectionProbabilityDto>,
            references: null == references
                ? _value.references
                : references // ignore: cast_nullable_to_non_nullable
                      as List<ReferenceDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmpiricalDiagnoseResultDtoImplCopyWith<$Res>
    implements $EmpiricalDiagnoseResultDtoCopyWith<$Res> {
  factory _$$EmpiricalDiagnoseResultDtoImplCopyWith(
    _$EmpiricalDiagnoseResultDtoImpl value,
    $Res Function(_$EmpiricalDiagnoseResultDtoImpl) then,
  ) = __$$EmpiricalDiagnoseResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double crcl,
    String severity,
    String treatmentSite,
    List<AntibioticResultDto> recommendations,
    List<AntibioticResultDto> medicines,
    List<InfectionProbabilityDto> infectionProbabilities,
    List<ReferenceDto> references,
  });
}

/// @nodoc
class __$$EmpiricalDiagnoseResultDtoImplCopyWithImpl<$Res>
    extends
        _$EmpiricalDiagnoseResultDtoCopyWithImpl<
          $Res,
          _$EmpiricalDiagnoseResultDtoImpl
        >
    implements _$$EmpiricalDiagnoseResultDtoImplCopyWith<$Res> {
  __$$EmpiricalDiagnoseResultDtoImplCopyWithImpl(
    _$EmpiricalDiagnoseResultDtoImpl _value,
    $Res Function(_$EmpiricalDiagnoseResultDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmpiricalDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crcl = null,
    Object? severity = null,
    Object? treatmentSite = null,
    Object? recommendations = null,
    Object? medicines = null,
    Object? infectionProbabilities = null,
    Object? references = null,
  }) {
    return _then(
      _$EmpiricalDiagnoseResultDtoImpl(
        crcl: null == crcl
            ? _value.crcl
            : crcl // ignore: cast_nullable_to_non_nullable
                  as double,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as String,
        treatmentSite: null == treatmentSite
            ? _value.treatmentSite
            : treatmentSite // ignore: cast_nullable_to_non_nullable
                  as String,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<AntibioticResultDto>,
        medicines: null == medicines
            ? _value._medicines
            : medicines // ignore: cast_nullable_to_non_nullable
                  as List<AntibioticResultDto>,
        infectionProbabilities: null == infectionProbabilities
            ? _value._infectionProbabilities
            : infectionProbabilities // ignore: cast_nullable_to_non_nullable
                  as List<InfectionProbabilityDto>,
        references: null == references
            ? _value._references
            : references // ignore: cast_nullable_to_non_nullable
                  as List<ReferenceDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmpiricalDiagnoseResultDtoImpl implements _EmpiricalDiagnoseResultDto {
  const _$EmpiricalDiagnoseResultDtoImpl({
    required this.crcl,
    required this.severity,
    required this.treatmentSite,
    final List<AntibioticResultDto> recommendations = const [],
    final List<AntibioticResultDto> medicines = const [],
    final List<InfectionProbabilityDto> infectionProbabilities = const [],
    final List<ReferenceDto> references = const [],
  }) : _recommendations = recommendations,
       _medicines = medicines,
       _infectionProbabilities = infectionProbabilities,
       _references = references;

  factory _$EmpiricalDiagnoseResultDtoImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$EmpiricalDiagnoseResultDtoImplFromJson(json);

  @override
  final double crcl;
  @override
  final String severity;
  // Mild | Moderate | Severe
  @override
  final String treatmentSite;
  // Outpatient | Inpatient | IntensiveCareUnit
  final List<AntibioticResultDto> _recommendations;
  // Outpatient | Inpatient | IntensiveCareUnit
  @override
  @JsonKey()
  List<AntibioticResultDto> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  final List<AntibioticResultDto> _medicines;
  @override
  @JsonKey()
  List<AntibioticResultDto> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  final List<InfectionProbabilityDto> _infectionProbabilities;
  @override
  @JsonKey()
  List<InfectionProbabilityDto> get infectionProbabilities {
    if (_infectionProbabilities is EqualUnmodifiableListView)
      return _infectionProbabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_infectionProbabilities);
  }

  final List<ReferenceDto> _references;
  @override
  @JsonKey()
  List<ReferenceDto> get references {
    if (_references is EqualUnmodifiableListView) return _references;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_references);
  }

  @override
  String toString() {
    return 'EmpiricalDiagnoseResultDto(crcl: $crcl, severity: $severity, treatmentSite: $treatmentSite, recommendations: $recommendations, medicines: $medicines, infectionProbabilities: $infectionProbabilities, references: $references)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmpiricalDiagnoseResultDtoImpl &&
            (identical(other.crcl, crcl) || other.crcl == crcl) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.treatmentSite, treatmentSite) ||
                other.treatmentSite == treatmentSite) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            const DeepCollectionEquality().equals(
              other._medicines,
              _medicines,
            ) &&
            const DeepCollectionEquality().equals(
              other._infectionProbabilities,
              _infectionProbabilities,
            ) &&
            const DeepCollectionEquality().equals(
              other._references,
              _references,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    crcl,
    severity,
    treatmentSite,
    const DeepCollectionEquality().hash(_recommendations),
    const DeepCollectionEquality().hash(_medicines),
    const DeepCollectionEquality().hash(_infectionProbabilities),
    const DeepCollectionEquality().hash(_references),
  );

  /// Create a copy of EmpiricalDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmpiricalDiagnoseResultDtoImplCopyWith<_$EmpiricalDiagnoseResultDtoImpl>
  get copyWith =>
      __$$EmpiricalDiagnoseResultDtoImplCopyWithImpl<
        _$EmpiricalDiagnoseResultDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmpiricalDiagnoseResultDtoImplToJson(this);
  }
}

abstract class _EmpiricalDiagnoseResultDto
    implements EmpiricalDiagnoseResultDto {
  const factory _EmpiricalDiagnoseResultDto({
    required final double crcl,
    required final String severity,
    required final String treatmentSite,
    final List<AntibioticResultDto> recommendations,
    final List<AntibioticResultDto> medicines,
    final List<InfectionProbabilityDto> infectionProbabilities,
    final List<ReferenceDto> references,
  }) = _$EmpiricalDiagnoseResultDtoImpl;

  factory _EmpiricalDiagnoseResultDto.fromJson(Map<String, dynamic> json) =
      _$EmpiricalDiagnoseResultDtoImpl.fromJson;

  @override
  double get crcl;
  @override
  String get severity; // Mild | Moderate | Severe
  @override
  String get treatmentSite; // Outpatient | Inpatient | IntensiveCareUnit
  @override
  List<AntibioticResultDto> get recommendations;
  @override
  List<AntibioticResultDto> get medicines;
  @override
  List<InfectionProbabilityDto> get infectionProbabilities;
  @override
  List<ReferenceDto> get references;

  /// Create a copy of EmpiricalDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmpiricalDiagnoseResultDtoImplCopyWith<_$EmpiricalDiagnoseResultDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TargetedDiagnoseResultDto _$TargetedDiagnoseResultDtoFromJson(
  Map<String, dynamic> json,
) {
  return _TargetedDiagnoseResultDto.fromJson(json);
}

/// @nodoc
mixin _$TargetedDiagnoseResultDto {
  double get crcl => throw _privateConstructorUsedError;
  List<AntibioticResultDto> get recommendations =>
      throw _privateConstructorUsedError;

  /// Serializes this TargetedDiagnoseResultDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TargetedDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TargetedDiagnoseResultDtoCopyWith<TargetedDiagnoseResultDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargetedDiagnoseResultDtoCopyWith<$Res> {
  factory $TargetedDiagnoseResultDtoCopyWith(
    TargetedDiagnoseResultDto value,
    $Res Function(TargetedDiagnoseResultDto) then,
  ) = _$TargetedDiagnoseResultDtoCopyWithImpl<$Res, TargetedDiagnoseResultDto>;
  @useResult
  $Res call({double crcl, List<AntibioticResultDto> recommendations});
}

/// @nodoc
class _$TargetedDiagnoseResultDtoCopyWithImpl<
  $Res,
  $Val extends TargetedDiagnoseResultDto
>
    implements $TargetedDiagnoseResultDtoCopyWith<$Res> {
  _$TargetedDiagnoseResultDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TargetedDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? crcl = null, Object? recommendations = null}) {
    return _then(
      _value.copyWith(
            crcl: null == crcl
                ? _value.crcl
                : crcl // ignore: cast_nullable_to_non_nullable
                      as double,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<AntibioticResultDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TargetedDiagnoseResultDtoImplCopyWith<$Res>
    implements $TargetedDiagnoseResultDtoCopyWith<$Res> {
  factory _$$TargetedDiagnoseResultDtoImplCopyWith(
    _$TargetedDiagnoseResultDtoImpl value,
    $Res Function(_$TargetedDiagnoseResultDtoImpl) then,
  ) = __$$TargetedDiagnoseResultDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double crcl, List<AntibioticResultDto> recommendations});
}

/// @nodoc
class __$$TargetedDiagnoseResultDtoImplCopyWithImpl<$Res>
    extends
        _$TargetedDiagnoseResultDtoCopyWithImpl<
          $Res,
          _$TargetedDiagnoseResultDtoImpl
        >
    implements _$$TargetedDiagnoseResultDtoImplCopyWith<$Res> {
  __$$TargetedDiagnoseResultDtoImplCopyWithImpl(
    _$TargetedDiagnoseResultDtoImpl _value,
    $Res Function(_$TargetedDiagnoseResultDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TargetedDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? crcl = null, Object? recommendations = null}) {
    return _then(
      _$TargetedDiagnoseResultDtoImpl(
        crcl: null == crcl
            ? _value.crcl
            : crcl // ignore: cast_nullable_to_non_nullable
                  as double,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<AntibioticResultDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TargetedDiagnoseResultDtoImpl implements _TargetedDiagnoseResultDto {
  const _$TargetedDiagnoseResultDtoImpl({
    required this.crcl,
    final List<AntibioticResultDto> recommendations = const [],
  }) : _recommendations = recommendations;

  factory _$TargetedDiagnoseResultDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TargetedDiagnoseResultDtoImplFromJson(json);

  @override
  final double crcl;
  final List<AntibioticResultDto> _recommendations;
  @override
  @JsonKey()
  List<AntibioticResultDto> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'TargetedDiagnoseResultDto(crcl: $crcl, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TargetedDiagnoseResultDtoImpl &&
            (identical(other.crcl, crcl) || other.crcl == crcl) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    crcl,
    const DeepCollectionEquality().hash(_recommendations),
  );

  /// Create a copy of TargetedDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TargetedDiagnoseResultDtoImplCopyWith<_$TargetedDiagnoseResultDtoImpl>
  get copyWith =>
      __$$TargetedDiagnoseResultDtoImplCopyWithImpl<
        _$TargetedDiagnoseResultDtoImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TargetedDiagnoseResultDtoImplToJson(this);
  }
}

abstract class _TargetedDiagnoseResultDto implements TargetedDiagnoseResultDto {
  const factory _TargetedDiagnoseResultDto({
    required final double crcl,
    final List<AntibioticResultDto> recommendations,
  }) = _$TargetedDiagnoseResultDtoImpl;

  factory _TargetedDiagnoseResultDto.fromJson(Map<String, dynamic> json) =
      _$TargetedDiagnoseResultDtoImpl.fromJson;

  @override
  double get crcl;
  @override
  List<AntibioticResultDto> get recommendations;

  /// Create a copy of TargetedDiagnoseResultDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TargetedDiagnoseResultDtoImplCopyWith<_$TargetedDiagnoseResultDtoImpl>
  get copyWith => throw _privateConstructorUsedError;
}
