import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

import '../models/statistics_view.dart';

/// Headline KPI tile ("Chẩn đoán · 128 · +12%"): label · value · delta.
class KpiTileWidget extends StatelessWidget {
  const KpiTileWidget({super.key, required this.stat});

  final KpiStat stat;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final deltaText =
        '${stat.deltaPercent >= 0 ? '+' : ''}${stat.deltaPercent}%';
    final deltaColor = stat.deltaPercent >= 0 ? c.success : c.error;

    return Container(
      padding: const EdgeInsets.all(Spacing.control + 2),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: AppRadius.md,
        border: Border.all(color: c.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            stat.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TypographyTokens.label(context)
                .copyWith(color: c.textSecondary),
          ),
          const SizedBox(height: Spacing.xxxs),
          // Scale step closest to the template's 24px within the type scale.
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${stat.value}',
              style: TypographyTokens.h2(context)
                  .copyWith(color: c.textPrimary),
            ),
          ),
          const SizedBox(height: Spacing.xxxs),
          Text(
            deltaText,
            style: TypographyTokens.label(context).copyWith(color: deltaColor),
          ),
        ],
      ),
    );
  }
}
