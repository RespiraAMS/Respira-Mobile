import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../../../../features/patient/providers/active_patient_provider.dart';
import '../../../../features/patient/providers/current_patient_provider.dart';
import '../../../../features/patient/providers/patient_detail_provider.dart';
import '../../../../features/patient/routes.dart';
import '../models/clinical_dtos.dart';
import '../models/diagnosis_result.dart';
import '../models/diagnosis_state.dart';
import '../providers/diagnosis_controller.dart';
import '../providers/diagnosis_flow_provider.dart';
import '../providers/diagnosis_tab_controller.dart';
import '../providers/medicine_selection_provider.dart';
import '../widgets/reference_row_widget.dart';
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
    final changes = ref.read(medicineSelectionControllerProvider.notifier);
    final confirmed = await showAppConfirmDialog(
      context,
      icon: LucideIcons.save,
      title: 'Lưu kết quả chẩn đoán?',
      description:
          'Sau khi lưu, nội dung chỉ có thể xem và không được chỉnh sửa trực tiếp.',
      infoLabel:
          'Đã chọn ${result.recommendations.isEmpty ? result.medicines.length : result.recommendations.length} thuốc · ${result.references.length} phác đồ'
          '${changes.hasChanges ? ' · ${changes.changedCount} thay đổi' : ''}',
      confirmLabel: 'Xác nhận lưu',
    );

    if (confirmed != true || !context.mounted) return;

    // The backend requires a reason whenever the doctor's choice differs
    // from the system recommendation (a medicine replaced or removed).
    String? reason;
    if (changes.hasChanges) {
      reason = await _showReasonDialog(context);
      if (reason == null || !context.mounted) return;
    }

    final ok = await ref
        .read(diagnosisFlowControllerProvider.notifier)
        .saveEmpiricalTreatment(reason: reason);
    if (!context.mounted) return;

    if (!ok) {
      final flow = ref.read(diagnosisFlowControllerProvider);
      showAppToast(
        context,
        flow.errorMessage ?? 'Lưu thất bại. Vui lòng thử lại.',
      );
      return;
    }

    // Success feedback shows on the destination screen (a toast fired
    // here races the route transition). Invalidate the cached detail so
    // the timeline reflects the treatment just created.
    final patient = ref.read(activePatientControllerProvider);
    ref.invalidate(patientDetailProvider(patient.id));
    context.go(
      '${PatientRoutes.detail}?id=${Uri.encodeComponent(patient.id)}',
      extra: 'saved',
    );
  }

  /// Collects the mandatory reason for replacing a recommended medicine.
  /// Returns null when cancelled.
  Future<String?> _showReasonDialog(BuildContext context) {
    final controller = TextEditingController();
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        final c = dialogContext.respiraColors;
        return AlertDialog(
          backgroundColor: c.surface,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.lg),
          title: Text(
            'Lý do thay đổi lựa chọn thuốc',
            style: TypographyTokens.bodyLarge(dialogContext)
                .copyWith(fontWeight: FontWeight.w700),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Bạn đã thay đổi thuốc trong phác đồ khuyến nghị. '
                'Vui lòng nêu lý do để lưu vào hồ sơ.',
                type: AppTextType.caption,
              ),
              const SizedBox(height: Spacing.control),
              AppTextField(
                label: 'Lý do',
                hintText: 'Ví dụ: bệnh nhân dị ứng với thuốc khuyến nghị',
                onChanged: (value) => controller.text = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isEmpty) return;
                Navigator.of(dialogContext).pop(text);
              },
              child: Text(
                'Xác nhận',
                style: TypographyTokens.body(dialogContext)
                    .copyWith(color: c.primary, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        );
      },
    );
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
                        DiagnosisTab.medicines => _MedicinesTab(result: result),
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
                          label: 'Xác nhận chẩn đoán',
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
    final age = ref.watch(currentPatientProvider).computedAge;
    final score = inputs.curb65Score(age);
    final severity = switch (result.severity) {
      'Severe' => 'Cao',
      'Moderate' => 'Trung bình',
      'Mild' => 'Thấp',
      _ => result.severity,
    };
    final severityIsHigh = result.severity == 'Severe';
    final siteLabel = switch (result.treatmentSite) {
      'Inpatient' => 'Nội trú',
      'IntensiveCareUnit' => 'ICU',
      _ => 'Ngoại trú',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('Kết quả chẩn đoán'),
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
              const SizedBox(height: Spacing.inline),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.control,
                  vertical: Spacing.xxxs + 3,
                ),
                decoration: BoxDecoration(
                  color: c.primarySoft,
                  borderRadius: AppRadius.full,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: c.primary,
                      ),
                    ),
                    const SizedBox(width: Spacing.inline),
                    Text(
                      'Chẩn đoán kinh nghiệm',
                      style: TypographyTokens.label(context)
                          .copyWith(color: c.textPrimary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Spacing.control - 2),
        AppText(
          'Kết quả này cần được bác sĩ xác nhận trước khi áp dụng điều trị.',
          type: AppTextType.caption,
        ),
        const SizedBox(height: Spacing.section),
        const _SectionTitle('Đánh giá lâm sàng'),
        const SizedBox(height: Spacing.control - 4),
        Row(
          children: [
            Expanded(
              child: StatTileWidget(
                label: 'CURB-65',
                value: '$score',
                tone: StatTileTone.primary,
              ),
            ),
            const SizedBox(width: Spacing.group),
            Expanded(
              child: StatTileWidget(
                label: 'Mức độ',
                value: severity,
                tone: severityIsHigh
                    ? StatTileTone.warning
                    : StatTileTone.neutral,
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
        const SizedBox(height: Spacing.section),
        const _SectionTitle('Tóm tắt căn cứ'),
        const SizedBox(height: Spacing.control - 4),
        AppSurface(
          radius: AppRadius.mdValue,
          color: c.surfaceSecondary,
          borderColor: Colors.transparent,
          padding: const EdgeInsets.all(Spacing.group - 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText('CURB-65 = $score'),
              if (inputs.selectedIcuCriteriaIds.isNotEmpty) ...[
                const SizedBox(height: Spacing.xxxs),
                const AppText('Có tiêu chí nhập viện'),
              ],
              if (inputs.selectedResistanceRiskIds.isNotEmpty) ...[
                const SizedBox(height: Spacing.xxxs),
                const AppText('Nguy cơ kháng thuốc cao'),
              ],
            ],
          ),
        ),
        const SizedBox(height: Spacing.section),
        AppText('Hành động tiếp theo', type: AppTextType.label),
        const SizedBox(height: Spacing.xxxs),
        AppText(
          'Xem thuốc khuyến nghị hoặc xác nhận chẩn đoán để lưu.',
          type: AppTextType.caption,
        ),
      ],
    );
  }
}

