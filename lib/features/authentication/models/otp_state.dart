import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';
part 'otp_state.g.dart';

/// Seconds until "Gửi lại mã" becomes available.
const int kOtpResendSeconds = 42;

/// State of the OTP verification screen: entered digits plus the resend
/// countdown.
@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    /// Up to 6 digits captured by the hidden input field.
    @Default('') String digits,

    /// Seconds until "Gửi lại mã" becomes available.
    @Default(kOtpResendSeconds) int secondsRemaining,
  }) = _OtpState;

  factory OtpState.fromJson(Map<String, dynamic> json) =>
      _$OtpStateFromJson(json);
}

extension OtpStateX on OtpState {
  bool get isComplete => digits.length == 6;

  /// "00:42" style label for the countdown row.
  String get countdownLabel =>
      'Gửi lại mã sau 00:${secondsRemaining.toString().padLeft(2, '0')}';
}
