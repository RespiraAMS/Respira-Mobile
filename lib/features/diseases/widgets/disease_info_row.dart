import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';

class DiseaseInfoRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;

  const DiseaseInfoRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                const SizedBox(height: 2),
                AppText(subtitle, type: AppTextType.label, color: c.textSecondary),
              ],
            ),
          ),
          const SizedBox(width: Spacing.control),
          AppText(value, type: AppTextType.label, color: c.textSecondary, textAlign: TextAlign.right),
        ],
      ),
    );
  }
}

class DiseaseSimpleRow extends StatelessWidget {
  final String title;

  const DiseaseSimpleRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: AppText(title, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
    );
  }
}