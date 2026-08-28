import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Semantic status pill ("Nguy cơ cao"): dot + label — never color alone
/// (§12). [isHigh] picks the warning pair; otherwise the success pair.
class RiskPillWidget extends StatelessWidget {
  const RiskPillWidget({
    super.key,
    required this.label,
    required this.isHigh,
  });

  final String label;
  final bool isHigh;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.control,
        vertical: Spacing.xxs - 4,
      ),
      decoration: BoxDecoration(
        color: isHigh ? c.warningSoft : c.successSoft,
        borderRadius: AppRadius.full,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isHigh ? c.warning : c.success,
            ),
          ),
          const SizedBox(width: Spacing.inline),
          Text(
            label,
            style: TypographyTokens.label(context)
                .copyWith(color: c.textPrimary),
          ),
        ],
      ),
    );
  }
}
