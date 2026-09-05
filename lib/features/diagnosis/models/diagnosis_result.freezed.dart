// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosis_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiagnosisMedicine _$DiagnosisMedicineFromJson(Map<String, dynamic> json) {
  return _DiagnosisMedicine.fromJson(json);
}

/// @nodoc
mixin _$DiagnosisMedicine {
  String get name => throw _privateConstructorUsedError;

  /// e.g. "Phác đồ A · Kháng sinh".
  String get regimenLine => throw _privateConstructorUsedError;

  /// Serializes this DiagnosisMedicine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosisMedicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosisMedicineCopyWith<DiagnosisMedicine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisMedicineCopyWith<$Res> {
  factory $DiagnosisMedicineCopyWith(
    DiagnosisMedicine value,
    $Res Function(DiagnosisMedicine) then,
  ) = _$DiagnosisMedicineCopyWithImpl<$Res, DiagnosisMedicine>;
  @useResult
  $Res call({String name, String regimenLine});
}

/// @nodoc
class _$DiagnosisMedicineCopyWithImpl<$Res, $Val extends DiagnosisMedicine>
    implements $DiagnosisMedicineCopyWith<$Res> {
  _$DiagnosisMedicineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosisMedicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? regimenLine = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            regimenLine: null == regimenLine
                ? _value.regimenLine
                : regimenLine // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiagnosisMedicineImplCopyWith<$Res>
    implements $DiagnosisMedicineCopyWith<$Res> {
  factory _$$DiagnosisMedicineImplCopyWith(
    _$DiagnosisMedicineImpl value,
    $Res Function(_$DiagnosisMedicineImpl) then,
  ) = __$$DiagnosisMedicineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String regimenLine});
}

/// @nodoc
class __$$DiagnosisMedicineImplCopyWithImpl<$Res>
    extends _$DiagnosisMedicineCopyWithImpl<$Res, _$DiagnosisMedicineImpl>
    implements _$$DiagnosisMedicineImplCopyWith<$Res> {
  __$$DiagnosisMedicineImplCopyWithImpl(
    _$DiagnosisMedicineImpl _value,
    $Res Function(_$DiagnosisMedicineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiagnosisMedicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? regimenLine = null}) {
    return _then(
      _$DiagnosisMedicineImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        regimenLine: null == regimenLine
            ? _value.regimenLine
            : regimenLine // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosisMedicineImpl implements _DiagnosisMedicine {
  const _$DiagnosisMedicineImpl({
    required this.name,
    required this.regimenLine,
  });

  factory _$DiagnosisMedicineImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosisMedicineImplFromJson(json);

  @override
  final String name;

  /// e.g. "Phác đồ A · Kháng sinh".
  @override
  final String regimenLine;

  @override
  String toString() {
    return 'DiagnosisMedicine(name: $name, regimenLine: $regimenLine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosisMedicineImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.regimenLine, regimenLine) ||
                other.regimenLine == regimenLine));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, regimenLine);

  /// Create a copy of DiagnosisMedicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosisMedicineImplCopyWith<_$DiagnosisMedicineImpl> get copyWith =>
      __$$DiagnosisMedicineImplCopyWithImpl<_$DiagnosisMedicineImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosisMedicineImplToJson(this);
  }
}

abstract class _DiagnosisMedicine implements DiagnosisMedicine {
  const factory _DiagnosisMedicine({
    required final String name,
    required final String regimenLine,
  }) = _$DiagnosisMedicineImpl;

  factory _DiagnosisMedicine.fromJson(Map<String, dynamic> json) =
      _$DiagnosisMedicineImpl.fromJson;

  @override
  String get name;

  /// e.g. "Phác đồ A · Kháng sinh".
  @override
  String get regimenLine;

  /// Create a copy of DiagnosisMedicine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosisMedicineImplCopyWith<_$DiagnosisMedicineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiagnosisReference _$DiagnosisReferenceFromJson(Map<String, dynamic> json) {
  return _DiagnosisReference.fromJson(json);
}

/// @nodoc
mixin _$DiagnosisReference {
  /// e.g. "Bộ Y tế · v3 · 2024".
  String get source => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;

  /// Serializes this DiagnosisReference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosisReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosisReferenceCopyWith<DiagnosisReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisReferenceCopyWith<$Res> {
  factory $DiagnosisReferenceCopyWith(
    DiagnosisReference value,
    $Res Function(DiagnosisReference) then,
  ) = _$DiagnosisReferenceCopyWithImpl<$Res, DiagnosisReference>;
  @useResult
  $Res call({String source, String detail});
}

