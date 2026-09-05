import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

import '../models/statistics_view.dart';

/// "Chẩn đoán theo tuần" chart card: bottom-aligned primary bars whose
/// heights are proportional to the max value — pure Flutter, no chart
/// dependency. 200ms height animation on period switches (§13 Default).
class WeeklyBarsWidget extends StatelessWidget {
  const WeeklyBarsWidget({super.key, required this.bars});

  static const double _chartAreaHeight = 116;

  final List<WeeklyBar> bars;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final maxValue = bars.map((b) => b.value).fold<int>(1, (a, b) => a > b ? a : b);

    return Container(
      height: 180,
      padding: const EdgeInsets.fromLTRB(
        Spacing.group,
        Spacing.group,
        Spacing.group,
        Spacing.control,
      ),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: AppRadius.md,
        border: Border.all(color: c.borderSubtle),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (final bar in bars) ...[
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    width: 28,
                    height:
                        (bar.value / maxValue) * _chartAreaHeight,
                    decoration: BoxDecoration(
                      color: c.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: Spacing.inline),
                  Text(
                    bar.label,
                    maxLines: 1,
                    style: TypographyTokens.label(context)
                        .copyWith(color: c.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
