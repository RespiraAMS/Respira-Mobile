import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../models/diagnosis_state.dart';
import '../providers/diagnosis_controller.dart';
import '../widgets/criteria_banner_widget.dart';
import '../widgets/selection_row_widget.dart';

import '../routes.dart';

/// Route `/diagnosis/curb-65` — empirical treatment wizard, step 1/4:
/// "CURB-65".
class Curb65Screen extends ConsumerWidget {
  const Curb65Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref
        .watch(diagnosisCriteriaControllerProvider)
        .selectedCurb65Criteria;
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
                        subtitle: 'Bước 1/4 · CURB-65',
                        onBack: () => context.goBackOr('/patient/detail'),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppCard(
                        padding: const EdgeInsets.all(Spacing.control),
                        child: Column(
                          children: [
                            const CriteriaBannerWidget('CURB-65'),
                            const SizedBox(height: Spacing.control),
                            for (final criterion in Curb65Criterion.values) ...[
                              SelectionRowWidget(
                                title: criterion.title,
                                description: criterion.description,
                                selected: selected.contains(criterion),
                                onTap: () => controller.toggleCurb65(criterion),
                              ),
                              if (criterion != Curb65Criterion.values.last)
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
}
