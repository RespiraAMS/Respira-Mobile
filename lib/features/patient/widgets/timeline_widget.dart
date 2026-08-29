import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// One treatment milestone shown on the progress timeline.
class TreatmentTimelineEntry {
  const TreatmentTimelineEntry({
    required this.dateLabel,
    required this.title,
    required this.status,
  });

  /// e.g. "Hôm nay", "03/08".
  final String dateLabel;
  final String title;
  final String status;
}

/// Vertical timeline (§16 Data · Timeline): primary dots joined by a subtle
/// connector, content hierarchy date → title → status.
class TimelineWidget extends StatelessWidget {
  const TimelineWidget({super.key, required this.entries});

  final List<TreatmentTimelineEntry> entries;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        for (var i = 0; i < entries.length; i++)
          _TimelineItem(entry: entries[i], isLast: i == entries.length - 1),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({required this.entry, required this.isLast});

  /// Rail column width — matches the dot diameter so the connector
  /// stays centered under it.
  static const double _railWidth = 10;

  final TreatmentTimelineEntry entry;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: _railWidth,
            child: Column(
              children: [
                // Aligns the dot with the first text line.
                const SizedBox(height: 5),
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: c.primary,
                    border: Border.all(color: c.background),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: c.borderSubtle),
                  ),
              ],
            ),
          ),
          const SizedBox(width: Spacing.control),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : Spacing.block),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(entry.dateLabel,
                      type: AppTextType.label, color: c.primary),
                  const SizedBox(height: Spacing.xxxs),
                  Text(
                    entry.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TypographyTokens.body(context)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: Spacing.xxxs),
                  AppText(entry.status, type: AppTextType.caption),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
