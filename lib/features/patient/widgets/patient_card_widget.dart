import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/design_system/design_system.dart';

import '../models/patient_summary.dart';

/// One roster card: glyph avatar · identity · status dot + label · chevron.
/// Identity hierarchy above metadata (§09.5); status is dot + text (§12).
class PatientCardWidget extends StatelessWidget {
  const PatientCardWidget({
    super.key,
    required this.patient,
    required this.onTap,
  });

  final PatientSummary patient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    final dotColor = switch (patient.status) {
      PatientStatus.treating => c.warning,
      PatientStatus.deceased => c.error,
      PatientStatus.recovered => c.success,
    };

    return Material(
      color: c.surface,
      borderRadius: AppRadius.md,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.group,
            vertical: Spacing.control,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.md,
            border: Border.all(color: c.borderSubtle),
          ),
          child: Row(
            children: [
              AvatarGlyphWidget(
                // Offline-safe glyph instead of the template's network
                // placeholders; derived from gender.
                glyph: patient.genderLabel == 'Nữ' ? '👩🏾' : '👨🏻',
                size: ControlSize.touchTargetMin,
              ),
              const SizedBox(width: Spacing.group),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      patient.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyTokens.body(context)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: Spacing.xxxs),
                    AppText(
                      '${patient.code} · ${patient.genderLabel} · '
                      '${patient.age} tuổi',
                      type: AppTextType.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: Spacing.xxxs),
                    Row(
                      children: [
                        Container(
                          width: 7,
                          height: 7,
                          decoration:
                              BoxDecoration(color: dotColor, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: Spacing.xxxs + 2),
                        Text(
                          patient.status.displayName,
                          style: TypographyTokens.label(context)
                              .copyWith(color: c.textPrimary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(LucideIcons.chevronRight,
                  size: ControlSize.iconSm, color: c.iconMuted),
            ],
          ),
        ),
      ),
    );
  }
}
