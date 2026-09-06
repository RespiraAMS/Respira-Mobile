// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_selection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$medicineSelectionControllerHash() =>
    r'cf2a6ae730db12aeb738e3cd408fab5059f09795';

/// Tracks medicine edits for the empirical 'Thuốc khuyến nghị' tab.
///
/// Identity by default (every recommendation stays as suggested); the
/// backend requires a non-empty `reasonForDifferentChoice` on save only
/// when changes exist — a replacement or a removal makes the doctor's
/// chosen list differ from the system recommendation.
///
/// Copied from [MedicineSelectionController].
@ProviderFor(MedicineSelectionController)
final medicineSelectionControllerProvider =
    NotifierProvider<
      MedicineSelectionController,
      MedicineSelectionState
    >.internal(
      MedicineSelectionController.new,
      name: r'medicineSelectionControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$medicineSelectionControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MedicineSelectionController = Notifier<MedicineSelectionState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
