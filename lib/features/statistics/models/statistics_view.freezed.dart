// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

KpiStat _$KpiStatFromJson(Map<String, dynamic> json) {
  return _KpiStat.fromJson(json);
}

/// @nodoc
mixin _$KpiStat {
  String get label => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;
  int get deltaPercent => throw _privateConstructorUsedError;

  /// Serializes this KpiStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KpiStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KpiStatCopyWith<KpiStat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KpiStatCopyWith<$Res> {
  factory $KpiStatCopyWith(KpiStat value, $Res Function(KpiStat) then) =
      _$KpiStatCopyWithImpl<$Res, KpiStat>;
  @useResult
  $Res call({String label, int value, int deltaPercent});
}

/// @nodoc
class _$KpiStatCopyWithImpl<$Res, $Val extends KpiStat>
    implements $KpiStatCopyWith<$Res> {
  _$KpiStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KpiStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? deltaPercent = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as int,
            deltaPercent: null == deltaPercent
                ? _value.deltaPercent
                : deltaPercent // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KpiStatImplCopyWith<$Res> implements $KpiStatCopyWith<$Res> {
  factory _$$KpiStatImplCopyWith(
    _$KpiStatImpl value,
    $Res Function(_$KpiStatImpl) then,
  ) = __$$KpiStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int value, int deltaPercent});
}

/// @nodoc
class __$$KpiStatImplCopyWithImpl<$Res>
    extends _$KpiStatCopyWithImpl<$Res, _$KpiStatImpl>
    implements _$$KpiStatImplCopyWith<$Res> {
  __$$KpiStatImplCopyWithImpl(
    _$KpiStatImpl _value,
    $Res Function(_$KpiStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KpiStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? deltaPercent = null,
  }) {
    return _then(
      _$KpiStatImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
        deltaPercent: null == deltaPercent
            ? _value.deltaPercent
            : deltaPercent // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KpiStatImpl implements _KpiStat {
  const _$KpiStatImpl({
    required this.label,
    required this.value,
    required this.deltaPercent,
  });

  factory _$KpiStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$KpiStatImplFromJson(json);

  @override
  final String label;
  @override
  final int value;
  @override
  final int deltaPercent;

  @override
  String toString() {
    return 'KpiStat(label: $label, value: $value, deltaPercent: $deltaPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KpiStatImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.deltaPercent, deltaPercent) ||
                other.deltaPercent == deltaPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value, deltaPercent);

  /// Create a copy of KpiStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KpiStatImplCopyWith<_$KpiStatImpl> get copyWith =>
      __$$KpiStatImplCopyWithImpl<_$KpiStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KpiStatImplToJson(this);
  }
}

abstract class _KpiStat implements KpiStat {
  const factory _KpiStat({
    required final String label,
    required final int value,
    required final int deltaPercent,
  }) = _$KpiStatImpl;

  factory _KpiStat.fromJson(Map<String, dynamic> json) = _$KpiStatImpl.fromJson;

  @override
  String get label;
  @override
  int get value;
  @override
  int get deltaPercent;

  /// Create a copy of KpiStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KpiStatImplCopyWith<_$KpiStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyBar _$WeeklyBarFromJson(Map<String, dynamic> json) {
  return _WeeklyBar.fromJson(json);
}

/// @nodoc
mixin _$WeeklyBar {
  String get label => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  /// Serializes this WeeklyBar to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyBar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyBarCopyWith<WeeklyBar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyBarCopyWith<$Res> {
  factory $WeeklyBarCopyWith(WeeklyBar value, $Res Function(WeeklyBar) then) =
      _$WeeklyBarCopyWithImpl<$Res, WeeklyBar>;
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class _$WeeklyBarCopyWithImpl<$Res, $Val extends WeeklyBar>
    implements $WeeklyBarCopyWith<$Res> {
  _$WeeklyBarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyBar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? value = null}) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeeklyBarImplCopyWith<$Res>
    implements $WeeklyBarCopyWith<$Res> {
  factory _$$WeeklyBarImplCopyWith(
    _$WeeklyBarImpl value,
    $Res Function(_$WeeklyBarImpl) then,
  ) = __$$WeeklyBarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, int value});
}

