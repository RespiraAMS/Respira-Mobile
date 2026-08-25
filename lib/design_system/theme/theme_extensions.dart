import 'package:flutter/material.dart';

import '../tokens/colors.dart';

/// Semantic color tokens exposed to widgets via [ThemeExtension].
///
/// Access: `context.respiraColors.primary` — features must never hard-code
/// colors (RESPIRAAMS_DESIGN_SYSTEM.md · 17 Flutter Implementation).
@immutable
class RespiraColors extends ThemeExtension<RespiraColors> {
  const RespiraColors({
    required this.background,
    required this.foreground,
    required this.surface,
    required this.surfaceSecondary,
    required this.surfaceTertiary,
    required this.primary,
    required this.onPrimary,
    required this.primarySoft,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.borderSubtle,
    required this.borderDefault,
    required this.borderStrong,
    required this.iconDefault,
    required this.iconMuted,
    required this.iconPrimary,
    required this.iconInverse,
    required this.success,
    required this.successSoft,
    required this.warning,
    required this.warningSoft,
    required this.error,
    required this.errorSoft,
    required this.info,
    required this.infoSoft,
  });

  final Color background;
  final Color foreground;
  final Color surface;
  final Color surfaceSecondary;
  final Color surfaceTertiary;
  final Color primary;
  final Color onPrimary;
  final Color primarySoft;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color borderSubtle;
  final Color borderDefault;
  final Color borderStrong;
  final Color iconDefault;
  final Color iconMuted;
  final Color iconPrimary;
  final Color iconInverse;
  final Color success;
  final Color successSoft;
  final Color warning;
  final Color warningSoft;
  final Color error;
  final Color errorSoft;
  final Color info;
  final Color infoSoft;

  static const light = RespiraColors(
    background: LightColors.background,
    foreground: LightColors.foreground,
    surface: LightColors.surface,
    surfaceSecondary: LightColors.surfaceSecondary,
    surfaceTertiary: LightColors.surfaceTertiary,
    primary: LightColors.primary,
    onPrimary: LightColors.onPrimary,
    primarySoft: LightColors.primarySoft,
    textPrimary: LightColors.textPrimary,
    textSecondary: LightColors.textSecondary,
    textTertiary: LightColors.textTertiary,
    borderSubtle: LightColors.borderSubtle,
    borderDefault: LightColors.borderDefault,
    borderStrong: LightColors.borderStrong,
    iconDefault: LightColors.iconDefault,
    iconMuted: LightColors.iconMuted,
    iconPrimary: LightColors.iconPrimary,
    iconInverse: LightColors.iconInverse,
    success: LightColors.success,
    successSoft: LightColors.successSoft,
    warning: LightColors.warning,
    warningSoft: LightColors.warningSoft,
    error: LightColors.error,
    errorSoft: LightColors.errorSoft,
    info: LightColors.info,
    infoSoft: LightColors.infoSoft,
  );

  static const dark = RespiraColors(
    background: DarkColors.background,
    foreground: DarkColors.foreground,
    surface: DarkColors.surface,
    surfaceSecondary: DarkColors.surfaceSecondary,
    surfaceTertiary: DarkColors.surfaceTertiary,
    primary: DarkColors.primary,
    onPrimary: DarkColors.onPrimary,
    primarySoft: DarkColors.primarySoft,
    textPrimary: DarkColors.textPrimary,
    textSecondary: DarkColors.textSecondary,
    textTertiary: DarkColors.textTertiary,
    borderSubtle: DarkColors.borderSubtle,
    borderDefault: DarkColors.borderDefault,
    borderStrong: DarkColors.borderStrong,
    iconDefault: DarkColors.iconDefault,
    iconMuted: DarkColors.iconMuted,
    iconPrimary: DarkColors.iconPrimary,
    iconInverse: DarkColors.iconInverse,
    success: DarkColors.success,
    successSoft: DarkColors.successSoft,
    warning: DarkColors.warning,
    warningSoft: DarkColors.warningSoft,
    error: DarkColors.error,
    errorSoft: DarkColors.errorSoft,
    info: DarkColors.info,
    infoSoft: DarkColors.infoSoft,
  );

  @override
  RespiraColors copyWith({
    Color? background,
    Color? foreground,
    Color? surface,
    Color? surfaceSecondary,
    Color? surfaceTertiary,
    Color? primary,
    Color? onPrimary,
    Color? primarySoft,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? borderSubtle,
    Color? borderDefault,
    Color? borderStrong,
    Color? iconDefault,
    Color? iconMuted,
    Color? iconPrimary,
    Color? iconInverse,
    Color? success,
    Color? successSoft,
    Color? warning,
    Color? warningSoft,
    Color? error,
    Color? errorSoft,
    Color? info,
    Color? infoSoft,
  }) {
    return RespiraColors(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      surfaceTertiary: surfaceTertiary ?? this.surfaceTertiary,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primarySoft: primarySoft ?? this.primarySoft,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderDefault: borderDefault ?? this.borderDefault,
      borderStrong: borderStrong ?? this.borderStrong,
      iconDefault: iconDefault ?? this.iconDefault,
      iconMuted: iconMuted ?? this.iconMuted,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconInverse: iconInverse ?? this.iconInverse,
      success: success ?? this.success,
      successSoft: successSoft ?? this.successSoft,
      warning: warning ?? this.warning,
      warningSoft: warningSoft ?? this.warningSoft,
      error: error ?? this.error,
      errorSoft: errorSoft ?? this.errorSoft,
      info: info ?? this.info,
      infoSoft: infoSoft ?? this.infoSoft,
    );
  }

  @override
  RespiraColors lerp(RespiraColors? other, double t) {
    if (other is! RespiraColors) return this;
    return RespiraColors(
      background: Color.lerp(background, other.background, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary: Color.lerp(surfaceSecondary, other.surfaceSecondary, t)!,
      surfaceTertiary: Color.lerp(surfaceTertiary, other.surfaceTertiary, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primarySoft: Color.lerp(primarySoft, other.primarySoft, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      borderDefault: Color.lerp(borderDefault, other.borderDefault, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      iconDefault: Color.lerp(iconDefault, other.iconDefault, t)!,
      iconMuted: Color.lerp(iconMuted, other.iconMuted, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconInverse: Color.lerp(iconInverse, other.iconInverse, t)!,
      success: Color.lerp(success, other.success, t)!,
      successSoft: Color.lerp(successSoft, other.successSoft, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningSoft: Color.lerp(warningSoft, other.warningSoft, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorSoft: Color.lerp(errorSoft, other.errorSoft, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoSoft: Color.lerp(infoSoft, other.infoSoft, t)!,
    );
  }
}

extension RespiraColorsContextX on BuildContext {
  /// Semantic color tokens for the current theme brightness.
  RespiraColors get respiraColors =>
      Theme.of(this).extension<RespiraColors>()!;
}
