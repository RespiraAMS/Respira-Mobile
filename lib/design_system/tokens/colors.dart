import 'package:flutter/material.dart';

/// Raw color values for the RespiraAMS semantic palette (light mode).
///
/// Source: RESPIRAAMS_DESIGN_SYSTEM.md · 02 Color System · Light.
abstract final class LightColors {
  static const background = Color(0xFFF7F9F9);
  static const foreground = Color(0xFF0F1419);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceSecondary = Color(0xFFEFF3F4);
  static const surfaceTertiary = Color(0xFFE7ECEE);

  static const primary = Color(0xFF1D9BF0);
  static const onPrimary = Color(0xFFFFFFFF);
  /// Derived tint of [primary] for selected containers / focus rings.
  static const primarySoft = Color(0xFFE8F5FD);

  static const textPrimary = Color(0xFF0F1419);
  static const textSecondary = Color(0xFF536471);
  static const textTertiary = Color(0xFF6E7C87);

  static const borderSubtle = Color(0xFFEFF3F4);
  static const borderDefault = Color(0xFFDCE3E6);
  static const borderStrong = Color(0xFFB8C4CA);

  static const iconDefault = Color(0xFF0F1419);
  static const iconMuted = Color(0xFF536471);
  static const iconPrimary = Color(0xFF1D9BF0);
  static const iconInverse = Color(0xFFFFFFFF);

  static const success = Color(0xFF00BA7C);
  static const successSoft = Color(0xFFE8F8F0);
  static const warning = Color(0xFFF0B400);
  static const warningSoft = Color(0xFFFFF4CC);
  static const error = Color(0xFFF4212E);
  static const errorSoft = Color(0xFFFEECEB);
  static const info = Color(0xFF1D9BF0);
  static const infoSoft = Color(0xFFE8F5FD);
}

/// Raw color values for the RespiraAMS semantic palette (dark mode).
///
/// Source: RESPIRAAMS_DESIGN_SYSTEM.md · 02 Color System · Dark.
abstract final class DarkColors {
  static const background = Color(0xFF000000);
  static const foreground = Color(0xFFFFFFFF);
  static const surface = Color(0xFF1C1C1E);
  static const surfaceSecondary = Color(0xFF2C2C2E);
  static const surfaceTertiary = Color(0xFF38383A);

  static const primary = Color(0xFF1D9BF0);
  static const onPrimary = Color(0xFFFFFFFF);
  /// Derived tint of [primary] for selected containers / focus rings.
  static const primarySoft = Color(0xFF12283A);

  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFF8B98A5);
  static const textTertiary = Color(0xFFA7B0B7);

  static const borderSubtle = Color(0xFF2C2C2E);
  static const borderDefault = Color(0xFF38383A);
  static const borderStrong = Color(0xFF545456);

  static const iconDefault = Color(0xFFFFFFFF);
  static const iconMuted = Color(0xFF8B98A5);
  static const iconPrimary = Color(0xFF1D9BF0);
  static const iconInverse = Color(0xFFFFFFFF);

  static const success = Color(0xFF17B26A);
  static const successSoft = Color(0xFF10241A);
  static const warning = Color(0xFFFDB022);
  static const warningSoft = Color(0xFF2E2505);
  static const error = Color(0xFFF04438);
  static const errorSoft = Color(0xFF2E1210);
  static const info = Color(0xFF1D9BF0);
  static const infoSoft = Color(0xFF12283A);
}
