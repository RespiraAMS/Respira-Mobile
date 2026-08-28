import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// One guideline reference row (icon tile + source + detail + chevron).
/// Rows are grouped via [AppCard.divided].
class ReferenceRowWidget extends StatelessWidget {
  const ReferenceRowWidget({
    super.key,
    required this.source,
    required this.detail,
  });

  final String source;
  final String detail;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      constraints: const BoxConstraints(minHeight: ControlSize.rowHeight),
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.group,
        vertical: Spacing.control,
      ),
      child: Row(
        children: [
          Container(
            width: ControlSize.touchTargetMin - 4,
            height: ControlSize.touchTargetMin - 4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: c.primarySoft,
              borderRadius: BorderRadius.circular(AppRadius.smValue),
            ),
            child: Icon(LucideIcons.bookOpen,
                size: ControlSize.iconMd, color: c.primary),
          ),
          const SizedBox(width: Spacing.control),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  source,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TypographyTokens.bodyMedium(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: Spacing.xxxs),
                AppText(detail, type: AppTextType.caption, maxLines: 1),
              ],
            ),
          ),
          Icon(LucideIcons.chevronRight,
              size: ControlSize.iconSm, color: c.iconMuted),
        ],
      ),
    );
  }
}
