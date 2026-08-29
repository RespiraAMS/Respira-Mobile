import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../models/antibiotic_group.dart';

class AntibioticGroupDetailScreen extends StatelessWidget {
  final AntibioticGroup group;

  const AntibioticGroupDetailScreen({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final subtitleText = group.parentName != null 
        ? 'Nhóm kháng sinh · ${group.parentName}' 
        : 'Nhóm kháng sinh';

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
              child: AppAppBar(
                title: group.name,
                subtitle: subtitleText,
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(Spacing.group, 8, Spacing.group, Spacing.screen),
                children: [
                  Container(
                    padding: const EdgeInsets.all(Spacing.block),
                    decoration: BoxDecoration(
                      color: c.primarySoft,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 52, height: 52,
                          decoration: BoxDecoration(color: c.surface, shape: BoxShape.circle),
                          child: Icon(LucideIcons.layers, color: c.iconPrimary, size: 24),
                        ),
                        const SizedBox(width: Spacing.control),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(group.name, type: AppTextType.h3, fontWeight: FontWeight.w700),
                              const SizedBox(height: 4),
                              AppText(subtitleText, type: AppTextType.caption),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Thông tin nhóm', type: AppTextType.button, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  AppCard.divided(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    [
                      _InfoRow(label: 'Nhóm cha', value: group.parentName ?? 'Không có'),
                      const _InfoRow(label: 'Mô tả', value: 'Kháng sinh phổ rộng'), // Hardcode mô tả theo figma
                    ],
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Kháng sinh trong nhóm', type: AppTextType.button, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  AppCard.divided(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    const [
                      _DrugListRow(title: 'Ceftriaxone', subtitle: 'Cephalosporin thế hệ 3'),
                      _DrugListRow(title: 'Cefotaxime', subtitle: 'Cephalosporin thế hệ 3'),
                      _DrugListRow(title: 'Ceftazidime', subtitle: 'Tăng hoạt tính với Pseudomonas'),
                    ],
                  ),
                  const SizedBox(height: Spacing.screen),

                  AppButton(
                    label: 'Xem danh sách kháng sinh',
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

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(label, type: AppTextType.label, color: context.respiraColors.textSecondary),
          AppText(value, type: AppTextType.label, color: context.respiraColors.textPrimary),
        ],
      ),
    );
  }
}

class _DrugListRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const _DrugListRow({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(title, type: AppTextType.label, color: context.respiraColors.textPrimary),
          const SizedBox(height: 2),
          AppText(subtitle, type: AppTextType.label, color: context.respiraColors.textSecondary, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}