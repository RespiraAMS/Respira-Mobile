import 'package:flutter/material.dart';

/// Inter type scale. Source: RESPIRAAMS_DESIGN_SYSTEM.md · 03 Typography.
abstract final class TypographyTokens {
  static TextStyle display(BuildContext context) => _style(
        context,
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w700,
      );

  static TextStyle h1(BuildContext context) => _style(
        context,
        fontSize: 28,
        height: 36 / 28,
        fontWeight: FontWeight.w700,
      );

  static TextStyle h2(BuildContext context) => _style(
        context,
        fontSize: 22,
        height: 30 / 22,
        fontWeight: FontWeight.w700,
      );

  static TextStyle h3(BuildContext context) => _style(
        context,
        fontSize: 18,
        height: 26 / 18,
        fontWeight: FontWeight.w600,
      );

  static TextStyle bodyLarge(BuildContext context) =>
      _style(context, fontSize: 17, height: 25 / 17);

  static TextStyle body(BuildContext context) =>
      _style(context, fontSize: 15, height: 23 / 15);

  static TextStyle bodyMedium(BuildContext context) => _style(
        context,
        fontSize: 15,
        height: 22 / 15,
        fontWeight: FontWeight.w500,
      );

  static TextStyle button(BuildContext context) => _style(
        context,
        fontSize: 16,
        height: 20 / 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle caption(BuildContext context) =>
      _style(context, fontSize: 13, height: 18 / 13);

  static TextStyle label(BuildContext context) => _style(
        context,
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w600,
      );

  static TextStyle _style(
    BuildContext context, {
    required double fontSize,
    required double height,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: fontSize,
      height: height,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}
