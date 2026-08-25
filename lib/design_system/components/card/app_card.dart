import 'package:flutter/material.dart';

import '../../theme/theme_extensions.dart';
import '../../primitives/app_surface.dart';
import '../../tokens/radius.dart';

/// Grouped card for 2–6 related rows (§09.3): radius 24, flat surface,
/// optional 1px dividers between rows. Never gradient, never elevation.
class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child, this.padding})
      : _dividedChildren = null;

  /// Convenience constructor that separates rows with 1px subtle dividers.
  const AppCard.divided(
    List<Widget> children, {
    super.key,
    this.padding,
  })  : child = null,
        _dividedChildren = children;

  final Widget? child;
  final List<Widget>? _dividedChildren;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final divided = _dividedChildren;
    final Widget body;

    if (divided != null) {
      final dividerColor = context.respiraColors.borderSubtle;
      body = Column(
        children: [
          for (var i = 0; i < divided.length; i++) ...[
            if (i > 0)
              Container(height: 1, color: dividerColor),
            divided[i],
          ],
        ],
      );
    } else {
      body = child!;
    }

    return AppSurface(radius: AppRadius.lgValue, padding: padding, child: body);
  }
}
