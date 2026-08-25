import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../primitives/app_text.dart';
import '../tokens/radius.dart';
import '../tokens/sizes.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';
import '../theme/theme_extensions.dart';

/// Clinical severity states (§02 Semantic states / §10 ClinicalAlert).
enum ClinicalSeverity { info, stable, needsAttention, highRisk }

/// Static clinical alert: severity conveyed by label + icon + color
/// (never color alone §12). No animation on clinical alerts (§13).
class ClinicalAlert extends StatelessWidget {
  const ClinicalAlert({
    super.key,
    required this.severity,
    required this.title,
    this.description,
  });

  final ClinicalSeverity severity;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    final (Color softBg, Color strongFg, IconData icon) = switch (severity) {
      ClinicalSeverity.info => (c.infoSoft, c.info, LucideIcons.info),
      ClinicalSeverity.stable =>
        (c.successSoft, c.success, LucideIcons.checkCircle2),
      ClinicalSeverity.needsAttention =>
        (c.warningSoft, c.warning, LucideIcons.alertTriangle),
      ClinicalSeverity.highRisk =>
        (c.errorSoft, c.error, LucideIcons.alertOctagon),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.group,
        vertical: Spacing.control,
      ),
      decoration: BoxDecoration(
        color: softBg,
        borderRadius: AppRadius.md,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, size: ControlSize.iconSm, color: strongFg),
          ),
          const SizedBox(width: Spacing.control),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TypographyTokens.bodyMedium(context)
                      .copyWith(fontWeight: FontWeight.w600, color: c.textPrimary),
                ),
                if (description != null) ...[
                  const SizedBox(height: 3),
                  AppText(description!, type: AppTextType.caption),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
