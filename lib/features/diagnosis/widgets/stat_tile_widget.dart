import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Value tone of a stat tile, mapped to semantic token pairs.
enum StatTileTone { primary, warning, neutral }

/// Compact metric tile ("CURB-65 · 3"): caption label + bold value on a
/// soft semantic surface.
class StatTileWidget extends StatelessWidget {
  const StatTileWidget({
    super.key,
    required this.label,
    required this.value,
    this.tone = StatTileTone.neutral,
  });

  final String label;
  final String value;
  final StatTileTone tone;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    final (Color bg, Color valueColor) = switch (tone) {
      StatTileTone.primary => (c.primarySoft, c.primary),
      StatTileTone.warning => (c.warningSoft, c.warning),
      StatTileTone.neutral => (c.surfaceSecondary, c.textPrimary),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.control,
        vertical: Spacing.control - 2,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.sm,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TypographyTokens.caption(context)
                .copyWith(color: c.textSecondary),
          ),
          const SizedBox(height: Spacing.xxxs),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              value,
              maxLines: 1,
              style: TypographyTokens.bodyLarge(context)
                  .copyWith(fontWeight: FontWeight.w700, color: valueColor),
            ),
          ),
        ],
      ),
    );
  }
}
