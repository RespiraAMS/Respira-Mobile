import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../providers/diagnosis_controller.dart';
import '../routes.dart';
import '../widgets/criteria_banner_widget.dart';

/// Route `/vitals` — diagnosis wizard, step 1/5: baseline clinical
/// parameters (height, weight, serum creatinine).
class VitalsScreen extends ConsumerWidget {
  const VitalsScreen({super.key});

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
                        subtitle: 'Bước 1/5 · Chỉ số nền',
                        onBack: () => context.goBackOr('/patient/progress'),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppCard(
                        padding: const EdgeInsets.all(Spacing.control),
                        child: Column(
                          children: [
                            const CriteriaBannerWidget(
                              'Chỉ số cơ thể và chức năng thận',
                            ),
                            const SizedBox(height: Spacing.control),
                            Container(
                              padding: const EdgeInsets.all(Spacing.control),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.sm,
                                border: Border.all(
                                  color: context.respiraColors.borderSubtle,
                                ),
                              ),
                              child: Column(
                                children: [
                                  AppUnitField(
                                    label: 'Chiều cao',
                                    unit: 'cm',
                                    initialValue: state.heightCm,
                                    onChanged: controller.setHeightCm,
                                  ),
                                  const SizedBox(height: Spacing.control),
                                  AppUnitField(
                                    label: 'Cân nặng',
                                    unit: 'kg',
                                    initialValue: state.weightKg,
                                    onChanged: controller.setWeightKg,
                                  ),
                                  const SizedBox(height: Spacing.control),
                                  AppUnitField(
                                    label: 'Creatinine máu',
                                    unit: 'µmol/L',
                                    initialValue: state.serumCreatinine,
                                    onChanged: controller.setSerumCreatinine,
                                  ),
                                ],
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
                          onPressed: () => context.push(DiagnosisRoutes.curb65),
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
