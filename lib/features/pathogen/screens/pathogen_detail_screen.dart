import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../models/pathogen.dart';

class PathogenDetailScreen extends StatelessWidget {
  final Pathogen pathogen;

  const PathogenDetailScreen({super.key, required this.pathogen});

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
                title: pathogen.name,
                subtitle: 'Tác nhân gây bệnh',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(Spacing.group, 8, Spacing.group, Spacing.screen),
                children: [
                  // 1. Hero Card
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
                          child: Icon(LucideIcons.bug, color: c.iconPrimary, size: 24),
                        ),
                        const SizedBox(width: Spacing.control),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(pathogen.name, type: AppTextType.h3, fontWeight: FontWeight.w700),
                              const SizedBox(height: 4),
                              AppText('Tác nhân gây bệnh', type: AppTextType.caption),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.section),

                  // 2. Bệnh thường gặp
                  AppText('Bệnh thường gặp', type: AppTextType.button, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  AppText(
                    pathogen.description,
                    type: AppTextType.body,
                    color: c.textPrimary,
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Độ nhạy tham khảo (chỗ này dữ liệu cứng)', type: AppTextType.button, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  AppCard.divided(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    const [
                      _SusceptibilityRow(label: 'Meropenem', value: 'S'),
                      _SusceptibilityRow(label: 'Ceftriaxone', value: 'R'),
                      _SusceptibilityRow(label: 'Amikacin', value: 'S'),
                    ],
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

class _SusceptibilityRow extends StatelessWidget {
  final String label;
  final String value;
  const _SusceptibilityRow({required this.label, required this.value});

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