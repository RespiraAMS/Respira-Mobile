import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/design_system/design_system.dart';

import '../models/calculator.dart';

/// One calculator row of the 'Công cụ thường dùng' list: grid icon tile,
/// title + description, chevron.
class CalculatorEntryRowWidget extends StatelessWidget {
  const CalculatorEntryRowWidget({
    super.key,
    required this.calculator,
    required this.onTap,
  });

  final CalculatorId calculator;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Material(
      color: c.surface,
      borderRadius: AppRadius.md,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: ControlSize.touchTargetMin + 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.group,
            vertical: Spacing.control - 2,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.md,
            border: Border.all(color: c.borderSubtle),
          ),
          child: Row(
            children: [
              Container(
                width: ControlSize.touchTargetMin - 4,
                height: ControlSize.touchTargetMin - 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: c.primarySoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(LucideIcons.layoutGrid,
                    size: ControlSize.iconMd, color: c.iconPrimary),
              ),
              const SizedBox(width: Spacing.group),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      calculator.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyTokens.bodyMedium(context)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: Spacing.xxxs),
                    AppText(
                      calculator.description,
                      type: AppTextType.caption,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
