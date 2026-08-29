import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// One password rule row: status dot + label. Met rules show a success
/// dot with check icon (label + color, never color alone §12).
class PasswordRequirementWidget extends StatelessWidget {
  const PasswordRequirementWidget({
    super.key,
    required this.label,
    required this.met,
  });

  final String label;
  final bool met;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Row(
      children: [
        Container(
          width: ControlSize.iconBase,
          height: ControlSize.iconBase,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: met ? c.successSoft : c.surfaceSecondary,
          ),
          child: met
              ? Icon(LucideIcons.check,
                  size: ControlSize.iconSm, color: c.success)
              : null,
        ),
        const SizedBox(width: Spacing.control),
        Expanded(
          child: Text(
            label,
            style:
                TypographyTokens.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w500,
              color: c.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
