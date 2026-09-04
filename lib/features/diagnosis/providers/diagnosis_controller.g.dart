// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$diagnosisCriteriaControllerHash() =>
    r'41ae5ce15cb1635726f4a4f51cf55dd51e0218cd';

/// Holds the measurements & selections of the diagnosis wizard
/// (vitals 1/5 · CURB-65 2/5 · ICU 3/5 · resistance 4/5 · other 5/5).
///
/// Copied from [DiagnosisCriteriaController].
@ProviderFor(DiagnosisCriteriaController)
final diagnosisCriteriaControllerProvider =
    NotifierProvider<
      DiagnosisCriteriaController,
      DiagnosisCriteriaState
    >.internal(
      DiagnosisCriteriaController.new,
      name: r'diagnosisCriteriaControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$diagnosisCriteriaControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DiagnosisCriteriaController = Notifier<DiagnosisCriteriaState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
