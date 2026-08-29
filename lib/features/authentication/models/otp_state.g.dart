// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpStateImpl _$$OtpStateImplFromJson(Map<String, dynamic> json) =>
    _$OtpStateImpl(
      digits: json['digits'] as String? ?? '',
      secondsRemaining:
          (json['secondsRemaining'] as num?)?.toInt() ?? kOtpResendSeconds,
    );

Map<String, dynamic> _$$OtpStateImplToJson(_$OtpStateImpl instance) =>
    <String, dynamic>{
      'digits': instance.digits,
      'secondsRemaining': instance.secondsRemaining,
    };
