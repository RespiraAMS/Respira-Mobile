import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Section banner inside a criteria card: soft primary pill with a
/// centered caption-weight label.
class CriteriaBannerWidget extends StatelessWidget {
  const CriteriaBannerWidget(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: c.primarySoft,
        borderRadius: AppRadius.sm,
      ),
      child: AppText(
        title,
        type: AppTextType.caption,
        color: c.textPrimary,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
