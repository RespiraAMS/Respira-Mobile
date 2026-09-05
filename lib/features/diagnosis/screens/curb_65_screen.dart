import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../../patient/widgets/selection_row_widget.dart';
import '../providers/diagnosis_controller.dart';
import '../routes.dart';
import '../widgets/criteria_banner_widget.dart';

/// Route `/curb-65` — diagnosis wizard, step 2/5. The score is derived
/// live from the measured inputs (confusion checkbox + numeric fields);
/// empty fields simply count as unmet.
class Curb65Screen extends ConsumerWidget {
  const Curb65Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(diagnosisCriteriaControllerProvider);
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
                        subtitle: 'Bước 2/5 · CURB-65',
                        onBack: () => context.goBackOr(DiagnosisRoutes.vitals),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppCard(
                        padding: const EdgeInsets.all(Spacing.control),
                        child: Column(
                          children: [
                            const CriteriaBannerWidget('CURB-65'),
                            const SizedBox(height: Spacing.control),
                            // C — confusion stays a checkbox.
                            SelectionRowWidget(
                              title: 'Lú lẫn mới xuất hiện',
                              description: 'Confusion',
                              selected: state.confusion,
                              onTap: controller.toggleConfusion,
                            ),
                            const SizedBox(height: Spacing.inline),
                            // U — urea.
                            Container(
                              padding: const EdgeInsets.all(Spacing.control),
                              decoration: _rowDecoration(context),
                              child: AppUnitField(
                                label: 'Urea',
                                unit: 'mmol/L',
                                initialValue: state.urea,
                                onChanged: controller.setUrea,
                              ),
                            ),
                            const SizedBox(height: Spacing.inline),
                            // R — respiratory rate.
                            Container(
                              padding: const EdgeInsets.all(Spacing.control),
                              decoration: _rowDecoration(context),
                              child: AppUnitField(
                                label: 'Nhịp thở',
                                unit: 'lần/phút',
                                initialValue: state.respRate,
                                onChanged: controller.setRespRate,
                              ),
                            ),
                            const SizedBox(height: Spacing.inline),
                            // B — blood pressure (SBP + DBP).
                            Container(
                              padding: const EdgeInsets.all(Spacing.control),
                              decoration: _rowDecoration(context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Huyết áp',
                                    style: TypographyTokens.body(context)
                                        .copyWith(
                                            color: context
                                                .respiraColors.textPrimary),
                                  ),
                                  const SizedBox(height: Spacing.inline),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AppUnitField(
                                          label: 'SBP',
                                          unit: 'mmHg',
                                          initialValue: state.sbp,
                                          onChanged: controller.setSbp,
                                        ),
                                      ),
                                      const SizedBox(width: Spacing.inline),
                                      Expanded(
                                        child: AppUnitField(
                                          label: 'DBP',
                                          unit: 'mmHg',
                                          initialValue: state.dbp,
                                          onChanged: controller.setDbp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: Spacing.inline),
                            // 65 — age.
                            Container(
                              padding: const EdgeInsets.all(Spacing.control),
                              decoration: _rowDecoration(context),
                              child: AppUnitField(
                                label: 'Tuổi',
                                unit: 'tuổi',
                                initialValue: state.age,
                                onChanged: controller.setAge,
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
                        child: AppButton(
                          label: 'Tiếp tục',
                          expand: true,
                          onPressed: () =>
                              context.push(DiagnosisRoutes.icuCriteria),
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

  BoxDecoration _rowDecoration(BuildContext context) {
    final c = context.respiraColors;
    return BoxDecoration(
      color: c.surface,
      borderRadius: AppRadius.sm,
      border: Border.all(color: c.borderSubtle),
    );
  }
}
