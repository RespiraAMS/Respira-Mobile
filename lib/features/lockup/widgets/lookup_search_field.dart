import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';

class LookupSearchField extends StatelessWidget {
  const LookupSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      height: ControlSize.inputDefault,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
      decoration: BoxDecoration(
        color: c.surfaceSecondary, // #EFF3F4
        borderRadius: AppRadius.full, // 999px
        border: Border.all(color: c.borderSubtle),
      ),
      child: Row(
        children: [
          AppIcon(LucideIcons.search, size: ControlSize.iconLg, color: c.iconDefault),
          const SizedBox(width: Spacing.control),
          Expanded(
            child: Text(
              'Tìm thuốc, vi khuẩn, bệnh lý...',
              style: TypographyTokens.bodyMedium(context).copyWith(
                color: c.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}