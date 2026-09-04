// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calculatorListHash() => r'9df76981d22a558b1eebf9ea3f7b09ff1ef09fad';

/// The roster of clinical calculators shown on the 'Máy tính' list.
///
/// Copied from [calculatorList].
@ProviderFor(calculatorList)
final calculatorListProvider = Provider<List<CalculatorId>>.internal(
  calculatorList,
  name: r'calculatorListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$calculatorListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CalculatorListRef = ProviderRef<List<CalculatorId>>;
String _$calculatorDetailTabControllerHash() =>
    r'096cb3e2614359a0cbaf2dc908db4980f85ba434';

/// Which detail tab is active: 0 = Nhập liệu, 1 = Giải thích.
///
/// Copied from [CalculatorDetailTabController].
@ProviderFor(CalculatorDetailTabController)
final calculatorDetailTabControllerProvider =
    NotifierProvider<CalculatorDetailTabController, int>.internal(
      CalculatorDetailTabController.new,
      name: r'calculatorDetailTabControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$calculatorDetailTabControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CalculatorDetailTabController = Notifier<int>;
String _$curb65CalculatorControllerHash() =>
    r'd7e63bccab1e3cd9b3d127697162260585cb95fc';

/// See also [Curb65CalculatorController].
@ProviderFor(Curb65CalculatorController)
final curb65CalculatorControllerProvider =
    NotifierProvider<
      Curb65CalculatorController,
      Curb65CalculatorState
    >.internal(
      Curb65CalculatorController.new,
      name: r'curb65CalculatorControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$curb65CalculatorControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Curb65CalculatorController = Notifier<Curb65CalculatorState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
