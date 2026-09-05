import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Triage filter chip ("Tất cả · 12"). Selected = soft-primary surface +
/// primary label; idle = white surface with the semantic content color.
class StatusFilterChipWidget extends StatelessWidget {
  const StatusFilterChipWidget({
    super.key,
    required this.label,
    required this.count,
    required this.contentColor,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final int count;
  final Color contentColor;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Material(
      color: selected ? c.primarySoft : c.surface,
      // Component-level corner radius (template 18px, between sm and md);
      // raw values are allowed inside component implementations (§17).
      borderRadius: BorderRadius.circular(18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          // DS floor for touch targets (§12) — bumped from the template's 36.
          constraints: const BoxConstraints(
            minHeight: ControlSize.touchTargetMin,
          ),
          padding: const EdgeInsets.symmetric(horizontal: Spacing.control + 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: c.borderSubtle),
          ),
          alignment: Alignment.center,
          child: Text(
            '$label · $count',
            maxLines: 1,
            style: TypographyTokens.label(context).copyWith(
              color: selected ? c.primary : contentColor,
            ),
          ),
        ),
      ),
    );
  }
}
