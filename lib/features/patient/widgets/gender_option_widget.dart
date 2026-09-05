import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Gender choice option ("Nam" / "Nữ") with a radio control.
///
/// Selected state = soft primary container + filled radio dot (§11).
class GenderOptionWidget extends StatelessWidget {
  const GenderOptionWidget({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Expanded(
      child: Material(
        color: selected ? c.primarySoft : c.surface,
        borderRadius: AppRadius.sm,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: ControlSize.touchTargetMin,
            padding:
                const EdgeInsets.symmetric(horizontal: Spacing.xxs),
            decoration: BoxDecoration(
              borderRadius: AppRadius.sm,
              border: Border.all(color: c.borderSubtle),
            ),
            child: Row(
              children: [
                _RadioControl(selected: selected),
                const SizedBox(width: Spacing.xxxs),
                Flexible(
                  child: AppText(
                    label,
                    type: AppTextType.label,
                    color: c.textPrimary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadioControl extends StatelessWidget {
  const _RadioControl({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? c.primary : c.surfaceSecondary,
      ),
      child: selected
          ? Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: c.onPrimary,
              ),
            )
          : null,
    );
  }
}
