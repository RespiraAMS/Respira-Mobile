// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'microbiology_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TreatmentOption _$TreatmentOptionFromJson(Map<String, dynamic> json) {
  return _TreatmentOption.fromJson(json);
}

/// @nodoc
mixin _$TreatmentOption {
  String get id => throw _privateConstructorUsedError;
  String get drug => throw _privateConstructorUsedError;

  /// e.g. "Tiêm tĩnh mạch".
  String get route => throw _privateConstructorUsedError;

  /// Short route for summary chips ("TM", "Uống").
  String get routeAbbrev => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  Susceptibility get susceptibility => throw _privateConstructorUsedError;

  /// Serializes this TreatmentOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreatmentOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreatmentOptionCopyWith<TreatmentOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreatmentOptionCopyWith<$Res> {
  factory $TreatmentOptionCopyWith(
    TreatmentOption value,
    $Res Function(TreatmentOption) then,
  ) = _$TreatmentOptionCopyWithImpl<$Res, TreatmentOption>;
  @useResult
  $Res call({
    String id,
    String drug,
    String route,
    String routeAbbrev,
    String dosage,
    Susceptibility susceptibility,
  });
}

/// @nodoc
class _$TreatmentOptionCopyWithImpl<$Res, $Val extends TreatmentOption>
    implements $TreatmentOptionCopyWith<$Res> {
  _$TreatmentOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreatmentOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drug = null,
    Object? route = null,
    Object? routeAbbrev = null,
    Object? dosage = null,
    Object? susceptibility = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            drug: null == drug
                ? _value.drug
                : drug // ignore: cast_nullable_to_non_nullable
                      as String,
            route: null == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as String,
            routeAbbrev: null == routeAbbrev
                ? _value.routeAbbrev
                : routeAbbrev // ignore: cast_nullable_to_non_nullable
                      as String,
            dosage: null == dosage
                ? _value.dosage
                : dosage // ignore: cast_nullable_to_non_nullable
                      as String,
            susceptibility: null == susceptibility
                ? _value.susceptibility
                : susceptibility // ignore: cast_nullable_to_non_nullable
                      as Susceptibility,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TreatmentOptionImplCopyWith<$Res>
    implements $TreatmentOptionCopyWith<$Res> {
  factory _$$TreatmentOptionImplCopyWith(
    _$TreatmentOptionImpl value,
    $Res Function(_$TreatmentOptionImpl) then,
  ) = __$$TreatmentOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String drug,
    String route,
    String routeAbbrev,
    String dosage,
    Susceptibility susceptibility,
  });
}

/// @nodoc
class __$$TreatmentOptionImplCopyWithImpl<$Res>
    extends _$TreatmentOptionCopyWithImpl<$Res, _$TreatmentOptionImpl>
    implements _$$TreatmentOptionImplCopyWith<$Res> {
  __$$TreatmentOptionImplCopyWithImpl(
    _$TreatmentOptionImpl _value,
    $Res Function(_$TreatmentOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TreatmentOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? drug = null,
    Object? route = null,
    Object? routeAbbrev = null,
    Object? dosage = null,
    Object? susceptibility = null,
  }) {
    return _then(
      _$TreatmentOptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        drug: null == drug
            ? _value.drug
            : drug // ignore: cast_nullable_to_non_nullable
                  as String,
        route: null == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                  as String,
        routeAbbrev: null == routeAbbrev
            ? _value.routeAbbrev
            : routeAbbrev // ignore: cast_nullable_to_non_nullable
                  as String,
        dosage: null == dosage
            ? _value.dosage
            : dosage // ignore: cast_nullable_to_non_nullable
                  as String,
        susceptibility: null == susceptibility
            ? _value.susceptibility
            : susceptibility // ignore: cast_nullable_to_non_nullable
                  as Susceptibility,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TreatmentOptionImpl implements _TreatmentOption {
  const _$TreatmentOptionImpl({
    required this.id,
    required this.drug,
    required this.route,
    required this.routeAbbrev,
    required this.dosage,
    required this.susceptibility,
  });

  factory _$TreatmentOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreatmentOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String drug;

  /// e.g. "Tiêm tĩnh mạch".
  @override
  final String route;

  /// Short route for summary chips ("TM", "Uống").
  @override
  final String routeAbbrev;
  @override
  final String dosage;
  @override
  final Susceptibility susceptibility;

  @override
  String toString() {
    return 'TreatmentOption(id: $id, drug: $drug, route: $route, routeAbbrev: $routeAbbrev, dosage: $dosage, susceptibility: $susceptibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreatmentOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.drug, drug) || other.drug == drug) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.routeAbbrev, routeAbbrev) ||
                other.routeAbbrev == routeAbbrev) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.susceptibility, susceptibility) ||
                other.susceptibility == susceptibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    drug,
    route,
    routeAbbrev,
    dosage,
    susceptibility,
  );

  /// Create a copy of TreatmentOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreatmentOptionImplCopyWith<_$TreatmentOptionImpl> get copyWith =>
      __$$TreatmentOptionImplCopyWithImpl<_$TreatmentOptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TreatmentOptionImplToJson(this);
  }
}

abstract class _TreatmentOption implements TreatmentOption {
  const factory _TreatmentOption({
    required final String id,
    required final String drug,
    required final String route,
    required final String routeAbbrev,
    required final String dosage,
    required final Susceptibility susceptibility,
  }) = _$TreatmentOptionImpl;

  factory _TreatmentOption.fromJson(Map<String, dynamic> json) =
      _$TreatmentOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get drug;

  /// e.g. "Tiêm tĩnh mạch".
  @override
  String get route;