/// @nodoc
class _$DiagnosisReferenceCopyWithImpl<$Res, $Val extends DiagnosisReference>
    implements $DiagnosisReferenceCopyWith<$Res> {
  _$DiagnosisReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosisReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? source = null, Object? detail = null}) {
    return _then(
      _value.copyWith(
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
            detail: null == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiagnosisReferenceImplCopyWith<$Res>
    implements $DiagnosisReferenceCopyWith<$Res> {
  factory _$$DiagnosisReferenceImplCopyWith(
    _$DiagnosisReferenceImpl value,
    $Res Function(_$DiagnosisReferenceImpl) then,
  ) = __$$DiagnosisReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, String detail});
}

/// @nodoc
class __$$DiagnosisReferenceImplCopyWithImpl<$Res>
    extends _$DiagnosisReferenceCopyWithImpl<$Res, _$DiagnosisReferenceImpl>
    implements _$$DiagnosisReferenceImplCopyWith<$Res> {
  __$$DiagnosisReferenceImplCopyWithImpl(
    _$DiagnosisReferenceImpl _value,
    $Res Function(_$DiagnosisReferenceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiagnosisReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? source = null, Object? detail = null}) {
    return _then(
      _$DiagnosisReferenceImpl(
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        detail: null == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosisReferenceImpl implements _DiagnosisReference {
  const _$DiagnosisReferenceImpl({required this.source, required this.detail});

  factory _$DiagnosisReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosisReferenceImplFromJson(json);

  /// e.g. "Bộ Y tế · v3 · 2024".
  @override
  final String source;
  @override
  final String detail;

  @override
  String toString() {
    return 'DiagnosisReference(source: $source, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosisReferenceImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, detail);

  /// Create a copy of DiagnosisReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosisReferenceImplCopyWith<_$DiagnosisReferenceImpl> get copyWith =>
      __$$DiagnosisReferenceImplCopyWithImpl<_$DiagnosisReferenceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosisReferenceImplToJson(this);
  }
}

abstract class _DiagnosisReference implements DiagnosisReference {
  const factory _DiagnosisReference({
    required final String source,
    required final String detail,
  }) = _$DiagnosisReferenceImpl;

  factory _DiagnosisReference.fromJson(Map<String, dynamic> json) =
      _$DiagnosisReferenceImpl.fromJson;

  /// e.g. "Bộ Y tế · v3 · 2024".
  @override
  String get source;
  @override
  String get detail;

  /// Create a copy of DiagnosisReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosisReferenceImplCopyWith<_$DiagnosisReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiagnosisResult _$DiagnosisResultFromJson(Map<String, dynamic> json) {
  return _DiagnosisResult.fromJson(json);
}

/// @nodoc
mixin _$DiagnosisResult {
  /// e.g. "Viêm phổi cộng đồng".
  String get diagnosisName => throw _privateConstructorUsedError;

  /// Selected approach, e.g. "Kinh nghiệm" — shown in the app bar subtitle.
  String get modeLabel => throw _privateConstructorUsedError;
  int get curbScore => throw _privateConstructorUsedError;
  String get severityLabel => throw _privateConstructorUsedError;
  bool get severityIsHigh => throw _privateConstructorUsedError;
  String get careSettingLabel => throw _privateConstructorUsedError;
  String get riskLabel => throw _privateConstructorUsedError;
  List<DiagnosisMedicine> get medicines => throw _privateConstructorUsedError;
  List<DiagnosisReference> get references => throw _privateConstructorUsedError;

  /// Serializes this DiagnosisResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosisResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosisResultCopyWith<DiagnosisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisResultCopyWith<$Res> {
  factory $DiagnosisResultCopyWith(
    DiagnosisResult value,
    $Res Function(DiagnosisResult) then,
  ) = _$DiagnosisResultCopyWithImpl<$Res, DiagnosisResult>;
  @useResult
  $Res call({
    String diagnosisName,
    String modeLabel,
    int curbScore,
    String severityLabel,
    bool severityIsHigh,
    String careSettingLabel,
    String riskLabel,
    List<DiagnosisMedicine> medicines,
    List<DiagnosisReference> references,
  });
}

/// @nodoc
class _$DiagnosisResultCopyWithImpl<$Res, $Val extends DiagnosisResult>
    implements $DiagnosisResultCopyWith<$Res> {
  _$DiagnosisResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosisResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnosisName = null,
    Object? modeLabel = null,
    Object? curbScore = null,
    Object? severityLabel = null,
    Object? severityIsHigh = null,
    Object? careSettingLabel = null,
    Object? riskLabel = null,
    Object? medicines = null,
    Object? references = null,
  }) {
    return _then(
      _value.copyWith(
            diagnosisName: null == diagnosisName
                ? _value.diagnosisName
                : diagnosisName // ignore: cast_nullable_to_non_nullable
                      as String,
            modeLabel: null == modeLabel
                ? _value.modeLabel
                : modeLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            curbScore: null == curbScore
                ? _value.curbScore
                : curbScore // ignore: cast_nullable_to_non_nullable
                      as int,
            severityLabel: null == severityLabel
                ? _value.severityLabel
                : severityLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            severityIsHigh: null == severityIsHigh
                ? _value.severityIsHigh
                : severityIsHigh // ignore: cast_nullable_to_non_nullable
                      as bool,
            careSettingLabel: null == careSettingLabel
                ? _value.careSettingLabel
                : careSettingLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            riskLabel: null == riskLabel
                ? _value.riskLabel
                : riskLabel // ignore: cast_nullable_to_non_nullable
                      as String,
            medicines: null == medicines
                ? _value.medicines
                : medicines // ignore: cast_nullable_to_non_nullable
                      as List<DiagnosisMedicine>,
            references: null == references
                ? _value.references
                : references // ignore: cast_nullable_to_non_nullable
                      as List<DiagnosisReference>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiagnosisResultImplCopyWith<$Res>
    implements $DiagnosisResultCopyWith<$Res> {
  factory _$$DiagnosisResultImplCopyWith(
    _$DiagnosisResultImpl value,
    $Res Function(_$DiagnosisResultImpl) then,
  ) = __$$DiagnosisResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String diagnosisName,
    String modeLabel,
    int curbScore,
    String severityLabel,
    bool severityIsHigh,
    String careSettingLabel,
    String riskLabel,
    List<DiagnosisMedicine> medicines,
    List<DiagnosisReference> references,
  });
}

/// @nodoc
class __$$DiagnosisResultImplCopyWithImpl<$Res>
    extends _$DiagnosisResultCopyWithImpl<$Res, _$DiagnosisResultImpl>
    implements _$$DiagnosisResultImplCopyWith<$Res> {
  __$$DiagnosisResultImplCopyWithImpl(
    _$DiagnosisResultImpl _value,
    $Res Function(_$DiagnosisResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiagnosisResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagnosisName = null,
    Object? modeLabel = null,
    Object? curbScore = null,
    Object? severityLabel = null,
    Object? severityIsHigh = null,
    Object? careSettingLabel = null,
    Object? riskLabel = null,
    Object? medicines = null,
    Object? references = null,
  }) {
    return _then(
      _$DiagnosisResultImpl(
        diagnosisName: null == diagnosisName
            ? _value.diagnosisName
            : diagnosisName // ignore: cast_nullable_to_non_nullable
                  as String,
        modeLabel: null == modeLabel
            ? _value.modeLabel
            : modeLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        curbScore: null == curbScore
            ? _value.curbScore
            : curbScore // ignore: cast_nullable_to_non_nullable
                  as int,
        severityLabel: null == severityLabel
            ? _value.severityLabel
            : severityLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        severityIsHigh: null == severityIsHigh
            ? _value.severityIsHigh
            : severityIsHigh // ignore: cast_nullable_to_non_nullable
                  as bool,
        careSettingLabel: null == careSettingLabel
            ? _value.careSettingLabel
            : careSettingLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        riskLabel: null == riskLabel
            ? _value.riskLabel
            : riskLabel // ignore: cast_nullable_to_non_nullable
                  as String,
        medicines: null == medicines
            ? _value._medicines
            : medicines // ignore: cast_nullable_to_non_nullable
                  as List<DiagnosisMedicine>,
        references: null == references
            ? _value._references
            : references // ignore: cast_nullable_to_non_nullable
                  as List<DiagnosisReference>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosisResultImpl implements _DiagnosisResult {
  const _$DiagnosisResultImpl({
    required this.diagnosisName,
    required this.modeLabel,
    required this.curbScore,
    required this.severityLabel,
    required this.severityIsHigh,
    required this.careSettingLabel,
    required this.riskLabel,
    final List<DiagnosisMedicine> medicines = const [],
    final List<DiagnosisReference> references = const [],
  }) : _medicines = medicines,
       _references = references;

  factory _$DiagnosisResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosisResultImplFromJson(json);

  /// e.g. "Viêm phổi cộng đồng".
  @override
  final String diagnosisName;

  /// Selected approach, e.g. "Kinh nghiệm" — shown in the app bar subtitle.
  @override
  final String modeLabel;
  @override
  final int curbScore;
  @override
  final String severityLabel;
  @override
  final bool severityIsHigh;
  @override
  final String careSettingLabel;
  @override
  final String riskLabel;
  final List<DiagnosisMedicine> _medicines;
  @override
  @JsonKey()
  List<DiagnosisMedicine> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  final List<DiagnosisReference> _references;
  @override
  @JsonKey()
  List<DiagnosisReference> get references {
    if (_references is EqualUnmodifiableListView) return _references;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_references);
  }

  @override
  String toString() {
    return 'DiagnosisResult(diagnosisName: $diagnosisName, modeLabel: $modeLabel, curbScore: $curbScore, severityLabel: $severityLabel, severityIsHigh: $severityIsHigh, careSettingLabel: $careSettingLabel, riskLabel: $riskLabel, medicines: $medicines, references: $references)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosisResultImpl &&
            (identical(other.diagnosisName, diagnosisName) ||
                other.diagnosisName == diagnosisName) &&
            (identical(other.modeLabel, modeLabel) ||
                other.modeLabel == modeLabel) &&
            (identical(other.curbScore, curbScore) ||
                other.curbScore == curbScore) &&
            (identical(other.severityLabel, severityLabel) ||
                other.severityLabel == severityLabel) &&
            (identical(other.severityIsHigh, severityIsHigh) ||
                other.severityIsHigh == severityIsHigh) &&
            (identical(other.careSettingLabel, careSettingLabel) ||
                other.careSettingLabel == careSettingLabel) &&
            (identical(other.riskLabel, riskLabel) ||
                other.riskLabel == riskLabel) &&
            const DeepCollectionEquality().equals(
              other._medicines,
              _medicines,
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
    diagnosisName,
    modeLabel,
    curbScore,
    severityLabel,
    severityIsHigh,
    careSettingLabel,
    riskLabel,
    const DeepCollectionEquality().hash(_medicines),
    const DeepCollectionEquality().hash(_references),
  );

  /// Create a copy of DiagnosisResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosisResultImplCopyWith<_$DiagnosisResultImpl> get copyWith =>
      __$$DiagnosisResultImplCopyWithImpl<_$DiagnosisResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosisResultImplToJson(this);
  }
}

abstract class _DiagnosisResult implements DiagnosisResult {
  const factory _DiagnosisResult({
    required final String diagnosisName,
    required final String modeLabel,
    required final int curbScore,
    required final String severityLabel,
    required final bool severityIsHigh,
    required final String careSettingLabel,
    required final String riskLabel,
    final List<DiagnosisMedicine> medicines,
    final List<DiagnosisReference> references,
  }) = _$DiagnosisResultImpl;

  factory _DiagnosisResult.fromJson(Map<String, dynamic> json) =
      _$DiagnosisResultImpl.fromJson;

  /// e.g. "Viêm phổi cộng đồng".
  @override
  String get diagnosisName;

  /// Selected approach, e.g. "Kinh nghiệm" — shown in the app bar subtitle.
  @override
  String get modeLabel;
  @override
  int get curbScore;
  @override
  String get severityLabel;
  @override
  bool get severityIsHigh;
  @override
  String get careSettingLabel;
  @override
  String get riskLabel;
  @override
  List<DiagnosisMedicine> get medicines;
  @override
  List<DiagnosisReference> get references;

  /// Create a copy of DiagnosisResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosisResultImplCopyWith<_$DiagnosisResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
