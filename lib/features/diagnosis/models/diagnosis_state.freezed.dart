// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosis_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiagnosisCriteriaState _$DiagnosisCriteriaStateFromJson(
  Map<String, dynamic> json,
) {
  return _DiagnosisCriteriaState.fromJson(json);
}

/// @nodoc
mixin _$DiagnosisCriteriaState {
  // ── Step 1/5 · Vitals ──────────────────────────────────────────
  String get heightCm => throw _privateConstructorUsedError;
  String get weightKg => throw _privateConstructorUsedError;
  String get serumCreatinine =>
      throw _privateConstructorUsedError; // ── Step 2/5 · CURB-65 ─────────────────────────────────────────
  bool get confusion => throw _privateConstructorUsedError;
  String get urea => throw _privateConstructorUsedError;
  String get respRate => throw _privateConstructorUsedError;
  String get sbp => throw _privateConstructorUsedError;
  String get dbp => throw _privateConstructorUsedError;
  String get age =>
      throw _privateConstructorUsedError; // ── Step 3/5 · ICU criteria ────────────────────────────────────
  String get pao2Fio2 => throw _privateConstructorUsedError;
  Set<IcuCriterion> get selectedIcuCriteria =>
      throw _privateConstructorUsedError;
  Set<ResistanceRiskFactor> get selectedResistanceRisks =>
      throw _privateConstructorUsedError;

  /// Serializes this DiagnosisCriteriaState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosisCriteriaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosisCriteriaStateCopyWith<DiagnosisCriteriaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisCriteriaStateCopyWith<$Res> {
  factory $DiagnosisCriteriaStateCopyWith(
    DiagnosisCriteriaState value,
    $Res Function(DiagnosisCriteriaState) then,
  ) = _$DiagnosisCriteriaStateCopyWithImpl<$Res, DiagnosisCriteriaState>;
  @useResult
  $Res call({
    String heightCm,
    String weightKg,
    String serumCreatinine,
    bool confusion,
    String urea,
    String respRate,
    String sbp,
    String dbp,
    String age,
    String pao2Fio2,
    Set<IcuCriterion> selectedIcuCriteria,
    Set<ResistanceRiskFactor> selectedResistanceRisks,
  });
}

/// @nodoc
class _$DiagnosisCriteriaStateCopyWithImpl<
  $Res,
  $Val extends DiagnosisCriteriaState
