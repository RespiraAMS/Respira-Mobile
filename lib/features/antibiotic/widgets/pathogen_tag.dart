import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';

class PathogenTag extends StatelessWidget {
  final String label;
  final Color bg;
  final Color color;
  
  const PathogenTag(
    this.label, {
    super.key, 
    required this.bg, 
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(color: bg, borderRadius: AppRadius.full),
      child: AppText(label, type: AppTextType.label, color: color),
    );
  }
}