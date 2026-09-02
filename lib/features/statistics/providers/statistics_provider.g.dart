// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statisticsViewHash() => r'f3b4e8e006887158d4889b64f1443bff47821ce1';

/// Demo datasets per range — swap for a repository call once the
/// networking layer exists.
///
/// Copied from [statisticsView].
@ProviderFor(statisticsView)
final statisticsViewProvider = Provider<StatisticsView>.internal(
  statisticsView,
  name: r'statisticsViewProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$statisticsViewHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StatisticsViewRef = ProviderRef<StatisticsView>;
String _$statisticsPeriodControllerHash() =>
    r'279530f4a593ce2e08477b8a4327c14c5cf46cce';

/// Selected overview range of the statistics screen.
///
/// Copied from [StatisticsPeriodController].
@ProviderFor(StatisticsPeriodController)
final statisticsPeriodControllerProvider =
    NotifierProvider<StatisticsPeriodController, PeriodRange>.internal(
      StatisticsPeriodController.new,
      name: r'statisticsPeriodControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$statisticsPeriodControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$StatisticsPeriodController = Notifier<PeriodRange>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
