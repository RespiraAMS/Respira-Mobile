import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Card for one recommended medicine: pill icon tile + name + regimen line.
class MedicineCardWidget extends StatelessWidget {
  const MedicineCardWidget({super.key, required this.name, required this.regimenLine});

  final String name;
  final String regimenLine;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return AppSurface(
      radius: AppRadius.mdValue,
      padding: const EdgeInsets.all(Spacing.control + 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: ControlSize.touchTargetMin - 4,
            height: ControlSize.touchTargetMin - 4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: c.primarySoft,
              borderRadius: BorderRadius.circular(AppRadius.smValue),
            ),
            child:
                Icon(LucideIcons.pill, size: ControlSize.iconLg, color: c.primary),
          ),
          const SizedBox(height: Spacing.control),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                TypographyTokens.caption(context).copyWith(color: c.textPrimary),
          ),
          const SizedBox(height: Spacing.xxxs),
          Text(
            regimenLine,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TypographyTokens.caption(context)
                .copyWith(fontSize: 11, color: c.textSecondary),
          ),
        ],
      ),
    );
  }
}