/// @nodoc
class __$$WeeklyBarImplCopyWithImpl<$Res>
    extends _$WeeklyBarCopyWithImpl<$Res, _$WeeklyBarImpl>
    implements _$$WeeklyBarImplCopyWith<$Res> {
  __$$WeeklyBarImplCopyWithImpl(
    _$WeeklyBarImpl _value,
    $Res Function(_$WeeklyBarImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeeklyBar
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? label = null, Object? value = null}) {
    return _then(
      _$WeeklyBarImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyBarImpl implements _WeeklyBar {
  const _$WeeklyBarImpl({required this.label, required this.value});

  factory _$WeeklyBarImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyBarImplFromJson(json);

  @override
  final String label;
  @override
  final int value;

  @override
  String toString() {
    return 'WeeklyBar(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyBarImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  /// Create a copy of WeeklyBar
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyBarImplCopyWith<_$WeeklyBarImpl> get copyWith =>
      __$$WeeklyBarImplCopyWithImpl<_$WeeklyBarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyBarImplToJson(this);
  }
}

abstract class _WeeklyBar implements WeeklyBar {
  const factory _WeeklyBar({
    required final String label,
    required final int value,
  }) = _$WeeklyBarImpl;

  factory _WeeklyBar.fromJson(Map<String, dynamic> json) =
      _$WeeklyBarImpl.fromJson;

  @override
  String get label;
  @override
  int get value;

  /// Create a copy of WeeklyBar
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyBarImplCopyWith<_$WeeklyBarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PathogenStat _$PathogenStatFromJson(Map<String, dynamic> json) {
  return _PathogenStat.fromJson(json);
}

/// @nodoc
mixin _$PathogenStat {
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// 0 = most frequent; drives the semantic bar color (primary/warning/
  /// success — label + color together, never color alone §12).
  int get rank => throw _privateConstructorUsedError;

  /// Serializes this PathogenStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PathogenStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PathogenStatCopyWith<PathogenStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathogenStatCopyWith<$Res> {
  factory $PathogenStatCopyWith(
    PathogenStat value,
    $Res Function(PathogenStat) then,
  ) = _$PathogenStatCopyWithImpl<$Res, PathogenStat>;
  @useResult
  $Res call({String name, int count, int rank});
}

/// @nodoc
class _$PathogenStatCopyWithImpl<$Res, $Val extends PathogenStat>
    implements $PathogenStatCopyWith<$Res> {
  _$PathogenStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PathogenStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? count = null, Object? rank = null}) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            rank: null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PathogenStatImplCopyWith<$Res>
    implements $PathogenStatCopyWith<$Res> {
  factory _$$PathogenStatImplCopyWith(
    _$PathogenStatImpl value,
    $Res Function(_$PathogenStatImpl) then,
  ) = __$$PathogenStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int count, int rank});
}

/// @nodoc
class __$$PathogenStatImplCopyWithImpl<$Res>
    extends _$PathogenStatCopyWithImpl<$Res, _$PathogenStatImpl>
    implements _$$PathogenStatImplCopyWith<$Res> {
  __$$PathogenStatImplCopyWithImpl(
    _$PathogenStatImpl _value,
    $Res Function(_$PathogenStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PathogenStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? count = null, Object? rank = null}) {
    return _then(
      _$PathogenStatImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        rank: null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PathogenStatImpl implements _PathogenStat {
  const _$PathogenStatImpl({
    required this.name,
    required this.count,
    required this.rank,
  });

  factory _$PathogenStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$PathogenStatImplFromJson(json);

  @override
  final String name;
  @override
  final int count;

  /// 0 = most frequent; drives the semantic bar color (primary/warning/
  /// success — label + color together, never color alone §12).
  @override
  final int rank;

  @override
  String toString() {
    return 'PathogenStat(name: $name, count: $count, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathogenStatImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, count, rank);

  /// Create a copy of PathogenStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PathogenStatImplCopyWith<_$PathogenStatImpl> get copyWith =>
      __$$PathogenStatImplCopyWithImpl<_$PathogenStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PathogenStatImplToJson(this);
  }
}

abstract class _PathogenStat implements PathogenStat {
  const factory _PathogenStat({
    required final String name,
    required final int count,
    required final int rank,
  }) = _$PathogenStatImpl;

  factory _PathogenStat.fromJson(Map<String, dynamic> json) =
      _$PathogenStatImpl.fromJson;

  @override
  String get name;
  @override
  int get count;

  /// 0 = most frequent; drives the semantic bar color (primary/warning/
  /// success — label + color together, never color alone §12).
  @override
  int get rank;

  /// Create a copy of PathogenStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PathogenStatImplCopyWith<_$PathogenStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatisticsView _$StatisticsViewFromJson(Map<String, dynamic> json) {
  return _StatisticsView.fromJson(json);
}

/// @nodoc
mixin _$StatisticsView {
  List<KpiStat> get kpis => throw _privateConstructorUsedError;
  List<WeeklyBar> get bars => throw _privateConstructorUsedError;
  List<PathogenStat> get pathogens => throw _privateConstructorUsedError;

  /// Serializes this StatisticsView to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatisticsView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticsViewCopyWith<StatisticsView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsViewCopyWith<$Res> {
  factory $StatisticsViewCopyWith(
    StatisticsView value,
    $Res Function(StatisticsView) then,
  ) = _$StatisticsViewCopyWithImpl<$Res, StatisticsView>;
  @useResult
  $Res call({
    List<KpiStat> kpis,
    List<WeeklyBar> bars,
    List<PathogenStat> pathogens,
  });
}

/// @nodoc
class _$StatisticsViewCopyWithImpl<$Res, $Val extends StatisticsView>
    implements $StatisticsViewCopyWith<$Res> {
  _$StatisticsViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticsView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kpis = null,
    Object? bars = null,
    Object? pathogens = null,
  }) {
    return _then(
      _value.copyWith(
            kpis: null == kpis
                ? _value.kpis
                : kpis // ignore: cast_nullable_to_non_nullable
                      as List<KpiStat>,
            bars: null == bars
                ? _value.bars
                : bars // ignore: cast_nullable_to_non_nullable
                      as List<WeeklyBar>,
            pathogens: null == pathogens
                ? _value.pathogens
                : pathogens // ignore: cast_nullable_to_non_nullable
                      as List<PathogenStat>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StatisticsViewImplCopyWith<$Res>
    implements $StatisticsViewCopyWith<$Res> {
  factory _$$StatisticsViewImplCopyWith(
    _$StatisticsViewImpl value,
    $Res Function(_$StatisticsViewImpl) then,
  ) = __$$StatisticsViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<KpiStat> kpis,
    List<WeeklyBar> bars,
    List<PathogenStat> pathogens,
  });
}

/// @nodoc
class __$$StatisticsViewImplCopyWithImpl<$Res>
    extends _$StatisticsViewCopyWithImpl<$Res, _$StatisticsViewImpl>
    implements _$$StatisticsViewImplCopyWith<$Res> {
  __$$StatisticsViewImplCopyWithImpl(
    _$StatisticsViewImpl _value,
    $Res Function(_$StatisticsViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StatisticsView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? kpis = null,
    Object? bars = null,
    Object? pathogens = null,
  }) {
    return _then(
      _$StatisticsViewImpl(
        kpis: null == kpis
            ? _value._kpis
            : kpis // ignore: cast_nullable_to_non_nullable
                  as List<KpiStat>,
        bars: null == bars
            ? _value._bars
            : bars // ignore: cast_nullable_to_non_nullable
                  as List<WeeklyBar>,
        pathogens: null == pathogens
            ? _value._pathogens
            : pathogens // ignore: cast_nullable_to_non_nullable
                  as List<PathogenStat>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticsViewImpl implements _StatisticsView {
  const _$StatisticsViewImpl({
    final List<KpiStat> kpis = const [],
    final List<WeeklyBar> bars = const [],
    final List<PathogenStat> pathogens = const [],
  }) : _kpis = kpis,
       _bars = bars,
       _pathogens = pathogens;

  factory _$StatisticsViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsViewImplFromJson(json);

  final List<KpiStat> _kpis;
  @override
  @JsonKey()
  List<KpiStat> get kpis {
    if (_kpis is EqualUnmodifiableListView) return _kpis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_kpis);
  }

  final List<WeeklyBar> _bars;
  @override
  @JsonKey()
  List<WeeklyBar> get bars {
    if (_bars is EqualUnmodifiableListView) return _bars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bars);
  }

  final List<PathogenStat> _pathogens;
  @override
  @JsonKey()
  List<PathogenStat> get pathogens {
    if (_pathogens is EqualUnmodifiableListView) return _pathogens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pathogens);
  }

  @override
  String toString() {
    return 'StatisticsView(kpis: $kpis, bars: $bars, pathogens: $pathogens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsViewImpl &&
            const DeepCollectionEquality().equals(other._kpis, _kpis) &&
            const DeepCollectionEquality().equals(other._bars, _bars) &&
            const DeepCollectionEquality().equals(
              other._pathogens,
              _pathogens,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_kpis),
    const DeepCollectionEquality().hash(_bars),
    const DeepCollectionEquality().hash(_pathogens),
  );

  /// Create a copy of StatisticsView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsViewImplCopyWith<_$StatisticsViewImpl> get copyWith =>
      __$$StatisticsViewImplCopyWithImpl<_$StatisticsViewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsViewImplToJson(this);
  }
}

abstract class _StatisticsView implements StatisticsView {
  const factory _StatisticsView({
    final List<KpiStat> kpis,
    final List<WeeklyBar> bars,
    final List<PathogenStat> pathogens,
  }) = _$StatisticsViewImpl;

  factory _StatisticsView.fromJson(Map<String, dynamic> json) =
      _$StatisticsViewImpl.fromJson;

  @override
  List<KpiStat> get kpis;
  @override
  List<WeeklyBar> get bars;
  @override
  List<PathogenStat> get pathogens;

  /// Create a copy of StatisticsView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticsViewImplCopyWith<_$StatisticsViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
