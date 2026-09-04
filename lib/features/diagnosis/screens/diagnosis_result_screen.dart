import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../models/clinical_dtos.dart';
import '../models/diagnosis_result.dart';
import '../models/diagnosis_state.dart';
import '../providers/diagnosis_controller.dart';
import '../providers/diagnosis_flow_provider.dart';
import '../providers/diagnosis_tab_controller.dart';
import '../widgets/medicine_card_widget.dart';
import '../widgets/reference_row_widget.dart';
import '../widgets/risk_pill_widget.dart';
import '../widgets/stat_tile_widget.dart';

import '../routes.dart';

/// Route `/diagnosis/result` — wizard output with three tabs
/// (result summary · recommended medicines · guideline references),
/// rendered from the real `POST /diagnose/empirical` response.
class DiagnosisResultScreen extends ConsumerWidget {
  const DiagnosisResultScreen({super.key});

  Future<void> _confirmSave(
    BuildContext context,
    WidgetRef ref,
    EmpiricalDiagnoseResultDto result,
  ) async {
    final confirmed = await showAppConfirmDialog(
      context,
      icon: LucideIcons.save,
      title: 'Lưu kết quả chẩn đoán?',
      description:
          'Sau khi lưu, nội dung chỉ có thể xem và không được chỉnh sửa trực tiếp.',
      infoLabel:
          'Đã chọn ${result.medicines.length} thuốc · ${result.references.length} phác đồ',
      confirmLabel: 'Xác nhận lưu',
    );

    if (confirmed != true || !context.mounted) return;

    final ok = await ref
        .read(diagnosisFlowControllerProvider.notifier)
        .saveEmpiricalTreatment();
    if (!context.mounted) return;
    final flow = ref.read(diagnosisFlowControllerProvider);
    showAppToast(
      context,
      ok
          ? 'Đã lưu kết quả chẩn đoán.'
          : (flow.errorMessage ?? 'Lưu thất bại. Vui lòng thử lại.'),
    );
    if (ok) context.go('/patient/detail');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(diagnosisFlowControllerProvider).empiricalResult;
    final tab = ref.watch(diagnosisTabControllerProvider);
    final tabController = ref.read(diagnosisTabControllerProvider.notifier);

    if (result == null) {
      // The flow controller records the failure — show it instead of a
      // spinner that would otherwise never resolve.
      final error = ref.watch(diagnosisFlowControllerProvider).errorMessage;
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.section),
              child: Text(
                error ?? 'Không thể tải kết quả chẩn đoán. Vui lòng thử lại.',
                textAlign: TextAlign.center,
                style: TypographyTokens.body(context)
                    .copyWith(color: context.respiraColors.error),
              ),
            ),
          ),
        ),
      );
    }

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
                        subtitle: 'Kinh nghiệm · Viêm phổi cộng đồng',
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
                        DiagnosisTab.medicines =>
                          _MedicinesTab(medicines: result.medicines),
                        DiagnosisTab.references =>
                          _ReferencesTab(references: result.references),
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
                          onPressed: () => _confirmSave(context, ref, result),
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

class _ResultTab extends ConsumerWidget {
  const _ResultTab({required this.result});

  final EmpiricalDiagnoseResultDto result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final inputs = ref.watch(diagnosisCriteriaControllerProvider);
    final severityIsHigh = result.severity == 'Severe';
    final siteLabel = switch (result.treatmentSite) {
      'Inpatient' => 'Nội trú',
      'IntensiveCareUnit' => 'ICU',
      _ => 'Ngoại trú',
    };
    final riskLabel = severityIsHigh ? 'Nguy cơ cao' : 'Nguy cơ thấp';

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
                'Viêm phổi cộng đồng',
                style: TypographyTokens.h3(
                  context,
                ).copyWith(color: c.textPrimary),
              ),
              const SizedBox(height: Spacing.xxxs),
              AppText('Chẩn đoán kinh nghiệm', type: AppTextType.caption),
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
                value: '${inputs.curb65Score}',
                tone: StatTileTone.primary,
              ),
            ),
            const SizedBox(width: Spacing.group),
            Expanded(
              child: StatTileWidget(
                label: 'CrCl',
                value: result.crcl.toStringAsFixed(1),
                tone: StatTileTone.neutral,
              ),
            ),
            const SizedBox(width: Spacing.group),
            Expanded(
              child: StatTileWidget(
                label: 'Điều trị',
                value: siteLabel,
              ),
            ),
          ],
        ),
        const SizedBox(height: Spacing.block - 4),
        RiskPillWidget(label: riskLabel, isHigh: severityIsHigh),
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

  final List<AntibioticResultDto> medicines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('Thuốc khuyến nghị'),
        const SizedBox(height: Spacing.control + 4),
        AppText('Liều và đường dùng: theo phác đồ đã chọn.',
            type: AppTextType.caption),
        const SizedBox(height: Spacing.block - 4),
        for (final medicine in medicines) ...[
          MedicineCardWidget(
            name: medicine.name,
            regimenLine: medicine.dosages.isEmpty
                ? medicine.antibioticGroup.name
                : '${medicine.dosages.first.routeOfAdministration} · ${medicine.dosages.first.dose}',
          ),
          if (medicine != medicines.last) const SizedBox(height: Spacing.group),
        ],
      ],
    );
  }
}

class _ReferencesTab extends StatelessWidget {
  const _ReferencesTab({required this.references});

  final List<ReferenceDto> references;

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
              source: reference.name,
              detail: reference.issuer,
            ),
        ]),
        const SizedBox(height: Spacing.section),
        AppText('Nguồn tham khảo của phác đồ được đề xuất.',
            type: AppTextType.caption),
      ],
    );
  }
}
