import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Selectable reason row with checkbox control, title and supporting text.
///
/// Selected state = soft primary container + checked box (§11: never color
/// alone).
class SelectionRowWidget extends StatelessWidget {
  const SelectionRowWidget({
    super.key,
    required this.title,
    required this.description,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Material(
      color: selected ? c.primarySoft : c.surface,
      borderRadius: AppRadius.sm,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints:
              const BoxConstraints(minHeight: ControlSize.rowHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.control,
            vertical: Spacing.control,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.sm,
            border: Border.all(color: c.borderSubtle),
          ),
          child: Row(
            children: [
              _CheckboxControl(selected: selected),
              const SizedBox(width: Spacing.control),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyTokens.body(context)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: Spacing.xxxs),
                    AppText(
                      description,
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

class _CheckboxControl extends StatelessWidget {
  const _CheckboxControl({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    // Component-level corner radius (8px on a 24px control); raw overrides
    // are allowed inside component implementations (§17 Rules).
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? c.primary : c.surfaceSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: selected
          ? Icon(LucideIcons.check,
              size: ControlSize.iconMd, color: c.onPrimary)
          : null,
    );
  }
}
