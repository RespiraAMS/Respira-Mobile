// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medicine_selection_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MedicineSelectionState {
  Map<String, String> get replacements => throw _privateConstructorUsedError;
  Set<String> get removed => throw _privateConstructorUsedError;

  /// Create a copy of MedicineSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicineSelectionStateCopyWith<MedicineSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineSelectionStateCopyWith<$Res> {
  factory $MedicineSelectionStateCopyWith(
    MedicineSelectionState value,
    $Res Function(MedicineSelectionState) then,
  ) = _$MedicineSelectionStateCopyWithImpl<$Res, MedicineSelectionState>;
  @useResult
  $Res call({Map<String, String> replacements, Set<String> removed});
}

/// @nodoc
class _$MedicineSelectionStateCopyWithImpl<
  $Res,
  $Val extends MedicineSelectionState
>
    implements $MedicineSelectionStateCopyWith<$Res> {
  _$MedicineSelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicineSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? replacements = null, Object? removed = null}) {
    return _then(
      _value.copyWith(
            replacements: null == replacements
                ? _value.replacements
                : replacements // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            removed: null == removed
                ? _value.removed
                : removed // ignore: cast_nullable_to_non_nullable
                      as Set<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicineSelectionStateImplCopyWith<$Res>
    implements $MedicineSelectionStateCopyWith<$Res> {
  factory _$$MedicineSelectionStateImplCopyWith(
    _$MedicineSelectionStateImpl value,
    $Res Function(_$MedicineSelectionStateImpl) then,
  ) = __$$MedicineSelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, String> replacements, Set<String> removed});
}

/// @nodoc
class __$$MedicineSelectionStateImplCopyWithImpl<$Res>
    extends
        _$MedicineSelectionStateCopyWithImpl<$Res, _$MedicineSelectionStateImpl>
    implements _$$MedicineSelectionStateImplCopyWith<$Res> {
  __$$MedicineSelectionStateImplCopyWithImpl(
    _$MedicineSelectionStateImpl _value,
    $Res Function(_$MedicineSelectionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? replacements = null, Object? removed = null}) {
    return _then(
      _$MedicineSelectionStateImpl(
        replacements: null == replacements
            ? _value._replacements
            : replacements // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        removed: null == removed
            ? _value._removed
            : removed // ignore: cast_nullable_to_non_nullable
                  as Set<String>,
      ),
    );
  }
}

/// @nodoc

class _$MedicineSelectionStateImpl implements _MedicineSelectionState {
  const _$MedicineSelectionStateImpl({
    final Map<String, String> replacements = const {},
    final Set<String> removed = const {},
  }) : _replacements = replacements,
       _removed = removed;

  final Map<String, String> _replacements;
  @override
  @JsonKey()
  Map<String, String> get replacements {
    if (_replacements is EqualUnmodifiableMapView) return _replacements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_replacements);
  }

  final Set<String> _removed;
  @override
  @JsonKey()
  Set<String> get removed {
    if (_removed is EqualUnmodifiableSetView) return _removed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_removed);
  }

  @override
  String toString() {
    return 'MedicineSelectionState(replacements: $replacements, removed: $removed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineSelectionStateImpl &&
            const DeepCollectionEquality().equals(
              other._replacements,
              _replacements,
            ) &&
            const DeepCollectionEquality().equals(other._removed, _removed));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_replacements),
    const DeepCollectionEquality().hash(_removed),
  );

  /// Create a copy of MedicineSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineSelectionStateImplCopyWith<_$MedicineSelectionStateImpl>
  get copyWith =>
      __$$MedicineSelectionStateImplCopyWithImpl<_$MedicineSelectionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _MedicineSelectionState implements MedicineSelectionState {
  const factory _MedicineSelectionState({
    final Map<String, String> replacements,
    final Set<String> removed,
  }) = _$MedicineSelectionStateImpl;

  @override
  Map<String, String> get replacements;
  @override
  Set<String> get removed;

  /// Create a copy of MedicineSelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicineSelectionStateImplCopyWith<_$MedicineSelectionStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
