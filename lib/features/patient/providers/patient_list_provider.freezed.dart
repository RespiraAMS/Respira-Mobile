// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PatientListState {
  String get query => throw _privateConstructorUsedError;
  PatientListFilter get filter => throw _privateConstructorUsedError;
  bool get prioritySort => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get loadingMore => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<PatientSummary> get patients => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  /// Create a copy of PatientListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientListStateCopyWith<PatientListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientListStateCopyWith<$Res> {
  factory $PatientListStateCopyWith(
    PatientListState value,
    $Res Function(PatientListState) then,
  ) = _$PatientListStateCopyWithImpl<$Res, PatientListState>;
  @useResult
  $Res call({
    String query,
    PatientListFilter filter,
    bool prioritySort,
    bool loading,
    bool loadingMore,
    bool hasMore,
    String? errorMessage,
    List<PatientSummary> patients,
    int page,
  });
}

/// @nodoc
class _$PatientListStateCopyWithImpl<$Res, $Val extends PatientListState>
    implements $PatientListStateCopyWith<$Res> {
  _$PatientListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? filter = null,
    Object? prioritySort = null,
    Object? loading = null,
    Object? loadingMore = null,
    Object? hasMore = null,
    Object? errorMessage = freezed,
    Object? patients = null,
    Object? page = null,
  }) {
    return _then(
      _value.copyWith(
            query: null == query
                ? _value.query
                : query // ignore: cast_nullable_to_non_nullable
                      as String,
            filter: null == filter
                ? _value.filter
                : filter // ignore: cast_nullable_to_non_nullable
                      as PatientListFilter,
            prioritySort: null == prioritySort
                ? _value.prioritySort
                : prioritySort // ignore: cast_nullable_to_non_nullable
                      as bool,
            loading: null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                      as bool,
            loadingMore: null == loadingMore
                ? _value.loadingMore
                : loadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            patients: null == patients
                ? _value.patients
                : patients // ignore: cast_nullable_to_non_nullable
                      as List<PatientSummary>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientListStateImplCopyWith<$Res>
    implements $PatientListStateCopyWith<$Res> {
  factory _$$PatientListStateImplCopyWith(
    _$PatientListStateImpl value,
    $Res Function(_$PatientListStateImpl) then,
  ) = __$$PatientListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String query,
    PatientListFilter filter,
    bool prioritySort,
    bool loading,
    bool loadingMore,
    bool hasMore,
    String? errorMessage,
    List<PatientSummary> patients,
    int page,
  });
}

/// @nodoc
class __$$PatientListStateImplCopyWithImpl<$Res>
    extends _$PatientListStateCopyWithImpl<$Res, _$PatientListStateImpl>
    implements _$$PatientListStateImplCopyWith<$Res> {
  __$$PatientListStateImplCopyWithImpl(
    _$PatientListStateImpl _value,
    $Res Function(_$PatientListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? filter = null,
    Object? prioritySort = null,
    Object? loading = null,
    Object? loadingMore = null,
    Object? hasMore = null,
    Object? errorMessage = freezed,
    Object? patients = null,
    Object? page = null,
  }) {
    return _then(
      _$PatientListStateImpl(
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as PatientListFilter,
        prioritySort: null == prioritySort
            ? _value.prioritySort
            : prioritySort // ignore: cast_nullable_to_non_nullable
                  as bool,
        loading: null == loading
            ? _value.loading
            : loading // ignore: cast_nullable_to_non_nullable
                  as bool,
        loadingMore: null == loadingMore
            ? _value.loadingMore
            : loadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        patients: null == patients
            ? _value._patients
            : patients // ignore: cast_nullable_to_non_nullable
                  as List<PatientSummary>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$PatientListStateImpl implements _PatientListState {
  const _$PatientListStateImpl({
    this.query = '',
    this.filter = PatientListFilter.all,
    this.prioritySort = false,
    this.loading = false,
    this.loadingMore = false,
    this.hasMore = false,
    this.errorMessage,
    final List<PatientSummary> patients = const [],
    this.page = 1,
  }) : _patients = patients;

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final PatientListFilter filter;
  @override
  @JsonKey()
  final bool prioritySort;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool loadingMore;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final String? errorMessage;
  final List<PatientSummary> _patients;
  @override
  @JsonKey()
  List<PatientSummary> get patients {
    if (_patients is EqualUnmodifiableListView) return _patients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patients);
  }

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'PatientListState(query: $query, filter: $filter, prioritySort: $prioritySort, loading: $loading, loadingMore: $loadingMore, hasMore: $hasMore, errorMessage: $errorMessage, patients: $patients, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListStateImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.prioritySort, prioritySort) ||
                other.prioritySort == prioritySort) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.loadingMore, loadingMore) ||
                other.loadingMore == loadingMore) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._patients, _patients) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    query,
    filter,
    prioritySort,
    loading,
    loadingMore,
    hasMore,
    errorMessage,
    const DeepCollectionEquality().hash(_patients),
    page,
  );

  /// Create a copy of PatientListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientListStateImplCopyWith<_$PatientListStateImpl> get copyWith =>
      __$$PatientListStateImplCopyWithImpl<_$PatientListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PatientListState implements PatientListState {
  const factory _PatientListState({
    final String query,
    final PatientListFilter filter,
    final bool prioritySort,
    final bool loading,
    final bool loadingMore,
    final bool hasMore,
    final String? errorMessage,
    final List<PatientSummary> patients,
    final int page,
  }) = _$PatientListStateImpl;

  @override
  String get query;
  @override
  PatientListFilter get filter;
  @override
  bool get prioritySort;
  @override
  bool get loading;
  @override
  bool get loadingMore;
  @override
  bool get hasMore;
  @override
  String? get errorMessage;
  @override
  List<PatientSummary> get patients;
  @override
  int get page;

  /// Create a copy of PatientListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientListStateImplCopyWith<_$PatientListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
