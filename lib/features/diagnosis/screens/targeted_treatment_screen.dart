import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../../../../features/patient/routes.dart';
import '../providers/microbiology_provider.dart';
import '../providers/targeted_treatment_controller.dart';
import '../widgets/microbiology_banner.dart';
import '../widgets/treatment_option_row_widget.dart';

/// Route `/targeted-treatment` — "Chẩn đoán vi sinh": pick drug + route
/// combinations from the antibiogram, then save the targeted treatment.
class TargetedTreatmentScreen extends ConsumerWidget {
  const TargetedTreatmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final micro = ref.watch(microbiologyResultProvider);
    final selectedIds = ref.watch(targetedTreatmentControllerProvider);
    final controller = ref.read(targetedTreatmentControllerProvider.notifier);
    final chips = controller.summaryChips();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppAppBar(
                title: 'Chẩn đoán vi sinh',
                subtitle: 'Mỗi đường dùng là một lựa chọn thuốc riêng',
                onBack: () => context.goBackOr('/patient/progress'),
              ),
              const SizedBox(height: Spacing.section),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Patient context.
                      Container(
                        padding: const EdgeInsets.all(Spacing.control + 2),
                        decoration: BoxDecoration(
                          color: c.surfaceSecondary,
                          borderRadius: AppRadius.md,
                        ),
                        child: Row(
                          children: [
                            const AvatarGlyphWidget(glyph: '👨🏻'),
                            const SizedBox(width: Spacing.group),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Nguyễn Minh Khôi',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TypographyTokens.body(context)
                                        .copyWith(
                                            fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: Spacing.xxxs),
                                  AppText('BA-2026-0231 · 55 tuổi',
                                      type: AppTextType.caption),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.block),
                      BacteriaDisplayField(bacteria: micro.bacteria),
                      const SizedBox(height: Spacing.control),
                      AntibiogramBanner(line: micro.antibiogramLine),
                      const SizedBox(height: Spacing.section),
                      Text(
                        'Chọn thuốc + đường dùng',
                        style: TypographyTokens.caption(context)
                            .copyWith(color: c.textPrimary),
                      ),
                      const SizedBox(height: Spacing.inline),
                      for (final option in micro.options) ...[
                        TreatmentOptionRowWidget(
                          option: option,
                          selected: selectedIds.contains(option.id),
                          onToggle: () => controller.toggle(option.id),
                        ),
                        if (option != micro.options.last)
                          const SizedBox(height: Spacing.inline),
                      ],
                      const SizedBox(height: Spacing.section),
                      // Selection summary.
                      Container(
                        padding: const EdgeInsets.all(Spacing.group),
                        decoration: BoxDecoration(
                          color: c.surface,
                          borderRadius: AppRadius.md,
                          border: Border.all(color: c.borderSubtle),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText('Đã chọn theo thuốc + đường dùng',
                                type: AppTextType.caption),
                            const SizedBox(height: Spacing.inline),
                            Wrap(
                              spacing: Spacing.inline,
                              runSpacing: Spacing.inline,
                              children: [
                                for (final chip in chips)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Spacing.control,
                                      vertical: Spacing.xxxs + 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: c.primarySoft,
                                      borderRadius: AppRadius.full,
                                    ),
                                    child: Text(
                                      chip,
                                      style: TypographyTokens.label(context)
                                          .copyWith(color: c.primary),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.section),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
                child: AppButton(
                  label: 'Lưu điều trị đích',
                  expand: true,
                  onPressed: () {
                    showAppToast(context, 'Đã lưu điều trị đích.');
                    context.go(PatientRoutes.detail);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
