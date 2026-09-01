import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../../antibiograms/models/antibiogram.dart';
import '../models/pathogen.dart';
import '../providers/pathogen_provider.dart';

class PathogenDetailScreen extends StatefulWidget {
  final Pathogen pathogen;

  const PathogenDetailScreen({super.key, required this.pathogen});

  @override
  State<PathogenDetailScreen> createState() => _PathogenDetailScreenState();
}

class _PathogenDetailScreenState extends State<PathogenDetailScreen> {
  late Future<List<Antibiogram>> _antibiogramsFuture;

  @override
  void initState() {
    super.initState();
    _antibiogramsFuture = context
        .read<PathogenProvider>()
        .fetchPathogenAntibiograms(widget.pathogen.id);
  }

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
                title: widget.pathogen.name,
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
                              AppText(widget.pathogen.name, type: AppTextType.h3, fontWeight: FontWeight.w700),
                              const SizedBox(height: 4),
                              AppText('Tác nhân gây bệnh', type: AppTextType.caption),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Mô tả', type: AppTextType.button, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  AppText(
                    widget.pathogen.description,
                    type: AppTextType.body,
                    color: c.textPrimary,
                  ),
                  const SizedBox(height: Spacing.section),

                  AppText('Độ nhạy tham khảo', type: AppTextType.button, fontWeight: FontWeight.w700),
                  const SizedBox(height: Spacing.control),
                  FutureBuilder<List<Antibiogram>>(
                    future: _antibiogramsFuture,
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
                        return AppText('Không tải được dữ liệu độ nhạy', color: c.error);
                      }

                      final antibiograms = snapshot.data ?? [];
                      if (antibiograms.isEmpty) {
                        return AppText('Chưa có dữ liệu độ nhạy cho tác nhân này', color: c.textSecondary);
                      }

                      final List<Widget> susceptibilityRows = [];
                      for (final antibiogram in antibiograms) {
                        final String shortValue = antibiogram.micLevel.isNotEmpty
                            ? antibiogram.micLevel[0].toUpperCase()
                            : '?';

                        for (final mic in antibiogram.mics) {
                          susceptibilityRows.add(
                            _SusceptibilityRow(label: mic.name, value: shortValue),
                          );
                        }
                      }

                      if (susceptibilityRows.isEmpty) {
                         return AppText('Chưa có dữ liệu MICs', color: c.textSecondary);
                      }

                      return AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        susceptibilityRows,
                      );
                    },
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
    
    final Color valueColor = value == 'S' 
        ? c.success 
        : value == 'I' 
            ? c.warning 
            : c.error;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AppText(label, type: AppTextType.label, color: c.textSecondary),
          ),
          AppText(value, type: AppTextType.label, color: valueColor, fontWeight: FontWeight.w600),
        ],
      ),
    );
  }
}