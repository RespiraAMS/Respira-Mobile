import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Key–value row inside a grouped card (§16 Data · Key-Value Row).
///
/// Dividers between rows are drawn by [AppCard.divided].
class InfoRowWidget extends StatelessWidget {
  const InfoRowWidget({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 44),
      padding: const EdgeInsets.symmetric(vertical: Spacing.control),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: AppText(
              label,
              type: AppTextType.caption,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: Spacing.control),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TypographyTokens.bodyMedium(context)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