  /// Short route for summary chips ("TM", "Uống").
  @override
  String get routeAbbrev;
  @override
  String get dosage;
  @override
  Susceptibility get susceptibility;

  /// Create a copy of TreatmentOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreatmentOptionImplCopyWith<_$TreatmentOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MicrobiologyResult _$MicrobiologyResultFromJson(Map<String, dynamic> json) {
  return _MicrobiologyResult.fromJson(json);
}

/// @nodoc
mixin _$MicrobiologyResult {
  /// e.g. "Klebsiella pneumoniae".
  String get bacteria => throw _privateConstructorUsedError;

  /// e.g. "MIC level: Nhạy cảm có chọn lọc".
  String get antibiogramLine => throw _privateConstructorUsedError;
  List<TreatmentOption> get options => throw _privateConstructorUsedError;

  /// Serializes this MicrobiologyResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MicrobiologyResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MicrobiologyResultCopyWith<MicrobiologyResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MicrobiologyResultCopyWith<$Res> {
  factory $MicrobiologyResultCopyWith(
    MicrobiologyResult value,
    $Res Function(MicrobiologyResult) then,
  ) = _$MicrobiologyResultCopyWithImpl<$Res, MicrobiologyResult>;
  @useResult
  $Res call({
    String bacteria,
    String antibiogramLine,
    List<TreatmentOption> options,
  });
}

/// @nodoc
class _$MicrobiologyResultCopyWithImpl<$Res, $Val extends MicrobiologyResult>
    implements $MicrobiologyResultCopyWith<$Res> {
  _$MicrobiologyResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MicrobiologyResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bacteria = null,
    Object? antibiogramLine = null,
    Object? options = null,
  }) {
    return _then(
      _value.copyWith(
            bacteria: null == bacteria
                ? _value.bacteria
                : bacteria // ignore: cast_nullable_to_non_nullable
                      as String,
            antibiogramLine: null == antibiogramLine
                ? _value.antibiogramLine
                : antibiogramLine // ignore: cast_nullable_to_non_nullable
                      as String,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<TreatmentOption>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MicrobiologyResultImplCopyWith<$Res>
    implements $MicrobiologyResultCopyWith<$Res> {
  factory _$$MicrobiologyResultImplCopyWith(
    _$MicrobiologyResultImpl value,
    $Res Function(_$MicrobiologyResultImpl) then,
  ) = __$$MicrobiologyResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String bacteria,
    String antibiogramLine,
    List<TreatmentOption> options,
  });
}

/// @nodoc
class __$$MicrobiologyResultImplCopyWithImpl<$Res>
    extends _$MicrobiologyResultCopyWithImpl<$Res, _$MicrobiologyResultImpl>
    implements _$$MicrobiologyResultImplCopyWith<$Res> {
  __$$MicrobiologyResultImplCopyWithImpl(
    _$MicrobiologyResultImpl _value,
    $Res Function(_$MicrobiologyResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MicrobiologyResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bacteria = null,
    Object? antibiogramLine = null,
    Object? options = null,
  }) {
    return _then(
      _$MicrobiologyResultImpl(
        bacteria: null == bacteria
            ? _value.bacteria
            : bacteria // ignore: cast_nullable_to_non_nullable
                  as String,
        antibiogramLine: null == antibiogramLine
            ? _value.antibiogramLine
            : antibiogramLine // ignore: cast_nullable_to_non_nullable
                  as String,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<TreatmentOption>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MicrobiologyResultImpl implements _MicrobiologyResult {
  const _$MicrobiologyResultImpl({
    required this.bacteria,
    required this.antibiogramLine,
    final List<TreatmentOption> options = const [],
  }) : _options = options;

  factory _$MicrobiologyResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MicrobiologyResultImplFromJson(json);

  /// e.g. "Klebsiella pneumoniae".
  @override
  final String bacteria;

  /// e.g. "MIC level: Nhạy cảm có chọn lọc".
  @override
  final String antibiogramLine;
  final List<TreatmentOption> _options;
  @override
  @JsonKey()
  List<TreatmentOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'MicrobiologyResult(bacteria: $bacteria, antibiogramLine: $antibiogramLine, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MicrobiologyResultImpl &&
            (identical(other.bacteria, bacteria) ||
                other.bacteria == bacteria) &&
            (identical(other.antibiogramLine, antibiogramLine) ||
                other.antibiogramLine == antibiogramLine) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    bacteria,
    antibiogramLine,
    const DeepCollectionEquality().hash(_options),
  );

  /// Create a copy of MicrobiologyResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MicrobiologyResultImplCopyWith<_$MicrobiologyResultImpl> get copyWith =>
      __$$MicrobiologyResultImplCopyWithImpl<_$MicrobiologyResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MicrobiologyResultImplToJson(this);
  }
}

abstract class _MicrobiologyResult implements MicrobiologyResult {
  const factory _MicrobiologyResult({
    required final String bacteria,
    required final String antibiogramLine,
    final List<TreatmentOption> options,
  }) = _$MicrobiologyResultImpl;

  factory _MicrobiologyResult.fromJson(Map<String, dynamic> json) =
      _$MicrobiologyResultImpl.fromJson;

  /// e.g. "Klebsiella pneumoniae".
  @override
  String get bacteria;

  /// e.g. "MIC level: Nhạy cảm có chọn lọc".
  @override
  String get antibiogramLine;
  @override
  List<TreatmentOption> get options;

  /// Create a copy of MicrobiologyResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MicrobiologyResultImplCopyWith<_$MicrobiologyResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
