import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';

class InfoRowWithIcon extends StatelessWidget {
  final IconData icon;
  final String label, title, value;

  const InfoRowWithIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(color: c.primarySoft, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: c.iconPrimary, size: 20),
          ),
          const SizedBox(width: Spacing.control),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                const SizedBox(height: 2),
                AppText(label, type: AppTextType.label, color: c.textSecondary),
              ],
            ),
          ),
          AppText(value, type: AppTextType.label, color: c.textSecondary),
        ],
      ),
    );
  }
}