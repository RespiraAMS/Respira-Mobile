import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../../antibiotic/models/antibiotic.dart';
import '../models/antibiotic_group.dart';
import '../providers/antibiotic_group_provider.dart';

class AntibioticGroupDetailScreen extends StatefulWidget {
  final AntibioticGroup group;

  const AntibioticGroupDetailScreen({super.key, required this.group});

  @override
  State<AntibioticGroupDetailScreen> createState() => _AntibioticGroupDetailScreenState();
}

class _AntibioticGroupDetailScreenState extends State<AntibioticGroupDetailScreen> {
  late Future<List<Antibiotic>> _antibioticsFuture;

  @override
  void initState() {
    super.initState();
    _antibioticsFuture = context
        .read<AntibioticGroupProvider>()
        .fetchAntibioticsByGroupId(widget.group.id);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final subtitleText = widget.group.parentName != null 
        ? 'Nhóm kháng sinh · ${widget.group.parentName}' 
        : 'Nhóm kháng sinh';

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
              child: AppAppBar(
                title: widget.group.name,
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
                              AppText(widget.group.name, type: AppTextType.h3, fontWeight: FontWeight.w700),
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
                      _InfoRow(label: 'Nhóm cha', value: widget.group.parentName ?? 'Không có'),
                      _InfoRow(label: 'Mô tả', value: widget.group.description ?? 'Không có dữ liệu'),
                    ],
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Kháng sinh trong nhóm', type: AppTextType.button, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  FutureBuilder<List<Antibiotic>>(
                    future: _antibioticsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      
                      if (snapshot.hasError) {
                        return AppText('Không tải được dữ liệu', color: c.error);
                      }

                      final antibiotics = snapshot.data ?? [];
                      if (antibiotics.isEmpty) {
                        return AppText('Chưa có kháng sinh nào trong nhóm này', color: c.textSecondary);
                      }

                      return AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        antibiotics.map((a) => _DrugListRow(
                          title: a.name, 
                          subtitle: 'Phân loại: ${a.classification}'
                        )).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: Spacing.screen),
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
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          AppText(
            label, 
            type: AppTextType.label, 
            color: context.respiraColors.textSecondary,
          ),
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

class _DrugListRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const _DrugListRow({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText(title, type: AppTextType.label, color: context.respiraColors.textPrimary),
          const SizedBox(height: 2),
          AppText(subtitle, type: AppTextType.label, color: context.respiraColors.textSecondary, fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}