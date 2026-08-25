// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginControllerHash() => r'62bb748b26b877ad2c537efbb8f258d36104b9a6';

/// Holds the login form state.
///
/// Repository-backed authentication lands with the networking layer
/// (dio + retrofit); submitting currently just validates non-empty input.
///
/// Copied from [LoginController].
@ProviderFor(LoginController)
final loginControllerProvider =
    AutoDisposeNotifierProvider<LoginController, LoginFormState>.internal(
      LoginController.new,
      name: r'loginControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$loginControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LoginController = AutoDisposeNotifier<LoginFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
