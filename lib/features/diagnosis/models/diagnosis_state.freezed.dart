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
  Set<Curb65Criterion> get selectedCurb65Criteria =>
      throw _privateConstructorUsedError;
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
    Set<Curb65Criterion> selectedCurb65Criteria,
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
    Object? selectedCurb65Criteria = null,
    Object? selectedIcuCriteria = null,
    Object? selectedResistanceRisks = null,
  }) {
    return _then(
      _value.copyWith(
            selectedCurb65Criteria: null == selectedCurb65Criteria
                ? _value.selectedCurb65Criteria
                : selectedCurb65Criteria // ignore: cast_nullable_to_non_nullable
                      as Set<Curb65Criterion>,
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
    Set<Curb65Criterion> selectedCurb65Criteria,
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
    Object? selectedCurb65Criteria = null,
    Object? selectedIcuCriteria = null,
    Object? selectedResistanceRisks = null,
  }) {
    return _then(
      _$DiagnosisCriteriaStateImpl(
        selectedCurb65Criteria: null == selectedCurb65Criteria
            ? _value._selectedCurb65Criteria
            : selectedCurb65Criteria // ignore: cast_nullable_to_non_nullable
                  as Set<Curb65Criterion>,
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
    final Set<Curb65Criterion> selectedCurb65Criteria = const <Curb65Criterion>{
      Curb65Criterion.confusion,
      Curb65Criterion.highUrea,
      Curb65Criterion.ageOver65,
    },
    final Set<IcuCriterion> selectedIcuCriteria = const <IcuCriterion>{
      IcuCriterion.pao2fio2Low,
    },
    final Set<ResistanceRiskFactor> selectedResistanceRisks =
        const <ResistanceRiskFactor>{ResistanceRiskFactor.recentAntibiotics},
  }) : _selectedCurb65Criteria = selectedCurb65Criteria,
       _selectedIcuCriteria = selectedIcuCriteria,
       _selectedResistanceRisks = selectedResistanceRisks;

  factory _$DiagnosisCriteriaStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiagnosisCriteriaStateImplFromJson(json);

  final Set<Curb65Criterion> _selectedCurb65Criteria;
  @override
  @JsonKey()
  Set<Curb65Criterion> get selectedCurb65Criteria {
    if (_selectedCurb65Criteria is EqualUnmodifiableSetView)
      return _selectedCurb65Criteria;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedCurb65Criteria);
  }

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
    return 'DiagnosisCriteriaState(selectedCurb65Criteria: $selectedCurb65Criteria, selectedIcuCriteria: $selectedIcuCriteria, selectedResistanceRisks: $selectedResistanceRisks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosisCriteriaStateImpl &&
            const DeepCollectionEquality().equals(
              other._selectedCurb65Criteria,
              _selectedCurb65Criteria,
            ) &&
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
    const DeepCollectionEquality().hash(_selectedCurb65Criteria),
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
    final Set<Curb65Criterion> selectedCurb65Criteria,
    final Set<IcuCriterion> selectedIcuCriteria,
    final Set<ResistanceRiskFactor> selectedResistanceRisks,
  }) = _$DiagnosisCriteriaStateImpl;

  factory _DiagnosisCriteriaState.fromJson(Map<String, dynamic> json) =
      _$DiagnosisCriteriaStateImpl.fromJson;

  @override
  Set<Curb65Criterion> get selectedCurb65Criteria;
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
