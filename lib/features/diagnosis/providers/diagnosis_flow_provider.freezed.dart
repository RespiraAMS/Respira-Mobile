// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosis_flow_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DiagnosisFlowState {
  /// Selected disease (currently the first from `/diseases/list`).
  DiseaseItemDto? get disease => throw _privateConstructorUsedError;

  /// Real criteria loaded from `GET /diseases/{id}/criteria`.
  DiseaseCriteriaDto get criteria => throw _privateConstructorUsedError;

  /// Result of `POST /diagnose/empirical` (rendered on the result tab).
  EmpiricalDiagnoseResultDto? get empiricalResult =>
      throw _privateConstructorUsedError;

  /// Set right after a successful treatment create.
  bool get saved => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of DiagnosisFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagnosisFlowStateCopyWith<DiagnosisFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagnosisFlowStateCopyWith<$Res> {
  factory $DiagnosisFlowStateCopyWith(
    DiagnosisFlowState value,
    $Res Function(DiagnosisFlowState) then,
  ) = _$DiagnosisFlowStateCopyWithImpl<$Res, DiagnosisFlowState>;
  @useResult
  $Res call({
    DiseaseItemDto? disease,
    DiseaseCriteriaDto criteria,
    EmpiricalDiagnoseResultDto? empiricalResult,
    bool saved,
    String? errorMessage,
  });

  $DiseaseItemDtoCopyWith<$Res>? get disease;
  $DiseaseCriteriaDtoCopyWith<$Res> get criteria;
  $EmpiricalDiagnoseResultDtoCopyWith<$Res>? get empiricalResult;
}

