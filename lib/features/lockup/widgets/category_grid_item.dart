import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';
import '../models/lookup_category.dart';

class CategoryGridItem extends StatelessWidget {
  final LookupCategory category;

  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return AppSurface(
      radius: AppRadius.mdValue,
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon Container
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: c.primarySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: AppIcon(category.icon, size: ControlSize.iconXl, color: c.iconPrimary),
            ),
          ),
          
          // Texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TypographyTokens.caption(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: c.textPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                category.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10,
                  height: 12 / 10,
                  color: c.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}