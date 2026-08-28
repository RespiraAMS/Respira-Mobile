import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../models/diagnosis_result.dart';
import '../providers/diagnosis_result_provider.dart';
import '../providers/diagnosis_tab_controller.dart';
import '../widgets/medicine_card_widget.dart';
import '../widgets/reference_row_widget.dart';
import '../widgets/risk_pill_widget.dart';
import '../widgets/stat_tile_widget.dart';

import '../routes.dart';

/// Route `/diagnosis/result` — wizard output with three tabs
/// (result summary · recommended medicines · guideline references).
class DiagnosisResultScreen extends ConsumerWidget {
  const DiagnosisResultScreen({super.key});

  Future<void> _confirmSave(BuildContext context, WidgetRef ref) async {
    final result = ref.read(currentDiagnosisResultProvider);

    final confirmed = await showAppConfirmDialog(
      context,
      icon: LucideIcons.save,
      title: 'Lưu kết quả chẩn đoán?',
      description:
          'Sau khi lưu, nội dung chỉ có thể xem và không được chỉnh sửa trực tiếp.',
      infoLabel: result.confirmationSummaryLabel,
      confirmLabel: 'Xác nhận lưu',
    );

    if (confirmed != true || !context.mounted) return;
    showAppToast(context, 'Đã lưu kết quả chẩn đoán.');
    context.go('/patient/detail');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(currentDiagnosisResultProvider);
    final tab = ref.watch(diagnosisTabControllerProvider);
    final tabController = ref.read(diagnosisTabControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppAppBar(
                        title: 'Kết quả chẩn đoán',
                        subtitle:
                            '${result.modeLabel} · ${result.diagnosisName}',
                        onBack: () =>
                            context.goBackOr(DiagnosisRoutes.otherCriteria),
                      ),
                      const SizedBox(height: Spacing.inline + 4),
                      AppSegmentedTabs<DiagnosisTab>(
                        segments: [
                          for (final t in DiagnosisTab.values) (t, t.label),
                        ],
                        selected: tab,
                        onChanged: tabController.select,
                      ),
                      const SizedBox(height: Spacing.section),
                      switch (tab) {
                        DiagnosisTab.result => _ResultTab(result: result),
                        DiagnosisTab.medicines => _MedicinesTab(
                          medicines: result.medicines,
                        ),
                        DiagnosisTab.references => _ReferencesTab(
                          references: result.references,
                        ),
                      },
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Spacing.block,
                          bottom: Spacing.lg,
                        ),
                        child: AppButton(
                          label: 'Lưu kết quả',
                          expand: true,
                          onPressed: () => _confirmSave(context, ref),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TypographyTokens.bodyLarge(
        context,
      ).copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _ResultTab extends StatelessWidget {
  const _ResultTab({required this.result});

  final DiagnosisResult result;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('Chẩn đoán'),
        const SizedBox(height: Spacing.xxs + 4),
        AppSurface(
          radius: AppRadius.mdValue,
          color: c.surfaceSecondary,
          borderColor: Colors.transparent,
          padding: const EdgeInsets.all(Spacing.group - 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                result.diagnosisName,
                style: TypographyTokens.h3(
                  context,
                ).copyWith(color: c.textPrimary),
              ),
              const SizedBox(height: Spacing.xxxs),
              AppText(
                'Chẩn đoán ${result.modeLabel.toLowerCase()}',
                type: AppTextType.caption,
              ),
            ],
          ),
        ),
        const SizedBox(height: Spacing.section),
        const _SectionTitle('Đánh giá'),
        const SizedBox(height: Spacing.control - 4),
        Row(
          children: [
            Expanded(
              child: StatTileWidget(
                label: 'CURB-65',
                value: '${result.curbScore}',
                tone: StatTileTone.primary,
              ),
            ),
            const SizedBox(width: Spacing.group),
            Expanded(
              child: StatTileWidget(
                label: 'Mức độ',
                value: result.severityLabel,
                tone: result.severityIsHigh
                    ? StatTileTone.warning
                    : StatTileTone.neutral,
              ),
            ),
            const SizedBox(width: Spacing.group),
            Expanded(
              child: StatTileWidget(
                label: 'Điều trị',
                value: result.careSettingLabel,
              ),
            ),
          ],
        ),
        const SizedBox(height: Spacing.block - 4),
        RiskPillWidget(label: result.riskLabel, isHigh: result.severityIsHigh),
        const SizedBox(height: Spacing.control + 4),
        AppText(
          'Kết quả cần được bác sĩ xác nhận trước khi áp dụng điều trị.',
          type: AppTextType.caption,
        ),
      ],
    );
  }
}

class _MedicinesTab extends StatelessWidget {
  const _MedicinesTab({required this.medicines});

  final List<DiagnosisMedicine> medicines;

  @override
  Widget build(BuildContext context) {
    // Plain rows instead of GridView: shrink-wrap viewports cannot live
    // inside IntrinsicHeight (the pinned-bottom-CTA pattern).
    final rows = <List<DiagnosisMedicine>>[
      for (var i = 0; i < medicines.length; i += 2)
        medicines.skip(i).take(2).toList(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('Thuốc khuyến nghị'),
        const SizedBox(height: Spacing.control + 4),
        AppText(
          'Liều và đường dùng: theo phác đồ đã chọn.',
          type: AppTextType.caption,
        ),
        const SizedBox(height: Spacing.block - 4),
        for (var r = 0; r < rows.length; r++) ...[
          Row(
            // No stretch here: inside IntrinsicHeight it would pass an
            // unbounded cross-axis to children.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < rows[r].length; i++) ...[
                if (i > 0) const SizedBox(width: Spacing.group),
                Expanded(
                  child: MedicineCardWidget(
                    name: rows[r][i].name,
                    regimenLine: rows[r][i].regimenLine,
                  ),
                ),
              ],
              // Keep card widths equal on incomplete rows.
              if (rows[r].length == 1) ...[
                const SizedBox(width: Spacing.group),
                const Expanded(child: SizedBox.shrink()),
              ],
            ],
          ),
          if (r != rows.length - 1) const SizedBox(height: Spacing.group),
        ],
      ],
    );
  }
}

class _ReferencesTab extends StatelessWidget {
  const _ReferencesTab({required this.references});

  final List<DiagnosisReference> references;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('Tài liệu tham khảo'),
        const SizedBox(height: Spacing.control + 4),
        AppCard.divided([
          for (final reference in references)
            ReferenceRowWidget(
              source: reference.source,
              detail: reference.detail,
            ),
        ]),
        const SizedBox(height: Spacing.section),
        AppText(
          'Nguồn tham khảo của phác đồ được đề xuất.',
          type: AppTextType.caption,
        ),
      ],
    );
  }
}
