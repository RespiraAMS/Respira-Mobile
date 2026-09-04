// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokenStorageHash() => r'6338266ab8753606ba7255b3c996d0e724b41a42';

/// Exposed for services that only need token storage.
///
/// Copied from [tokenStorage].
@ProviderFor(tokenStorage)
final tokenStorageProvider = AutoDisposeProvider<TokenStorage>.internal(
  tokenStorage,
  name: r'tokenStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TokenStorageRef = AutoDisposeProviderRef<TokenStorage>;
String _$sessionDoctorHash() => r'12219974aabab02f54d215d46a33ba345f061b8c';

/// Convenience accessor so widgets/services can locate the doctor profile
/// without null-checking the session.
///
/// Copied from [sessionDoctor].
@ProviderFor(sessionDoctor)
final sessionDoctorProvider = AutoDisposeProvider<DoctorProfile?>.internal(
  sessionDoctor,
  name: r'sessionDoctorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionDoctorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SessionDoctorRef = AutoDisposeProviderRef<DoctorProfile?>;
String _$sessionControllerHash() => r'5e7da7d620c1c386c9326cef5f7771d143d0c334';

/// Holds the active session (null = logged out). The login screen drives
/// [login]; the app header's logout button drives [logout].
///
/// Copied from [SessionController].
@ProviderFor(SessionController)
final sessionControllerProvider =
    NotifierProvider<SessionController, DoctorProfile?>.internal(
      SessionController.new,
      name: r'sessionControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sessionControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SessionController = Notifier<DoctorProfile?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