/// 'Thuốc khuyến nghị' tab: the protocol's recommended medicines, each
/// replaceable with a same-antibiotic-group medicine from the API's
/// full pick-pool (`medicines`) — or removable entirely (a reason is
/// mandatory on save when anything changed).
class _MedicinesTab extends ConsumerWidget {
  const _MedicinesTab({required this.result});

  final EmpiricalDiagnoseResultDto result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.watch(medicineSelectionControllerProvider);
    // Recommendations drive the tab; an empty protocol list falls back
    // to the full pool so the tab is never blank.
    final recommendations =
        result.recommendations.isNotEmpty ? result.recommendations : result.medicines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('Thuốc khuyến nghị'),
        const SizedBox(height: Spacing.control + 4),
        AppText(
          'Liều và đường dùng: theo phác đồ đã chọn. Có thể thay hoặc bỏ '
          'thuốc; thay/bỏ cần nêu lý do khi lưu.',
          type: AppTextType.caption,
        ),
        const SizedBox(height: Spacing.block - 4),
        for (final recommendation in recommendations) ...[
          _RecommendedMedicineCard(
            recommendation: recommendation,
            pool: result.medicines,
            chosenId: selection.removed.contains(recommendation.id)
                ? null
                : selection.replacements[recommendation.id],
            removed: selection.removed.contains(recommendation.id),
            remainingCount: recommendations.length - selection.removed.length,
          ),
          if (recommendation != recommendations.last)
            const SizedBox(height: Spacing.group),
        ],
      ],
    );
  }
}

/// One recommendation row: the currently chosen medicine (original,
/// replacement or removed state) with same-group 'Thay thế', removal
/// and restore actions.
class _RecommendedMedicineCard extends ConsumerWidget {
  const _RecommendedMedicineCard({
    required this.recommendation,
    required this.pool,
    required this.chosenId,
    required this.removed,
    required this.remainingCount,
  });

  final AntibioticResultDto recommendation;
  final List<AntibioticResultDto> pool;

  /// Non-null when the doctor picked a replacement.
  final String? chosenId;

  /// True when the doctor removed this recommendation entirely.
  final bool removed;

  /// How many recommendations remain after removals — the backend
  /// requires at least one chosen medicine.
  final int remainingCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final selection = ref.read(medicineSelectionControllerProvider.notifier);
    final replaced = !removed && chosenId != null;
    final chosen = replaced
        ? pool.firstWhere(
            (m) => m.id == chosenId,
            orElse: () => recommendation,
          )
        : recommendation;
    final routeDose = chosen.dosages.isEmpty
        ? chosen.antibioticGroupName
        : '${chosen.dosages.first.routeOfAdministration} · ${chosen.dosages.first.dose}';

