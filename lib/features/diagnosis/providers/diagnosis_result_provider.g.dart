// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_result_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentDiagnosisResultHash() =>
    r'c0a6d0f7a368cbbccaed8858c2197c8dfcfe671b';

/// Builds the diagnosis result from the wizard selections.
///
/// Demo derivation rules (pending real clinical logic): CURB-65 ≥ 3 →
/// high severity / inpatient care. Medicines & references mirror the
/// Figma templates.
///
/// Copied from [currentDiagnosisResult].
@ProviderFor(currentDiagnosisResult)
final currentDiagnosisResultProvider = Provider<DiagnosisResult>.internal(
  currentDiagnosisResult,
  name: r'currentDiagnosisResultProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentDiagnosisResultHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentDiagnosisResultRef = ProviderRef<DiagnosisResult>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
