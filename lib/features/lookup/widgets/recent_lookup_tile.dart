import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';
import '../models/recent_item.dart';

class RecentLookupTile extends StatelessWidget {
  final RecentItem item;

  const RecentLookupTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.control),
      padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: Spacing.control),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.borderSubtle),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TypographyTokens.caption(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: c.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 10, color: c.textSecondary),
                ),
              ],
            ),
          ),
          // Tag / Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: c.primarySoft,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              item.tag,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: c.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}