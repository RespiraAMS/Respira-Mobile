import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../widgets/selection_row_widget.dart';
import '../models/diagnosis_state.dart';
import '../providers/diagnosis_controller.dart';
import '../widgets/criteria_banner_widget.dart';

import '../routes.dart';

/// Route `/diagnosis/icu-criteria` — empirical treatment wizard, step 2/4:
/// "Tiêu chuẩn nhập ICU".
///
/// Layout adapted from the Figma template (fixed 390×844 frame) to the
/// responsive token system: absolute positions replaced by semantic
/// spacing; hardcoded hex values mapped to RespiraColors.
class IcuCriteriaScreen extends ConsumerWidget {
  const IcuCriteriaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref
        .watch(diagnosisCriteriaControllerProvider)
        .selectedIcuCriteria;
    final controller = ref.read(diagnosisCriteriaControllerProvider.notifier);

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
                        subtitle: 'Bước 2/4 · Tiêu chuẩn nhập ICU',
                        onBack: () => context.goBackOr(DiagnosisRoutes.curb65),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppCard(
                        padding: const EdgeInsets.all(Spacing.control),
                        child: Column(
                          children: [
                            const CriteriaBannerWidget('Tiêu chuẩn nhập ICU'),
                            const SizedBox(height: Spacing.control),
                            for (final criterion in IcuCriterion.values) ...[
                              SelectionRowWidget(
                                title: criterion.title,
                                description: criterion.description,
                                selected: selected.contains(criterion),
                                onTap: () => controller.toggleIcu(criterion),
                              ),
                              if (criterion != IcuCriterion.values.last)
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
