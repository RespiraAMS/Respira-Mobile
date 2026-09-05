import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  
  const DetailRow({
    super.key, 
    required this.label, 
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(label, type: AppTextType.caption, fontWeight: FontWeight.w600),
          const SizedBox(width: Spacing.group),
          Expanded(
            child: AppText(
              value, 
              type: AppTextType.label, 
              color: context.respiraColors.textPrimary,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}