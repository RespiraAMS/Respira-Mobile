import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/otp_state.dart';

part 'otp_controller.g.dart';

/// Holds the OTP digits and the resend countdown.
///
/// The countdown timer is cancelled when the provider is disposed
/// (leaving the OTP screen).
@riverpod
class OtpController extends _$OtpController {
  Timer? _timer;

  @override
  OtpState build() {
    ref.onDispose(_cancelTimer);
    // Initial state is returned below; never assign [state] inside build().
    _scheduleCountdown(initial: true);
    return const OtpState();
  }

  void digitChanged(String value) {
    state = state.copyWith(digits: value);
  }

  /// Clears the entered code and restarts the countdown.
  void resend() {
    _scheduleCountdown();
    state = state.copyWith(
      digits: '',
      secondsRemaining: kOtpResendSeconds,
    );
  }

  void _scheduleCountdown({bool initial = false}) {
    _cancelTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // Safe to touch [state] here: the provider finished initializing
      // on the first frame after build().
      final remaining = state.secondsRemaining;
      if (remaining <= 1) {
        _cancelTimer();
        state = state.copyWith(secondsRemaining: 0);
      } else {
        state = state.copyWith(secondsRemaining: remaining - 1);
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
