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

/// Route `/other-criteria` — diagnosis wizard, step 5/5: "Tiêu chí khác".
/// Criteria come from `GET /diseases/{id}/criteria` (other-criteria list).
class OtherCriteriaScreen extends ConsumerWidget {
  const OtherCriteriaScreen({super.key});

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
                        subtitle: 'Bước 5/5 · Tiêu chí khác',
                        onBack: () =>
                            context.goBackOr(DiagnosisRoutes.resistanceRisk),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppCard(
                        padding: const EdgeInsets.all(Spacing.control),
                        child: Column(
                          children: [
                            const CriteriaBannerWidget('Tiêu chí khác'),
                            const SizedBox(height: Spacing.control),
                            for (final criterion
                                in criteria.otherCriteria) ...[
                              SelectionRowWidget(
                                title: criterion.name,
                                description: 'Tiêu chí bổ sung.',
                                selected: state.selectedOtherCriteriaIds
                                    .contains(criterion.id),
                                onTap: () => controller
                                    .toggleOtherCriterionId(criterion.id),
                              ),
                              const SizedBox(height: Spacing.inline),
                            ],
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
                                onPressed: () => context
                                    .goBackOr(DiagnosisRoutes.resistanceRisk),
                              ),
                            ),
                            const SizedBox(width: Spacing.control),
                            Expanded(
                              child: AppButton(
                                label: 'Chẩn đoán',
                                onPressed: () async {
                                  await ref
                                      .read(diagnosisFlowControllerProvider
                                          .notifier)
                                      .runEmpiricalDiagnosis();
                                  if (!context.mounted) return;
                                  final flow = ref.watch(
                                      diagnosisFlowControllerProvider);
                                  // Only open the result screen with a
                                  // real result — otherwise the route
                                  // would spin forever on a failed call.
                                  if (flow.empiricalResult == null) {
                                    showAppToast(
                                      context,
                                      flow.errorMessage ??
                                          'Không thể tạo kết quả chẩn đoán.',
                                    );
                                    return;
                                  }
                                  await context.push(
                                    DiagnosisRoutes.diagnosisResult,
                                  );
                                },
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
