import 'package:flutter/material.dart';

import '../tokens/radius.dart';
import '../theme/theme_extensions.dart';

/// Flat surface primitive: solid fill, muted border, no gradient/elevation.
///
/// Nested information should step down through
/// surface → surface-secondary → surface-tertiary (§09.3).
class AppSurface extends StatelessWidget {
  const AppSurface({
    super.key,
    required this.child,
    this.radius = AppRadius.lgValue,
    this.color,
    this.borderColor,
    this.padding,
  });

  final Widget child;
  final double radius;
  final Color? color;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? c.surface,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor ?? c.borderSubtle),
      ),
      child: child,
    );
  }
}
