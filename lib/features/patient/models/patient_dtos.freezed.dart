// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PatientListItemDto _$PatientListItemDtoFromJson(Map<String, dynamic> json) {
  return _PatientListItemDto.fromJson(json);
}

/// @nodoc
mixin _$PatientListItemDto {
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  bool get isMale => throw _privateConstructorUsedError;
  String get medicalRecordCode => throw _privateConstructorUsedError;
  PatientStatusDto get status => throw _privateConstructorUsedError;

  /// Serializes this PatientListItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientListItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientListItemDtoCopyWith<PatientListItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientListItemDtoCopyWith<$Res> {
  factory $PatientListItemDtoCopyWith(
    PatientListItemDto value,
    $Res Function(PatientListItemDto) then,
  ) = _$PatientListItemDtoCopyWithImpl<$Res, PatientListItemDto>;
  @useResult
  $Res call({
    String id,
    String fullName,
    int age,
    bool isMale,
    String medicalRecordCode,
    PatientStatusDto status,
  });
}

/// @nodoc
class _$PatientListItemDtoCopyWithImpl<$Res, $Val extends PatientListItemDto>
    implements $PatientListItemDtoCopyWith<$Res> {
  _$PatientListItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientListItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? age = null,
    Object? isMale = null,
    Object? medicalRecordCode = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            isMale: null == isMale
                ? _value.isMale
                : isMale // ignore: cast_nullable_to_non_nullable
                      as bool,
            medicalRecordCode: null == medicalRecordCode
                ? _value.medicalRecordCode
                : medicalRecordCode // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PatientStatusDto,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientListItemDtoImplCopyWith<$Res>
    implements $PatientListItemDtoCopyWith<$Res> {
  factory _$$PatientListItemDtoImplCopyWith(
    _$PatientListItemDtoImpl value,
    $Res Function(_$PatientListItemDtoImpl) then,
  ) = __$$PatientListItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String fullName,
    int age,
    bool isMale,
    String medicalRecordCode,
    PatientStatusDto status,
  });
}

