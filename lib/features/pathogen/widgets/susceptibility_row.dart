import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';

class SusceptibilityRow extends StatelessWidget {
  final String label;
  final String value;
  const SusceptibilityRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(label, type: AppTextType.label, color: c.textSecondary),
          AppText(value, type: AppTextType.label, color: c.textPrimary, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}