import 'package:flutter/material.dart';

import '../tokens/sizes.dart';
import '../theme/theme_extensions.dart';

/// Icon primitive on the Lucide set (24px base, allowed 16/18/20/22/24).
///
/// Source: RESPIRAAMS_DESIGN_SYSTEM.md · 07 Iconography.
class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.size = ControlSize.iconBase,
    this.color,
    this.semanticLabel,
  });

  final IconData icon;

  /// Must be one of the allowed sizes: 16 / 18 / 20 / 22 / 24.
  final double size;
  final Color? color;

  /// Required for icon-only actions (accessibility rule §12).
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: Icon(icon, size: size, color: color ?? context.respiraColors.iconDefault),
    );
  }
}
