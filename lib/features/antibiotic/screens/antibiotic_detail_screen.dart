import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../models/antibiotic.dart';
import '../widgets/detail_row.dart';
import '../widgets/gfr_card.dart';
import '../widgets/pathogen_tag.dart';

class AntibioticDetailScreen extends StatelessWidget {
  final Antibiotic antibiotic;

  const AntibioticDetailScreen({super.key, required this.antibiotic});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
              child: AppAppBar(
                title: antibiotic.name,
                subtitle: 'Thông tin kháng sinh',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(Spacing.group, 8, Spacing.group, Spacing.screen),
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                    decoration: BoxDecoration(
                      color: c.primarySoft,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 56, height: 56,
                          decoration: BoxDecoration(color: c.surface, shape: BoxShape.circle),
                          child: Icon(LucideIcons.pill, color: c.iconPrimary, size: 24),
                        ),
                        const SizedBox(height: Spacing.group),
                        AppText(antibiotic.name, type: AppTextType.h3, fontWeight: FontWeight.w700),
                        const SizedBox(height: 4),
                        AppText(antibiotic.groupName, type: AppTextType.caption),
                        const SizedBox(height: Spacing.control),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(color: c.surface, borderRadius: AppRadius.full),
                          child: AppText('Kháng sinh', type: AppTextType.label, color: c.primary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Liều dùng', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  AppCard.divided(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    const [
                      DetailRow(label: 'Đường dùng', value: 'Tiêm tĩnh mạch'),
                      DetailRow(label: 'Liều chuẩn', value: '2 g mỗi 24 giờ'),
                      DetailRow(label: 'Liều tối đa', value: '4 g/ngày'),
                    ],
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Điều chỉnh theo GFR', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  GfrCard(title: 'GFR ≥ 50 mL/phút', sub: 'Dùng liều chuẩn', tag: 'Chuẩn', tagBg: c.successSoft, tagColor: c.success),
                  const SizedBox(height: Spacing.control),
                  GfrCard(title: 'GFR 10–49 mL/phút', sub: 'Theo dõi chức năng thận', tag: 'Theo dõi', tagBg: c.warningSoft, tagColor: c.warning),
                  const SizedBox(height: Spacing.control),
                  GfrCard(title: 'GFR < 10 mL/phút', sub: 'Tối đa 2 g/ngày', tag: 'Giảm liều', tagBg: c.errorSoft, tagColor: c.error),
                  const SizedBox(height: Spacing.section),

                  AppText('Tác nhân nhạy cảm', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  AppSurface(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(
                      spacing: 8, runSpacing: 8,
                      children: [
                        PathogenTag('S. pneumoniae', bg: c.successSoft, color: c.success),
                        PathogenTag('H. influenzae', bg: c.successSoft, color: c.success),
                        PathogenTag('Enterobacterales', bg: c.warningSoft, color: c.warning),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.screen),

                  AppButton(
                    label: 'Xem phác đồ liên quan',
                    expand: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}