// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'targeted_pathogen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$targetedPathogenControllerHash() =>
    r'682a7c1ac53367a8adc0241496f83716af3a174e';

/// The pathogen the doctor picked on the "Chẩn đoán vi sinh" screen.
///
/// Auto-disposed: leaving the screen clears the selection, so the next
/// entry defaults to the first pathogen of `GET /pathogens/list`.
///
/// Copied from [TargetedPathogenController].
@ProviderFor(TargetedPathogenController)
final targetedPathogenControllerProvider =
    AutoDisposeNotifierProvider<TargetedPathogenController, String?>.internal(
      TargetedPathogenController.new,
      name: r'targetedPathogenControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$targetedPathogenControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TargetedPathogenController = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
