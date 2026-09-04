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

/// Route `/resistance-risk` — diagnosis wizard, step 4/5: "Nguy cơ kháng
/// thuốc". Criteria come from `GET /diseases/{id}/criteria`.
class ResistanceRiskScreen extends ConsumerWidget {
  const ResistanceRiskScreen({super.key});

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
                        subtitle: 'Bước 4/5 · Nguy cơ kháng thuốc',
                        onBack: () =>
                            context.goBackOr(DiagnosisRoutes.icuCriteria),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppCard(
                        padding: const EdgeInsets.all(Spacing.control),
                        child: Column(
                          children: [
                            const CriteriaBannerWidget(
                                'Yếu tố nguy cơ kháng thuốc'),
                            const SizedBox(height: Spacing.control),
                            for (final criterion
                                in criteria.resistanceRiskFactorCriteria) ...[
                              SelectionRowWidget(
                                title: criterion.name,
                                description: 'Yếu tố phơi nhiễm.',
                                selected: state.selectedResistanceRiskIds
                                    .contains(criterion.id),
                                onTap: () => controller
                                    .toggleResistanceRiskId(criterion.id),
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
                                    .goBackOr(DiagnosisRoutes.icuCriteria),
                              ),
                            ),
                            const SizedBox(width: Spacing.control),
                            Expanded(
                              child: AppButton(
                                label: 'Tiếp tục',
                                onPressed: () => context
                                    .push(DiagnosisRoutes.otherCriteria),
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
