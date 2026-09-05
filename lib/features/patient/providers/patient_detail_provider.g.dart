// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$patientDetailHash() => r'b612405b1757c8dfc89386a9aa8a0e0029b07c67';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Fetches `GET /patients/{id}` for the detail screen and mirrors the
/// record into [activePatientControllerProvider] — downstream screens
/// (progress, diagnosis wizard, treatment save) then work with the real
/// patient id instead of the sample fallback.
///
/// Copied from [patientDetail].
@ProviderFor(patientDetail)
const patientDetailProvider = PatientDetailFamily();

/// Fetches `GET /patients/{id}` for the detail screen and mirrors the
/// record into [activePatientControllerProvider] — downstream screens
/// (progress, diagnosis wizard, treatment save) then work with the real
/// patient id instead of the sample fallback.
///
/// Copied from [patientDetail].
class PatientDetailFamily extends Family<AsyncValue<PatientDetailDto>> {
  /// Fetches `GET /patients/{id}` for the detail screen and mirrors the
  /// record into [activePatientControllerProvider] — downstream screens
  /// (progress, diagnosis wizard, treatment save) then work with the real
  /// patient id instead of the sample fallback.
  ///
  /// Copied from [patientDetail].
  const PatientDetailFamily();

  /// Fetches `GET /patients/{id}` for the detail screen and mirrors the
  /// record into [activePatientControllerProvider] — downstream screens
  /// (progress, diagnosis wizard, treatment save) then work with the real
  /// patient id instead of the sample fallback.
  ///
  /// Copied from [patientDetail].
  PatientDetailProvider call(String id) {
    return PatientDetailProvider(id);
  }

  @override
  PatientDetailProvider getProviderOverride(
    covariant PatientDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'patientDetailProvider';
}

/// Fetches `GET /patients/{id}` for the detail screen and mirrors the
/// record into [activePatientControllerProvider] — downstream screens
/// (progress, diagnosis wizard, treatment save) then work with the real
/// patient id instead of the sample fallback.
///
/// Copied from [patientDetail].
class PatientDetailProvider
    extends AutoDisposeFutureProvider<PatientDetailDto> {
  /// Fetches `GET /patients/{id}` for the detail screen and mirrors the
  /// record into [activePatientControllerProvider] — downstream screens
  /// (progress, diagnosis wizard, treatment save) then work with the real
  /// patient id instead of the sample fallback.
  ///
  /// Copied from [patientDetail].
  PatientDetailProvider(String id)
    : this._internal(
        (ref) => patientDetail(ref as PatientDetailRef, id),
        from: patientDetailProvider,
        name: r'patientDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$patientDetailHash,
        dependencies: PatientDetailFamily._dependencies,
        allTransitiveDependencies:
            PatientDetailFamily._allTransitiveDependencies,
        id: id,
      );

  PatientDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<PatientDetailDto> Function(PatientDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PatientDetailProvider._internal(
        (ref) => create(ref as PatientDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PatientDetailDto> createElement() {
    return _PatientDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PatientDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PatientDetailRef on AutoDisposeFutureProviderRef<PatientDetailDto> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PatientDetailProviderElement
    extends AutoDisposeFutureProviderElement<PatientDetailDto>
    with PatientDetailRef {
  _PatientDetailProviderElement(super.provider);

  @override
  String get id => (origin as PatientDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
