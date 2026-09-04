import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../../patient/widgets/selection_row_widget.dart';
import '../providers/diagnosis_controller.dart';
import '../providers/diagnosis_flow_provider.dart';
import '../routes.dart';
import '../widgets/criteria_banner_widget.dart';

/// Route `/icu-criteria` — diagnosis wizard, step 3/5: "Tiêu chuẩn nhập
/// ICU". Criteria come from `GET /diseases/{id}/criteria`; selection
/// records the criterion's API ID for the empirical-diagnose call.
class IcuCriteriaScreen extends ConsumerWidget {
  const IcuCriteriaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(diagnosisCriteriaControllerProvider);
    final controller = ref.read(diagnosisCriteriaControllerProvider.notifier);
    final criteria =
        ref.watch(diagnosisFlowControllerProvider).criteria;

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
                        title: 'Kinh nghiệm',
                        subtitle: 'Bước 3/5 · Tiêu chuẩn nhập ICU',
                        onBack: () => context.goBackOr(DiagnosisRoutes.curb65),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppCard(
                        padding: const EdgeInsets.all(Spacing.control),
                        child: Column(
                          children: [
                            const CriteriaBannerWidget('Tiêu chuẩn nhập ICU'),
                            const SizedBox(height: Spacing.control),
                            for (final criterion
                                in criteria.icuHospitalizeCriteria) ...[
                              SelectionRowWidget(
                                title: criterion.name,
                                description: 'Tiêu chuẩn nhập ICU',
                                selected: state.selectedIcuCriteriaIds
                                    .contains(criterion.id),
                                onTap: () => controller
                                    .toggleIcuCriterionId(criterion.id),
                              ),
                              const SizedBox(height: Spacing.inline),
                            ],
                            // PaO₂/FiO₂ is measured, not ticked.
                            Container(
                              padding: const EdgeInsets.all(Spacing.control),
                              decoration: BoxDecoration(
                                color: context.respiraColors.surface,
                                borderRadius: AppRadius.sm,
                                border: Border.all(
                                  color: context.respiraColors.borderSubtle,
                                ),
                              ),
                              child: AppUnitField(
                                label: 'PaO₂/FiO₂',
                                unit: 'mmHg',
                                initialValue: state.pao2Fio2,
                                onChanged: controller.setPao2Fio2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: Spacing.block,
                          bottom: Spacing.lg,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                label: 'Quay lại',
                                type: AppButtonType.outline,
                                onPressed: () =>
                                    context.goBackOr(DiagnosisRoutes.curb65),
                              ),
                            ),
                            const SizedBox(width: Spacing.control),
                            Expanded(
                              child: AppButton(
                                label: 'Tiếp tục',
                                onPressed: () => context.push(
                                  DiagnosisRoutes.resistanceRisk,
                                ),
                              ),
                            ),
                          ],
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
