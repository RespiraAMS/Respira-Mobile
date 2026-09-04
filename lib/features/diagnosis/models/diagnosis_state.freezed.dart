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
  Set<String> get selectedIcuCriteriaIds =>
      throw _privateConstructorUsedError; // ── Step 4/5 · Resistance risks ────────────────────────────────
  Set<String> get selectedResistanceRiskIds =>
      throw _privateConstructorUsedError; // ── Step 5/5 · Other criteria ──────────────────────────────────
  Set<String> get selectedOtherCriteriaIds =>
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
    Set<String> selectedIcuCriteriaIds,
    Set<String> selectedResistanceRiskIds,
    Set<String> selectedOtherCriteriaIds,
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
    Object? selectedIcuCriteriaIds = null,
    Object? selectedResistanceRiskIds = null,
    Object? selectedOtherCriteriaIds = null,
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
            selectedIcuCriteriaIds: null == selectedIcuCriteriaIds
                ? _value.selectedIcuCriteriaIds
                : selectedIcuCriteriaIds // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
            selectedResistanceRiskIds: null == selectedResistanceRiskIds
                ? _value.selectedResistanceRiskIds
                : selectedResistanceRiskIds // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
            selectedOtherCriteriaIds: null == selectedOtherCriteriaIds
                ? _value.selectedOtherCriteriaIds
                : selectedOtherCriteriaIds // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
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
    Set<String> selectedIcuCriteriaIds,
    Set<String> selectedResistanceRiskIds,
    Set<String> selectedOtherCriteriaIds,
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
    Object? selectedIcuCriteriaIds = null,
    Object? selectedResistanceRiskIds = null,
    Object? selectedOtherCriteriaIds = null,
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
        selectedIcuCriteriaIds: null == selectedIcuCriteriaIds
            ? _value._selectedIcuCriteriaIds
            : selectedIcuCriteriaIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        selectedResistanceRiskIds: null == selectedResistanceRiskIds
            ? _value._selectedResistanceRiskIds
            : selectedResistanceRiskIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
        selectedOtherCriteriaIds: null == selectedOtherCriteriaIds
            ? _value._selectedOtherCriteriaIds
            : selectedOtherCriteriaIds // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
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
    final Set<String> selectedIcuCriteriaIds = const <String>{},
    final Set<String> selectedResistanceRiskIds = const <String>{},
    final Set<String> selectedOtherCriteriaIds = const <String>{},
  }) : _selectedIcuCriteriaIds = selectedIcuCriteriaIds,
       _selectedResistanceRiskIds = selectedResistanceRiskIds,
       _selectedOtherCriteriaIds = selectedOtherCriteriaIds;

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
  final Set<String> _selectedIcuCriteriaIds;
  @override
  @JsonKey()
  Set<String> get selectedIcuCriteriaIds {
    if (_selectedIcuCriteriaIds is EqualUnmodifiableSetView)
      return _selectedIcuCriteriaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedIcuCriteriaIds);
  }

  // ── Step 4/5 · Resistance risks ────────────────────────────────
  final Set<String> _selectedResistanceRiskIds;
  // ── Step 4/5 · Resistance risks ────────────────────────────────
  @override
  @JsonKey()
  Set<String> get selectedResistanceRiskIds {
    if (_selectedResistanceRiskIds is EqualUnmodifiableSetView)
      return _selectedResistanceRiskIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedResistanceRiskIds);
  }

  // ── Step 5/5 · Other criteria ──────────────────────────────────
  final Set<String> _selectedOtherCriteriaIds;
  // ── Step 5/5 · Other criteria ──────────────────────────────────
  @override
  @JsonKey()
  Set<String> get selectedOtherCriteriaIds {
    if (_selectedOtherCriteriaIds is EqualUnmodifiableSetView)
      return _selectedOtherCriteriaIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedOtherCriteriaIds);
  }

  @override
  String toString() {
    return 'DiagnosisCriteriaState(heightCm: $heightCm, weightKg: $weightKg, serumCreatinine: $serumCreatinine, confusion: $confusion, urea: $urea, respRate: $respRate, sbp: $sbp, dbp: $dbp, age: $age, pao2Fio2: $pao2Fio2, selectedIcuCriteriaIds: $selectedIcuCriteriaIds, selectedResistanceRiskIds: $selectedResistanceRiskIds, selectedOtherCriteriaIds: $selectedOtherCriteriaIds)';
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
              other._selectedIcuCriteriaIds,
              _selectedIcuCriteriaIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedResistanceRiskIds,
              _selectedResistanceRiskIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._selectedOtherCriteriaIds,
              _selectedOtherCriteriaIds,
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
    const DeepCollectionEquality().hash(_selectedIcuCriteriaIds),
    const DeepCollectionEquality().hash(_selectedResistanceRiskIds),
    const DeepCollectionEquality().hash(_selectedOtherCriteriaIds),
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
    final Set<String> selectedIcuCriteriaIds,
    final Set<String> selectedResistanceRiskIds,
    final Set<String> selectedOtherCriteriaIds,
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
  Set<String> get selectedIcuCriteriaIds; // ── Step 4/5 · Resistance risks ────────────────────────────────
  @override
  Set<String> get selectedResistanceRiskIds; // ── Step 5/5 · Other criteria ──────────────────────────────────
  @override
  Set<String> get selectedOtherCriteriaIds;

  /// Create a copy of DiagnosisCriteriaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosisCriteriaStateImplCopyWith<_$DiagnosisCriteriaStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
