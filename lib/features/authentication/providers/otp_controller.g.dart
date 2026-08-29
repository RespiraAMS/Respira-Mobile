// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$otpControllerHash() => r'd0abdbdbf922b416bc05e7f3e344d46820b3f9a2';

/// Holds the OTP digits and the resend countdown.
///
/// The countdown timer is cancelled when the provider is disposed
/// (leaving the OTP screen).
///
/// Copied from [OtpController].
@ProviderFor(OtpController)
final otpControllerProvider =
    AutoDisposeNotifierProvider<OtpController, OtpState>.internal(
      OtpController.new,
      name: r'otpControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$otpControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OtpController = AutoDisposeNotifier<OtpState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
