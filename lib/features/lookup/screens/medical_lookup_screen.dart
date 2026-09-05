import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../providers/lookup_data_provider.dart';
import '../widgets/category_grid_item.dart';
import '../widgets/floating_bottom_nav.dart';
import '../widgets/lookup_search_field.dart';
import '../widgets/recent_lookup_tile.dart';

class MedicalLookupScreen extends StatelessWidget {
  const MedicalLookupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Scaffold(
      backgroundColor: c.background, // #F7F9F9
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.fromLTRB(Spacing.group, 22, Spacing.group, 120),
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: AppIcon(LucideIcons.menu, size: 24, color: c.iconDefault),
                      ),
                    ),
                    const SizedBox(width: Spacing.control),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText('Tra cứu', type: AppTextType.h3),
                          const SizedBox(height: 2),
                          AppText('Tài liệu y tế dành cho bác sĩ', type: AppTextType.caption),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.screen),

                const LookupSearchField(),
                const SizedBox(height: Spacing.section),

                Text(
                  'Danh mục',
                  style: TypographyTokens.bodyLarge(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: c.textPrimary,
                  ),
                ),
                const SizedBox(height: Spacing.control),
                
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 171 / 112, // Tỷ lệ từ Figma
                  ),
                  itemCount: LookupDataProvider.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryGridItem(
                      category: LookupDataProvider.categories[index],
                    );
                  },
                ),
                const SizedBox(height: Spacing.section),

                Text(
                  'Đã xem gần đây',
                  style: TypographyTokens.bodyLarge(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: c.textPrimary,
                  ),
                ),
                const SizedBox(height: Spacing.control),

                ...LookupDataProvider.recentItems.map((item) => RecentLookupTile(item: item)),
              ],
            ),

            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(child: FloatingBottomNav()),
            ),
          ],
        ),
      ),
    );
  }
}