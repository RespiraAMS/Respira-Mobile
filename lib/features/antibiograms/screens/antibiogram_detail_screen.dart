import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../models/antibiogram.dart';

import '../widgets/info_row_with_icon.dart';
import '../widgets/result_accordion.dart';
import '../widgets/mic_list_row.dart';
import '../widgets/treatment_card.dart';

class AntibiogramDetailScreen extends StatelessWidget {
  final Antibiogram antibiogram;

  const AntibiogramDetailScreen({super.key, required this.antibiogram});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    
    final parts = antibiogram.pathogen.name.split(' ');
    final shortName = parts.length > 1 ? '${parts[0][0]}. ${parts.sublist(1).join(' ')}' : antibiogram.pathogen.name;

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
              child: AppAppBar(
                title: 'Kháng sinh đồ',
                subtitle: '$shortName · MIC có chọn lọc',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(Spacing.group, 8, Spacing.group, Spacing.screen),
                children: [
                  Container(
                    padding: const EdgeInsets.all(Spacing.block),
                    decoration: BoxDecoration(color: c.primarySoft, borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 52, height: 52,
                          decoration: BoxDecoration(color: c.surface, shape: BoxShape.circle),
                          child: Icon(LucideIcons.flaskConical, color: c.iconPrimary, size: 24),
                        ),
                        const SizedBox(width: Spacing.control),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText('Kháng sinh đồ', type: AppTextType.h3, fontWeight: FontWeight.w700),
                              const SizedBox(height: 4),
                              AppText('$shortName · MIC có chọn lọc', type: AppTextType.caption),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Thông tin xét nghiệm', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  AppCard.divided(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    [
                      InfoRowWithIcon(icon: LucideIcons.flaskConical, label: 'Vi khuẩn phân lập', title: 'Tác nhân', value: antibiogram.pathogen.name),
                      InfoRowWithIcon(icon: LucideIcons.activity, label: 'Mức độ nhạy cảm', title: 'MIC level', value: antibiogram.micLevel),
                    ],
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Kết quả', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  
                  ResultAccordion(
                    title: 'Đề kháng thuốc MIC',
                    summary: '${antibiogram.mics.length} kháng sinh',
                    children: antibiogram.mics.map((m) => MicListRow(name: m.name, mic: '', result: '')).toList(),
                  ),
                  const SizedBox(height: Spacing.control),
                  
                  ResultAccordion(
                    title: 'Lựa chọn đầu tay',
                    summary: '${antibiogram.firstPriorityMedicines.length} ưu tiên',
                    children: antibiogram.firstPriorityMedicines.map((m) => TreatmentCard(
                      id: m.id,
                      name: m.name, 
                      note: null
                    )).toList(),
                  ),
                  const SizedBox(height: Spacing.control),

                  ResultAccordion(
                    title: 'Lựa chọn thay thế',
                    summary: '${antibiogram.secondPriorityMedicines.length} lựa chọn',
                    children: antibiogram.secondPriorityMedicines.map((m) => TreatmentCard(
                      id: m.id,
                      name: m.name, 
                      note: null
                    )).toList(),
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