>
    implements $DiagnosisCriteriaStateCopyWith<$Res> {
  _$DiagnosisCriteriaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosisCriteriaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heightCm = null,
    Object? weightKg = null,
    Object? serumCreatinine = null,
    Object? confusion = null,
    Object? urea = null,
    Object? respRate = null,
    Object? sbp = null,
    Object? dbp = null,
    Object? age = null,
    Object? pao2Fio2 = null,
    Object? selectedIcuCriteria = null,
    Object? selectedResistanceRisks = null,
  }) {
    return _then(
      _value.copyWith(
            heightCm: null == heightCm
                ? _value.heightCm
                : heightCm // ignore: cast_nullable_to_non_nullable
                      as String,
            weightKg: null == weightKg
                ? _value.weightKg
                : weightKg // ignore: cast_nullable_to_non_nullable
                      as String,
            serumCreatinine: null == serumCreatinine
                ? _value.serumCreatinine
                : serumCreatinine // ignore: cast_nullable_to_non_nullable
                      as String,
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
            pao2Fio2: null == pao2Fio2
                ? _value.pao2Fio2
                : pao2Fio2 // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedIcuCriteria: null == selectedIcuCriteria
                ? _value.selectedIcuCriteria
                : selectedIcuCriteria // ignore: cast_nullable_to_non_nullable
                      as Set<IcuCriterion>,
            selectedResistanceRisks: null == selectedResistanceRisks
                ? _value.selectedResistanceRisks
                : selectedResistanceRisks // ignore: cast_nullable_to_non_nullable
                      as Set<ResistanceRiskFactor>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiagnosisCriteriaStateImplCopyWith<$Res>
    implements $DiagnosisCriteriaStateCopyWith<$Res> {
  factory _$$DiagnosisCriteriaStateImplCopyWith(
    _$DiagnosisCriteriaStateImpl value,
    $Res Function(_$DiagnosisCriteriaStateImpl) then,
  ) = __$$DiagnosisCriteriaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String heightCm,
    String weightKg,
    String serumCreatinine,
    bool confusion,
    String urea,
    String respRate,
    String sbp,
    String dbp,
    String age,
    String pao2Fio2,
    Set<IcuCriterion> selectedIcuCriteria,
    Set<ResistanceRiskFactor> selectedResistanceRisks,
  });
}

/// @nodoc
class __$$DiagnosisCriteriaStateImplCopyWithImpl<$Res>
    extends
        _$DiagnosisCriteriaStateCopyWithImpl<$Res, _$DiagnosisCriteriaStateImpl>
    implements _$$DiagnosisCriteriaStateImplCopyWith<$Res> {
  __$$DiagnosisCriteriaStateImplCopyWithImpl(
    _$DiagnosisCriteriaStateImpl _value,
    $Res Function(_$DiagnosisCriteriaStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiagnosisCriteriaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heightCm = null,
    Object? weightKg = null,
    Object? serumCreatinine = null,
    Object? confusion = null,
    Object? urea = null,
    Object? respRate = null,
    Object? sbp = null,
    Object? dbp = null,
    Object? age = null,
    Object? pao2Fio2 = null,
    Object? selectedIcuCriteria = null,
    Object? selectedResistanceRisks = null,
  }) {
    return _then(
      _$DiagnosisCriteriaStateImpl(
        heightCm: null == heightCm
            ? _value.heightCm
            : heightCm // ignore: cast_nullable_to_non_nullable
                  as String,
        weightKg: null == weightKg
            ? _value.weightKg
            : weightKg // ignore: cast_nullable_to_non_nullable
                  as String,
        serumCreatinine: null == serumCreatinine
            ? _value.serumCreatinine
            : serumCreatinine // ignore: cast_nullable_to_non_nullable
                  as String,
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
        pao2Fio2: null == pao2Fio2
            ? _value.pao2Fio2
            : pao2Fio2 // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedIcuCriteria: null == selectedIcuCriteria
            ? _value._selectedIcuCriteria
            : selectedIcuCriteria // ignore: cast_nullable_to_non_nullable
                  as Set<IcuCriterion>,
        selectedResistanceRisks: null == selectedResistanceRisks
            ? _value._selectedResistanceRisks
            : selectedResistanceRisks // ignore: cast_nullable_to_non_nullable
                  as Set<ResistanceRiskFactor>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiagnosisCriteriaStateImpl implements _DiagnosisCriteriaState {
  const _$DiagnosisCriteriaStateImpl({
    this.heightCm = '',
    this.weightKg = '',
    this.serumCreatinine = '',
    this.confusion = true,
    this.urea = '',
    this.respRate = '',
    this.sbp = '',
    this.dbp = '',
    this.age = '',
    this.pao2Fio2 = '',
    final Set<IcuCriterion> selectedIcuCriteria = const <IcuCriterion>{
      IcuCriterion.septicShock,
    },
    final Set<ResistanceRiskFactor> selectedResistanceRisks =
        const <ResistanceRiskFactor>{ResistanceRiskFactor.recentAntibiotics},
  }) : _selectedIcuCriteria = selectedIcuCriteria,
       _selectedResistanceRisks = selectedResistanceRisks;

  factory _$DiagnosisCriteriaStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosisCriteriaStateImplFromJson(json);

  // ── Step 1/5 · Vitals ──────────────────────────────────────────
  @override
  @JsonKey()
  final String heightCm;
  @override
  @JsonKey()
  final String weightKg;
  @override
  @JsonKey()
  final String serumCreatinine;
  // ── Step 2/5 · CURB-65 ─────────────────────────────────────────
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
  // ── Step 3/5 · ICU criteria ────────────────────────────────────
  @override
  @JsonKey()
  final String pao2Fio2;
  final Set<IcuCriterion> _selectedIcuCriteria;
  @override
  @JsonKey()
  Set<IcuCriterion> get selectedIcuCriteria {
    if (_selectedIcuCriteria is EqualUnmodifiableSetView)
      return _selectedIcuCriteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedIcuCriteria);
  }

  final Set<ResistanceRiskFactor> _selectedResistanceRisks;
  @override
  @JsonKey()
  Set<ResistanceRiskFactor> get selectedResistanceRisks {
    if (_selectedResistanceRisks is EqualUnmodifiableSetView)
      return _selectedResistanceRisks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedResistanceRisks);
  }

  @override
  String toString() {
    return 'DiagnosisCriteriaState(heightCm: $heightCm, weightKg: $weightKg, serumCreatinine: $serumCreatinine, confusion: $confusion, urea: $urea, respRate: $respRate, sbp: $sbp, dbp: $dbp, age: $age, pao2Fio2: $pao2Fio2, selectedIcuCriteria: $selectedIcuCriteria, selectedResistanceRisks: $selectedResistanceRisks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosisCriteriaStateImpl &&
            (identical(other.heightCm, heightCm) ||
                other.heightCm == heightCm) &&
            (identical(other.weightKg, weightKg) ||
                other.weightKg == weightKg) &&
            (identical(other.serumCreatinine, serumCreatinine) ||
                other.serumCreatinine == serumCreatinine) &&
            (identical(other.confusion, confusion) ||
                other.confusion == confusion) &&
            (identical(other.urea, urea) || other.urea == urea) &&
            (identical(other.respRate, respRate) ||
                other.respRate == respRate) &&
            (identical(other.sbp, sbp) || other.sbp == sbp) &&
            (identical(other.dbp, dbp) || other.dbp == dbp) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.pao2Fio2, pao2Fio2) ||
                other.pao2Fio2 == pao2Fio2) &&
            const DeepCollectionEquality().equals(
              other._selectedIcuCriteria,
              _selectedIcuCriteria,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedResistanceRisks,
              _selectedResistanceRisks,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    heightCm,
    weightKg,
    serumCreatinine,
    confusion,
    urea,
    respRate,
    sbp,
    dbp,
    age,
    pao2Fio2,
    const DeepCollectionEquality().hash(_selectedIcuCriteria),
    const DeepCollectionEquality().hash(_selectedResistanceRisks),
  );

  /// Create a copy of DiagnosisCriteriaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosisCriteriaStateImplCopyWith<_$DiagnosisCriteriaStateImpl>
  get copyWith =>
      __$$DiagnosisCriteriaStateImplCopyWithImpl<_$DiagnosisCriteriaStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiagnosisCriteriaStateImplToJson(this);
  }
}

abstract class _DiagnosisCriteriaState implements DiagnosisCriteriaState {
  const factory _DiagnosisCriteriaState({
    final String heightCm,
    final String weightKg,
    final String serumCreatinine,
    final bool confusion,
    final String urea,
    final String respRate,
    final String sbp,
    final String dbp,
    final String age,
    final String pao2Fio2,
    final Set<IcuCriterion> selectedIcuCriteria,
    final Set<ResistanceRiskFactor> selectedResistanceRisks,
  }) = _$DiagnosisCriteriaStateImpl;

  factory _DiagnosisCriteriaState.fromJson(Map<String, dynamic> json) =
      _$DiagnosisCriteriaStateImpl.fromJson;

  // ── Step 1/5 · Vitals ──────────────────────────────────────────
  @override
  String get heightCm;
  @override
  String get weightKg;
  @override
  String get serumCreatinine; // ── Step 2/5 · CURB-65 ─────────────────────────────────────────
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
  String get age; // ── Step 3/5 · ICU criteria ────────────────────────────────────
  @override
  String get pao2Fio2;
  @override
  Set<IcuCriterion> get selectedIcuCriteria;
  @override
  Set<ResistanceRiskFactor> get selectedResistanceRisks;

  /// Create a copy of DiagnosisCriteriaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosisCriteriaStateImplCopyWith<_$DiagnosisCriteriaStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
