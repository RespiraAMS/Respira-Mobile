// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_flow_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$diagnosisFlowControllerHash() =>
    r'b63e0ab32f29308d83e66d4a544307af84a36499';

/// Orchestrates the API-backed diagnosis flow: disease + criteria
/// loading, empirical diagnosis, treatment persistence.
///
/// Copied from [DiagnosisFlowController].
@ProviderFor(DiagnosisFlowController)
final diagnosisFlowControllerProvider =
    NotifierProvider<DiagnosisFlowController, DiagnosisFlowState>.internal(
      DiagnosisFlowController.new,
      name: r'diagnosisFlowControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$diagnosisFlowControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DiagnosisFlowController = Notifier<DiagnosisFlowState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
