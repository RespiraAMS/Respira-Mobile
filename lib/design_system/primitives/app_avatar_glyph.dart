import 'package:flutter/material.dart';

import '../theme/theme_extensions.dart';

/// Flat circular avatar placeholder with a centered glyph (emoji or
/// initials). Replaces decorative photo placeholders — offline-safe and
/// gradient-free (§15 Don't).
class AvatarGlyphWidget extends StatelessWidget {
  const AvatarGlyphWidget({
    super.key,
    required this.glyph,
    this.size = 48,
    this.backgroundColor,
    this.borderColor,
  });

  final String glyph;
  final double size;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor ?? c.primarySoft,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor ?? c.borderDefault),
      ),
      child: Text(glyph, style: TextStyle(fontSize: size * 0.58, height: 1)),
    );
  }
}