    return AppSurface(
      radius: AppRadius.mdValue,
      color: removed ? c.surfaceSecondary : c.surface,
      padding: const EdgeInsets.all(Spacing.control + 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: ControlSize.touchTargetMin - 4,
                height: ControlSize.touchTargetMin - 4,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: removed
                      ? c.borderSubtle
                      : replaced
                          ? c.warningSoft
                          : c.primarySoft,
                  borderRadius: BorderRadius.circular(AppRadius.smValue),
                ),
                child: AppIcon(
                  removed
                      ? LucideIcons.trash2
                      : replaced
                          ? LucideIcons.repeat
                          : LucideIcons.pill,
                  size: ControlSize.iconLg,
                  color: removed
                      ? c.textTertiary
                      : replaced
                          ? c.warning
                          : c.primary,
                ),
              ),
              const SizedBox(width: Spacing.control),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      removed ? recommendation.name : chosen.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyTokens.body(context).copyWith(
                            fontWeight: FontWeight.w700,
                            color: removed
                                ? c.textTertiary
                                : c.textPrimary,
                            decoration: removed
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                    ),
                    const SizedBox(height: Spacing.xxxs),
                    Text(
                      '${(removed ? recommendation : chosen).antibioticGroupName} · $routeDose',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TypographyTokens.caption(context)
                          .copyWith(color: c.textSecondary),
                    ),
                    if (replaced) ...[
                      const SizedBox(height: Spacing.xxxs),
                      AppText(
                        'Thay thế cho ${recommendation.name}',
                        type: AppTextType.label,
                        color: c.warning,
                      ),
                    ],
                    if (removed) ...[
                      const SizedBox(height: Spacing.xxxs),
                      AppText(
                        'Đã xóa khỏi phác đồ',
                        type: AppTextType.label,
                        color: c.error,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.control),
          Row(
            children: [
              if (removed) ...[
                Expanded(
                  child: AppButton(
                    label: 'Khôi phục',
                    type: AppButtonType.outline,
                    onPressed: () => selection.restore(recommendation.id),
                  ),
                ),
              ] else ...[
                Expanded(
                  child: AppButton(
                    label: 'Thay thế',
                    type: AppButtonType.outline,
                    onPressed: () => _showReplacementSheet(context, ref),
                  ),
                ),                const SizedBox(width: Spacing.control),
                Expanded(
                  child: AppButton(
                    label: 'Xóa',
                    type: AppButtonType.destructive,
                    onPressed: remainingCount > 1
                        ? () => selection.remove(recommendation.id)
                        : null,
                  ),
                ),
                if (replaced) ...[
                  const SizedBox(width: Spacing.control),
                  Expanded(
                    child: AppButton(
                      label: 'Khôi phục',
                      type: AppButtonType.outline,
                      onPressed: () => selection.restore(recommendation.id),
                    ),
                  ),
                ],
              ],
            ],
          ),
        ],
      ),
    );
  }

  /// Same-antibiotic-group candidates from the pick-pool, excluding the
  /// currently chosen medicine. Selecting a row applies the replacement
  /// to the controller directly and closes the dialog.
  void _showReplacementSheet(BuildContext context, WidgetRef ref) {
    final candidates = pool
        .where((m) =>
            m.id != recommendation.id &&
            m.antibioticGroupId == recommendation.antibioticGroupId &&
            m.dosages.isNotEmpty)
        .toList();

    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final c = dialogContext.respiraColors;
        return AlertDialog(
          backgroundColor: c.surface,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.lg),
          title: Text(
            'Thay ${recommendation.name} — cùng nhóm '
            '${recommendation.antibioticGroupName}',
            style: TypographyTokens.bodyLarge(dialogContext)
                .copyWith(fontWeight: FontWeight.w700),
          ),
          content: candidates.isEmpty
              ? AppText(
                  'Không có thuốc nào cùng nhóm trong danh sách.',
                  type: AppTextType.caption,
                )
              : AppCard.divided([
                  for (final candidate in candidates)
                    _ReplacementOptionRow(
                      candidate: candidate,
                      onTap: () {
                        ref
                            .read(medicineSelectionControllerProvider.notifier)
                            .replace(recommendation.id, candidate.id);
                        Navigator.of(dialogContext).pop();
                      },
                    ),
                ]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}

class _ReplacementOptionRow extends StatelessWidget {
  const _ReplacementOptionRow({required this.candidate, required this.onTap});

  final AntibioticResultDto candidate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final routeDose = candidate.dosages.isEmpty
        ? ''
        : '${candidate.dosages.first.routeOfAdministration} · ${candidate.dosages.first.dose}';

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.inline,
          vertical: Spacing.control,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.sm),
        foregroundColor: c.textPrimary,
        alignment: Alignment.centerLeft,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  candidate.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TypographyTokens.body(context)
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                if (routeDose.isNotEmpty) ...[
                  const SizedBox(height: Spacing.xxxs),
                  AppText(routeDose, type: AppTextType.caption),
                ],
              ],
            ),
          ),
          AppIcon(
            LucideIcons.chevronRight,
            size: ControlSize.iconSm,
            color: c.textTertiary,
          ),
        ],
      ),
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
