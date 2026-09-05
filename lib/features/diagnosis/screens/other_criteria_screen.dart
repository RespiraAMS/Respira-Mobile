import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../widgets/criteria_banner_widget.dart';

import '../routes.dart';

/// Route `/diagnosis/other-criteria` — empirical treatment wizard,
/// step 4/4: "Tiêu chí khác".
///
/// The template defines no selectable criteria yet — only the informational
/// "Tiêu chí bổ sung" panel. Wire checklist rows here when the clinical
/// workflow specifies them.
class OtherCriteriaScreen extends ConsumerWidget {
  const OtherCriteriaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;

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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: CriteriaBannerWidget('Tiêu chí khác'),
                            ),
                            const SizedBox(height: Spacing.control),
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                minHeight: ControlSize.rowHeight * 3,
                              ),
                              padding: const EdgeInsets.all(Spacing.group),
                              decoration: BoxDecoration(
                                color: c.primarySoft,
                                borderRadius: AppRadius.sm,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Tiêu chí bổ sung',
                                    style: TypographyTokens.label(
                                      context,
                                    ).copyWith(color: c.textSecondary),
                                  ),
                                  const SizedBox(height: Spacing.xxxs),
                                  Text(
                                    'Chọn các tiêu chí bổ sung nếu có theo '
                                    'quy trình chuyên môn.',
                                    style: TypographyTokens.caption(context)
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: c.textPrimary,
                                        ),
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
                        child: Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                label: 'Quay lại',
                                type: AppButtonType.outline,
                                onPressed: () => context.goBackOr(
                                  DiagnosisRoutes.resistanceRisk,
                                ),
                              ),
                            ),
                            const SizedBox(width: Spacing.control),
                            Expanded(
                              child: AppButton(
                                label: 'Chẩn đoán',
                                onPressed: () => context.push(
                                  DiagnosisRoutes.diagnosisResult,
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
