import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/design_system/design_system.dart';

import '../models/microbiology_result.dart';

/// One selectable "thuốc + đường dùng" row: checkbox control, 'S'
/// susceptibility badge, drug name and route · dosage line.
class TreatmentOptionRowWidget extends StatelessWidget {
  const TreatmentOptionRowWidget({
    super.key,
    required this.option,
    required this.selected,
    required this.onToggle,
  });

  final TreatmentOption option;
  final bool selected;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Material(
      color: selected ? c.primarySoft : c.surface,
      borderRadius: AppRadius.sm,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onToggle,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.group,
            vertical: Spacing.control - 2,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.sm,
            border: Border.all(color: c.borderSubtle),
          ),
          child: Row(
            children: [
              // Checkbox control — same visual language as the wizard's
              // selection rows.
              Container(
                width: ControlSize.touchTargetMin - 20,
                height: ControlSize.touchTargetMin - 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected ? c.primary : c.surfaceSecondary,
                  borderRadius: BorderRadius.circular(8),
                  border: selected
                      ? null
                      : Border.all(color: c.borderSubtle),
                ),
                child: selected
                    ? Icon(LucideIcons.check,
                        size: ControlSize.iconSm, color: c.onPrimary)
                    : null,
              ),
              const SizedBox(width: Spacing.control),
              _SusceptibilityBadge(
                letter: option.susceptibility.letter,
              ),
              const SizedBox(width: Spacing.control),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      option.drug,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyTokens.caption(context)
                          .copyWith(color: c.textPrimary),
                    ),
                    const SizedBox(height: Spacing.xxxs),
                    AppText(
                      '${option.route} · ${option.dosage}',
                      type: AppTextType.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SusceptibilityBadge extends StatelessWidget {
  const _SusceptibilityBadge({required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final color = switch (letter) {
      'S' => c.success,
      'I' => c.warning,
      _ => c.error,
    };

    return Container(
      width: ControlSize.touchTargetMin - 14,
      height: ControlSize.touchTargetMin - 14,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: c.successSoft, shape: BoxShape.circle),
      child: Text(
        letter,
        style: TypographyTokens.label(context).copyWith(color: color),
      ),
    );
  }
}
