import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';

class MicListRow extends StatelessWidget {
  final String name, mic, result;

  const MicListRow({
    super.key,
    required this.name,
    required this.mic,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: c.surface, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(color: c.primarySoft, borderRadius: BorderRadius.circular(12)),
            child: Icon(LucideIcons.pill, color: c.iconPrimary, size: 20),
          ),
          const SizedBox(width: Spacing.control),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                const SizedBox(height: 2),
                AppText(mic, type: AppTextType.label, color: c.textSecondary),
              ],
            ),
          ),
          AppText(result, type: AppTextType.label, color: c.textSecondary, fontWeight: FontWeight.w700),
        ],
      ),
    );
  }
}