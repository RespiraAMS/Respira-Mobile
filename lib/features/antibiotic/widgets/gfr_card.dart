import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';

class GfrCard extends StatelessWidget {
  final String title;
  final String sub;
  final String tag;
  final Color tagBg;
  final Color tagColor;
  
  const GfrCard({
    super.key, 
    required this.title, 
    required this.sub, 
    required this.tag, 
    required this.tagBg, 
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppSurface(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(title, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
              const SizedBox(height: 4),
              AppText(sub, type: AppTextType.caption),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: tagBg, borderRadius: AppRadius.full),
            child: AppText(tag, type: AppTextType.label, color: tagColor),
          ),
        ],
      ),
    );
  }
}