/// @nodoc
class _$DiagnosisFlowStateCopyWithImpl<$Res, $Val extends DiagnosisFlowState>
    implements $DiagnosisFlowStateCopyWith<$Res> {
  _$DiagnosisFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagnosisFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disease = freezed,
    Object? criteria = null,
    Object? empiricalResult = freezed,
    Object? saved = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            disease: freezed == disease
                ? _value.disease
                : disease // ignore: cast_nullable_to_non_nullable
                      as DiseaseItemDto?,
            criteria: null == criteria
                ? _value.criteria
                : criteria // ignore: cast_nullable_to_non_nullable
                      as DiseaseCriteriaDto,
            empiricalResult: freezed == empiricalResult
                ? _value.empiricalResult
                : empiricalResult // ignore: cast_nullable_to_non_nullable
                      as EmpiricalDiagnoseResultDto?,
            saved: null == saved
                ? _value.saved
                : saved // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of DiagnosisFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiseaseItemDtoCopyWith<$Res>? get disease {
    if (_value.disease == null) {
      return null;
    }

    return $DiseaseItemDtoCopyWith<$Res>(_value.disease!, (value) {
      return _then(_value.copyWith(disease: value) as $Val);
    });
  }

  /// Create a copy of DiagnosisFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiseaseCriteriaDtoCopyWith<$Res> get criteria {
    return $DiseaseCriteriaDtoCopyWith<$Res>(_value.criteria, (value) {
      return _then(_value.copyWith(criteria: value) as $Val);
    });
  }

  /// Create a copy of DiagnosisFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmpiricalDiagnoseResultDtoCopyWith<$Res>? get empiricalResult {
    if (_value.empiricalResult == null) {
      return null;
    }

    return $EmpiricalDiagnoseResultDtoCopyWith<$Res>(_value.empiricalResult!, (
      value,
    ) {
      return _then(_value.copyWith(empiricalResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiagnosisFlowStateImplCopyWith<$Res>
    implements $DiagnosisFlowStateCopyWith<$Res> {
  factory _$$DiagnosisFlowStateImplCopyWith(
    _$DiagnosisFlowStateImpl value,
    $Res Function(_$DiagnosisFlowStateImpl) then,
  ) = __$$DiagnosisFlowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DiseaseItemDto? disease,
    DiseaseCriteriaDto criteria,
    EmpiricalDiagnoseResultDto? empiricalResult,
    bool saved,
    String? errorMessage,
  });

  @override
  $DiseaseItemDtoCopyWith<$Res>? get disease;
  @override
  $DiseaseCriteriaDtoCopyWith<$Res> get criteria;
  @override
  $EmpiricalDiagnoseResultDtoCopyWith<$Res>? get empiricalResult;
}

/// @nodoc
class __$$DiagnosisFlowStateImplCopyWithImpl<$Res>
    extends _$DiagnosisFlowStateCopyWithImpl<$Res, _$DiagnosisFlowStateImpl>
    implements _$$DiagnosisFlowStateImplCopyWith<$Res> {
  __$$DiagnosisFlowStateImplCopyWithImpl(
    _$DiagnosisFlowStateImpl _value,
    $Res Function(_$DiagnosisFlowStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiagnosisFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disease = freezed,
    Object? criteria = null,
    Object? empiricalResult = freezed,
    Object? saved = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$DiagnosisFlowStateImpl(
        disease: freezed == disease
            ? _value.disease
            : disease // ignore: cast_nullable_to_non_nullable
                  as DiseaseItemDto?,
        criteria: null == criteria
            ? _value.criteria
            : criteria // ignore: cast_nullable_to_non_nullable
                  as DiseaseCriteriaDto,
        empiricalResult: freezed == empiricalResult
            ? _value.empiricalResult
            : empiricalResult // ignore: cast_nullable_to_non_nullable
                  as EmpiricalDiagnoseResultDto?,
        saved: null == saved
            ? _value.saved
            : saved // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DiagnosisFlowStateImpl implements _DiagnosisFlowState {
  const _$DiagnosisFlowStateImpl({
    this.disease,
    this.criteria = const DiseaseCriteriaDto(),
    this.empiricalResult,
    this.saved = false,
    this.errorMessage,
  });

  /// Selected disease (currently the first from `/diseases/list`).
  @override
  final DiseaseItemDto? disease;

  /// Real criteria loaded from `GET /diseases/{id}/criteria`.
  @override
  @JsonKey()
  final DiseaseCriteriaDto criteria;

  /// Result of `POST /diagnose/empirical` (rendered on the result tab).
  @override
  final EmpiricalDiagnoseResultDto? empiricalResult;

  /// Set right after a successful treatment create.
  @override
  @JsonKey()
  final bool saved;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'DiagnosisFlowState(disease: $disease, criteria: $criteria, empiricalResult: $empiricalResult, saved: $saved, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagnosisFlowStateImpl &&
            (identical(other.disease, disease) || other.disease == disease) &&
            (identical(other.criteria, criteria) ||
                other.criteria == criteria) &&
            (identical(other.empiricalResult, empiricalResult) ||
                other.empiricalResult == empiricalResult) &&
            (identical(other.saved, saved) || other.saved == saved) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    disease,
    criteria,
    empiricalResult,
    saved,
    errorMessage,
  );

  /// Create a copy of DiagnosisFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagnosisFlowStateImplCopyWith<_$DiagnosisFlowStateImpl> get copyWith =>
      __$$DiagnosisFlowStateImplCopyWithImpl<_$DiagnosisFlowStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DiagnosisFlowState implements DiagnosisFlowState {
  const factory _DiagnosisFlowState({
    final DiseaseItemDto? disease,
    final DiseaseCriteriaDto criteria,
    final EmpiricalDiagnoseResultDto? empiricalResult,
    final bool saved,
    final String? errorMessage,
  }) = _$DiagnosisFlowStateImpl;

  /// Selected disease (currently the first from `/diseases/list`).
  @override
  DiseaseItemDto? get disease;

  /// Real criteria loaded from `GET /diseases/{id}/criteria`.
  @override
  DiseaseCriteriaDto get criteria;

  /// Result of `POST /diagnose/empirical` (rendered on the result tab).
  @override
  EmpiricalDiagnoseResultDto? get empiricalResult;

  /// Set right after a successful treatment create.
  @override
  bool get saved;
  @override
  String? get errorMessage;

  /// Create a copy of DiagnosisFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagnosisFlowStateImplCopyWith<_$DiagnosisFlowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
