import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../tokens/sizes.dart';
import 'theme_extensions.dart';

/// Builds [ThemeData] instances from semantic tokens.
///
/// Source: RESPIRAAMS_DESIGN_SYSTEM.md · 17 Flutter Implementation.
abstract final class AppTheme {
  static final ThemeData light = _baseTheme(
    colors: RespiraColors.light,
    brightness: Brightness.light,
  );

  static final ThemeData dark = _baseTheme(
    colors: RespiraColors.dark,
    brightness: Brightness.dark,
  );
}

ThemeData _baseTheme({
  required RespiraColors colors,
  required Brightness brightness,
}) {
  final colorScheme = ColorScheme(
    brightness: brightness,
    primary: colors.primary,
    onPrimary: colors.onPrimary,
    secondary: colors.surfaceSecondary,
    onSecondary: colors.textPrimary,
    surface: colors.background,
    onSurface: colors.textPrimary,
    error: colors.error,
    onError: colors.onPrimary,
  );

  final baseText = GoogleFonts.interTextTheme(
    brightness == Brightness.light
        ? ThemeData.light().textTheme
        : ThemeData.dark().textTheme,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colors.background,
    extensions: <ThemeExtension<dynamic>>[colors],
    textTheme: baseText.copyWith(
      displayLarge: baseText.displayLarge
          ?.copyWith(fontSize: 32, height: 40 / 32, fontWeight: FontWeight.w700),
      headlineLarge: baseText.headlineLarge
          ?.copyWith(fontSize: 28, height: 36 / 28, fontWeight: FontWeight.w700),
      headlineMedium: baseText.headlineMedium
          ?.copyWith(fontSize: 22, height: 30 / 22, fontWeight: FontWeight.w700),
      titleLarge: baseText.titleLarge
          ?.copyWith(fontSize: 18, height: 26 / 18, fontWeight: FontWeight.w600),
      bodyLarge: baseText.bodyLarge?.copyWith(fontSize: 17, height: 25 / 17),
      bodyMedium: baseText.bodyMedium?.copyWith(fontSize: 15, height: 22 / 15),
      bodySmall: baseText.bodySmall?.copyWith(fontSize: 13, height: 18 / 13),
      labelLarge: baseText.labelLarge
          ?.copyWith(fontSize: 16, height: 20 / 16, fontWeight: FontWeight.w600),
      labelMedium: baseText.labelMedium
          ?.copyWith(fontSize: 12, height: 16 / 12, fontWeight: FontWeight.w600),
    ),
    dividerColor: colors.borderSubtle,
    splashFactory: InkSparkle.splashFactory,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    iconTheme: IconThemeData(color: colors.iconDefault, size: ControlSize.iconBase),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? colors.primary
            : colors.borderStrong,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? colors.primary
            : Colors.transparent,
      ),
      side: BorderSide(color: colors.borderStrong),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    ),
  );
}