/// @nodoc
class __$$PatientListItemDtoImplCopyWithImpl<$Res>
    extends _$PatientListItemDtoCopyWithImpl<$Res, _$PatientListItemDtoImpl>
    implements _$$PatientListItemDtoImplCopyWith<$Res> {
  __$$PatientListItemDtoImplCopyWithImpl(
    _$PatientListItemDtoImpl _value,
    $Res Function(_$PatientListItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientListItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? age = null,
    Object? isMale = null,
    Object? medicalRecordCode = null,
    Object? status = null,
  }) {
    return _then(
      _$PatientListItemDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        isMale: null == isMale
            ? _value.isMale
            : isMale // ignore: cast_nullable_to_non_nullable
                  as bool,
        medicalRecordCode: null == medicalRecordCode
            ? _value.medicalRecordCode
            : medicalRecordCode // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PatientStatusDto,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientListItemDtoImpl implements _PatientListItemDto {
  const _$PatientListItemDtoImpl({
    required this.id,
    required this.fullName,
    required this.age,
    required this.isMale,
    required this.medicalRecordCode,
    required this.status,
  });

  factory _$PatientListItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientListItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final int age;
  @override
  final bool isMale;
  @override
  final String medicalRecordCode;
  @override
  final PatientStatusDto status;

  @override
  String toString() {
    return 'PatientListItemDto(id: $id, fullName: $fullName, age: $age, isMale: $isMale, medicalRecordCode: $medicalRecordCode, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.isMale, isMale) || other.isMale == isMale) &&
            (identical(other.medicalRecordCode, medicalRecordCode) ||
                other.medicalRecordCode == medicalRecordCode) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    age,
    isMale,
    medicalRecordCode,
    status,
  );

  /// Create a copy of PatientListItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientListItemDtoImplCopyWith<_$PatientListItemDtoImpl> get copyWith =>
      __$$PatientListItemDtoImplCopyWithImpl<_$PatientListItemDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientListItemDtoImplToJson(this);
  }
}

abstract class _PatientListItemDto implements PatientListItemDto {
  const factory _PatientListItemDto({
    required final String id,
    required final String fullName,
    required final int age,
    required final bool isMale,
    required final String medicalRecordCode,
    required final PatientStatusDto status,
  }) = _$PatientListItemDtoImpl;

  factory _PatientListItemDto.fromJson(Map<String, dynamic> json) =
      _$PatientListItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  int get age;
  @override
  bool get isMale;
  @override
  String get medicalRecordCode;
  @override
  PatientStatusDto get status;

  /// Create a copy of PatientListItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientListItemDtoImplCopyWith<_$PatientListItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatedPatientDto _$CreatedPatientDtoFromJson(Map<String, dynamic> json) {
  return _CreatedPatientDto.fromJson(json);
}

/// @nodoc
mixin _$CreatedPatientDto {
  String get id => throw _privateConstructorUsedError;

  /// Serializes this CreatedPatientDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreatedPatientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreatedPatientDtoCopyWith<CreatedPatientDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedPatientDtoCopyWith<$Res> {
  factory $CreatedPatientDtoCopyWith(
    CreatedPatientDto value,
    $Res Function(CreatedPatientDto) then,
  ) = _$CreatedPatientDtoCopyWithImpl<$Res, CreatedPatientDto>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$CreatedPatientDtoCopyWithImpl<$Res, $Val extends CreatedPatientDto>
    implements $CreatedPatientDtoCopyWith<$Res> {
  _$CreatedPatientDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreatedPatientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreatedPatientDtoImplCopyWith<$Res>
    implements $CreatedPatientDtoCopyWith<$Res> {
  factory _$$CreatedPatientDtoImplCopyWith(
    _$CreatedPatientDtoImpl value,
    $Res Function(_$CreatedPatientDtoImpl) then,
  ) = __$$CreatedPatientDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$CreatedPatientDtoImplCopyWithImpl<$Res>
    extends _$CreatedPatientDtoCopyWithImpl<$Res, _$CreatedPatientDtoImpl>
    implements _$$CreatedPatientDtoImplCopyWith<$Res> {
  __$$CreatedPatientDtoImplCopyWithImpl(
    _$CreatedPatientDtoImpl _value,
    $Res Function(_$CreatedPatientDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreatedPatientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null}) {
    return _then(
      _$CreatedPatientDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedPatientDtoImpl implements _CreatedPatientDto {
  const _$CreatedPatientDtoImpl({required this.id});

  factory _$CreatedPatientDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedPatientDtoImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'CreatedPatientDto(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedPatientDtoImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of CreatedPatientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedPatientDtoImplCopyWith<_$CreatedPatientDtoImpl> get copyWith =>
      __$$CreatedPatientDtoImplCopyWithImpl<_$CreatedPatientDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedPatientDtoImplToJson(this);
  }
}

abstract class _CreatedPatientDto implements CreatedPatientDto {
  const factory _CreatedPatientDto({required final String id}) =
      _$CreatedPatientDtoImpl;

  factory _CreatedPatientDto.fromJson(Map<String, dynamic> json) =
      _$CreatedPatientDtoImpl.fromJson;

  @override
  String get id;

  /// Create a copy of CreatedPatientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreatedPatientDtoImplCopyWith<_$CreatedPatientDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientDetailDto _$PatientDetailDtoFromJson(Map<String, dynamic> json) {
  return _PatientDetailDto.fromJson(json);
}

/// @nodoc
mixin _$PatientDetailDto {
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get dateOfBirth => throw _privateConstructorUsedError;
  bool get isMale => throw _privateConstructorUsedError;
  String get medicalRecordCode => throw _privateConstructorUsedError;
  String get healthInsuranceCardNumber => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get admission => throw _privateConstructorUsedError;
  String? get discharge => throw _privateConstructorUsedError;
  PatientStatusDto get status => throw _privateConstructorUsedError;
  List<TreatmentItemDto> get treatments => throw _privateConstructorUsedError;

  /// Serializes this PatientDetailDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientDetailDtoCopyWith<PatientDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientDetailDtoCopyWith<$Res> {
  factory $PatientDetailDtoCopyWith(
    PatientDetailDto value,
    $Res Function(PatientDetailDto) then,
  ) = _$PatientDetailDtoCopyWithImpl<$Res, PatientDetailDto>;
  @useResult
  $Res call({
    String id,
    String fullName,
    String dateOfBirth,
    bool isMale,
    String medicalRecordCode,
    String healthInsuranceCardNumber,
    String address,
    String city,
    String country,
    String admission,
    String? discharge,
    PatientStatusDto status,
    List<TreatmentItemDto> treatments,
  });
}

/// @nodoc
class _$PatientDetailDtoCopyWithImpl<$Res, $Val extends PatientDetailDto>
    implements $PatientDetailDtoCopyWith<$Res> {
  _$PatientDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? dateOfBirth = null,
    Object? isMale = null,
    Object? medicalRecordCode = null,
    Object? healthInsuranceCardNumber = null,
    Object? address = null,
    Object? city = null,
    Object? country = null,
    Object? admission = null,
    Object? discharge = freezed,
    Object? status = null,
    Object? treatments = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            dateOfBirth: null == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String,
            isMale: null == isMale
                ? _value.isMale
                : isMale // ignore: cast_nullable_to_non_nullable
                      as bool,
            medicalRecordCode: null == medicalRecordCode
                ? _value.medicalRecordCode
                : medicalRecordCode // ignore: cast_nullable_to_non_nullable
                      as String,
            healthInsuranceCardNumber: null == healthInsuranceCardNumber
                ? _value.healthInsuranceCardNumber
                : healthInsuranceCardNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            country: null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String,
            admission: null == admission
                ? _value.admission
                : admission // ignore: cast_nullable_to_non_nullable
                      as String,
            discharge: freezed == discharge
                ? _value.discharge
                : discharge // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PatientStatusDto,
            treatments: null == treatments
                ? _value.treatments
                : treatments // ignore: cast_nullable_to_non_nullable
                      as List<TreatmentItemDto>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientDetailDtoImplCopyWith<$Res>
    implements $PatientDetailDtoCopyWith<$Res> {
  factory _$$PatientDetailDtoImplCopyWith(
    _$PatientDetailDtoImpl value,
    $Res Function(_$PatientDetailDtoImpl) then,
  ) = __$$PatientDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String fullName,
    String dateOfBirth,
    bool isMale,
    String medicalRecordCode,
    String healthInsuranceCardNumber,
    String address,
    String city,
    String country,
    String admission,
    String? discharge,
    PatientStatusDto status,
    List<TreatmentItemDto> treatments,
  });
}

/// @nodoc
class __$$PatientDetailDtoImplCopyWithImpl<$Res>
    extends _$PatientDetailDtoCopyWithImpl<$Res, _$PatientDetailDtoImpl>
    implements _$$PatientDetailDtoImplCopyWith<$Res> {
  __$$PatientDetailDtoImplCopyWithImpl(
    _$PatientDetailDtoImpl _value,
    $Res Function(_$PatientDetailDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? dateOfBirth = null,
    Object? isMale = null,
    Object? medicalRecordCode = null,
    Object? healthInsuranceCardNumber = null,
    Object? address = null,
    Object? city = null,
    Object? country = null,
    Object? admission = null,
    Object? discharge = freezed,
    Object? status = null,
    Object? treatments = null,
  }) {
    return _then(
      _$PatientDetailDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        dateOfBirth: null == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String,
        isMale: null == isMale
            ? _value.isMale
            : isMale // ignore: cast_nullable_to_non_nullable
                  as bool,
        medicalRecordCode: null == medicalRecordCode
            ? _value.medicalRecordCode
            : medicalRecordCode // ignore: cast_nullable_to_non_nullable
                  as String,
        healthInsuranceCardNumber: null == healthInsuranceCardNumber
            ? _value.healthInsuranceCardNumber
            : healthInsuranceCardNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        country: null == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String,
        admission: null == admission
            ? _value.admission
            : admission // ignore: cast_nullable_to_non_nullable
                  as String,
        discharge: freezed == discharge
            ? _value.discharge
            : discharge // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PatientStatusDto,
        treatments: null == treatments
            ? _value._treatments
            : treatments // ignore: cast_nullable_to_non_nullable
                  as List<TreatmentItemDto>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientDetailDtoImpl implements _PatientDetailDto {
  const _$PatientDetailDtoImpl({
    required this.id,
    required this.fullName,
    required this.dateOfBirth,
    required this.isMale,
    required this.medicalRecordCode,
    required this.healthInsuranceCardNumber,
    required this.address,
    required this.city,
    required this.country,
    required this.admission,
    this.discharge,
    required this.status,
    final List<TreatmentItemDto> treatments = const [],
  }) : _treatments = treatments;

  factory _$PatientDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientDetailDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final String dateOfBirth;
  @override
  final bool isMale;
  @override
  final String medicalRecordCode;
  @override
  final String healthInsuranceCardNumber;
  @override
  final String address;
  @override
  final String city;
  @override
  final String country;
  @override
  final String admission;
  @override
  final String? discharge;
  @override
  final PatientStatusDto status;
  final List<TreatmentItemDto> _treatments;
  @override
  @JsonKey()
  List<TreatmentItemDto> get treatments {
    if (_treatments is EqualUnmodifiableListView) return _treatments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_treatments);
  }

  @override
  String toString() {
    return 'PatientDetailDto(id: $id, fullName: $fullName, dateOfBirth: $dateOfBirth, isMale: $isMale, medicalRecordCode: $medicalRecordCode, healthInsuranceCardNumber: $healthInsuranceCardNumber, address: $address, city: $city, country: $country, admission: $admission, discharge: $discharge, status: $status, treatments: $treatments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientDetailDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.isMale, isMale) || other.isMale == isMale) &&
            (identical(other.medicalRecordCode, medicalRecordCode) ||
                other.medicalRecordCode == medicalRecordCode) &&
            (identical(
                  other.healthInsuranceCardNumber,
                  healthInsuranceCardNumber,
                ) ||
                other.healthInsuranceCardNumber == healthInsuranceCardNumber) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.admission, admission) ||
                other.admission == admission) &&
            (identical(other.discharge, discharge) ||
                other.discharge == discharge) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._treatments,
              _treatments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    dateOfBirth,
    isMale,
    medicalRecordCode,
    healthInsuranceCardNumber,
    address,
    city,
    country,
    admission,
    discharge,
    status,
    const DeepCollectionEquality().hash(_treatments),
  );

  /// Create a copy of PatientDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientDetailDtoImplCopyWith<_$PatientDetailDtoImpl> get copyWith =>
      __$$PatientDetailDtoImplCopyWithImpl<_$PatientDetailDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientDetailDtoImplToJson(this);
  }
}

abstract class _PatientDetailDto implements PatientDetailDto {
  const factory _PatientDetailDto({
    required final String id,
    required final String fullName,
    required final String dateOfBirth,
    required final bool isMale,
    required final String medicalRecordCode,
    required final String healthInsuranceCardNumber,
    required final String address,
    required final String city,
    required final String country,
    required final String admission,
    final String? discharge,
    required final PatientStatusDto status,
    final List<TreatmentItemDto> treatments,
  }) = _$PatientDetailDtoImpl;

  factory _PatientDetailDto.fromJson(Map<String, dynamic> json) =
      _$PatientDetailDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  String get dateOfBirth;
  @override
  bool get isMale;
  @override
  String get medicalRecordCode;
  @override
  String get healthInsuranceCardNumber;
  @override
  String get address;
  @override
  String get city;
  @override
  String get country;
  @override
  String get admission;
  @override
  String? get discharge;
  @override
  PatientStatusDto get status;
  @override
  List<TreatmentItemDto> get treatments;

  /// Create a copy of PatientDetailDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientDetailDtoImplCopyWith<_$PatientDetailDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TreatmentItemDto _$TreatmentItemDtoFromJson(Map<String, dynamic> json) {
  return _TreatmentItemDto.fromJson(json);
}

/// @nodoc
mixin _$TreatmentItemDto {
  String get id => throw _privateConstructorUsedError;
  String get start => throw _privateConstructorUsedError;
  String get treatmentType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this TreatmentItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreatmentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentItemDtoCopyWith<TreatmentItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentItemDtoCopyWith<$Res> {
  factory $TreatmentItemDtoCopyWith(
    TreatmentItemDto value,
    $Res Function(TreatmentItemDto) then,
  ) = _$TreatmentItemDtoCopyWithImpl<$Res, TreatmentItemDto>;
  @useResult
  $Res call({String id, String start, String treatmentType, String status});
}

/// @nodoc
class _$TreatmentItemDtoCopyWithImpl<$Res, $Val extends TreatmentItemDto>
    implements $TreatmentItemDtoCopyWith<$Res> {
  _$TreatmentItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreatmentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? treatmentType = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            start: null == start
                ? _value.start
                : start // ignore: cast_nullable_to_non_nullable
                      as String,
            treatmentType: null == treatmentType
                ? _value.treatmentType
                : treatmentType // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TreatmentItemDtoImplCopyWith<$Res>
    implements $TreatmentItemDtoCopyWith<$Res> {
  factory _$$TreatmentItemDtoImplCopyWith(
    _$TreatmentItemDtoImpl value,
    $Res Function(_$TreatmentItemDtoImpl) then,
  ) = __$$TreatmentItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String start, String treatmentType, String status});
}

/// @nodoc
class __$$TreatmentItemDtoImplCopyWithImpl<$Res>
    extends _$TreatmentItemDtoCopyWithImpl<$Res, _$TreatmentItemDtoImpl>
    implements _$$TreatmentItemDtoImplCopyWith<$Res> {
  __$$TreatmentItemDtoImplCopyWithImpl(
    _$TreatmentItemDtoImpl _value,
    $Res Function(_$TreatmentItemDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TreatmentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? treatmentType = null,
    Object? status = null,
  }) {
    return _then(
      _$TreatmentItemDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        start: null == start
            ? _value.start
            : start // ignore: cast_nullable_to_non_nullable
                  as String,
        treatmentType: null == treatmentType
            ? _value.treatmentType
            : treatmentType // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TreatmentItemDtoImpl implements _TreatmentItemDto {
  const _$TreatmentItemDtoImpl({
    required this.id,
    required this.start,
    required this.treatmentType,
    required this.status,
  });

  factory _$TreatmentItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreatmentItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String start;
  @override
  final String treatmentType;
  @override
  final String status;

  @override
  String toString() {
    return 'TreatmentItemDto(id: $id, start: $start, treatmentType: $treatmentType, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.treatmentType, treatmentType) ||
                other.treatmentType == treatmentType) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, start, treatmentType, status);

  /// Create a copy of TreatmentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentItemDtoImplCopyWith<_$TreatmentItemDtoImpl> get copyWith =>
      __$$TreatmentItemDtoImplCopyWithImpl<_$TreatmentItemDtoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TreatmentItemDtoImplToJson(this);
  }
}

abstract class _TreatmentItemDto implements TreatmentItemDto {
  const factory _TreatmentItemDto({
    required final String id,
    required final String start,
    required final String treatmentType,
    required final String status,
  }) = _$TreatmentItemDtoImpl;

  factory _TreatmentItemDto.fromJson(Map<String, dynamic> json) =
      _$TreatmentItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get start;
  @override
  String get treatmentType;
  @override
  String get status;

  /// Create a copy of TreatmentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentItemDtoImplCopyWith<_$TreatmentItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
