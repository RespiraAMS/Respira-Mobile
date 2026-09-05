// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$patientListHash() => r'3626cd82f490ef778614f735bab1d774729bb7e7';

/// Demo roster — sized so the template's derived counts are real:
/// 12 total · 3 "Cần chú ý" (treating) · 1 "Nguy cơ cao" (deceased).
/// Swap for a repository call once the networking layer exists.
///
/// Copied from [patientList].
@ProviderFor(patientList)
final patientListProvider = Provider<List<PatientSummary>>.internal(
  patientList,
  name: r'patientListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$patientListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PatientListRef = ProviderRef<List<PatientSummary>>;
String _$visiblePatientsHash() => r'ed7cf19aba762e6a86cb85447796181b0fa65c93';

/// Applies the current query / filter / sort on top of the roster.
///
/// Copied from [visiblePatients].
@ProviderFor(visiblePatients)
final visiblePatientsProvider = Provider<List<PatientSummary>>.internal(
  visiblePatients,
  name: r'visiblePatientsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$visiblePatientsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VisiblePatientsRef = ProviderRef<List<PatientSummary>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
