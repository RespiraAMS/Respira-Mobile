import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import 'package:respira_mobile/features/calculator/routes.dart';
import 'package:respira_mobile/features/diagnosis/widgets/criteria_banner_widget.dart';
import 'package:respira_mobile/features/diagnosis/widgets/selection_row_widget.dart';
import '../models/calculator.dart';
import '../providers/calculator_providers.dart';
import '../widgets/curb65_result_card.dart';

/// Route `/calculators/curb-65` — Nhập liệu (inputs + Tính → result) and
/// Giải thích (method explanation) tabs.
class CalculatorDetailScreen extends ConsumerWidget {
  const CalculatorDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(calculatorDetailTabControllerProvider);
    final tabController =
        ref.read(calculatorDetailTabControllerProvider.notifier);
    final state = ref.watch(curb65CalculatorControllerProvider);
    final controller = ref.read(curb65CalculatorControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppAppBar(
                title: 'CURB-65',
                subtitle: 'Máy tính lâm sàng',
                onBack: () => context.goBackOr(CalculatorRoutes.list),
              ),
              const SizedBox(height: Spacing.control),
              AppSegmentedTabs<int>(
                segments: const [(0, 'Nhập liệu'), (1, 'Giải thích')],
                selected: tabIndex,
                onChanged: tabController.setTab,
              ),
              const SizedBox(height: Spacing.section),
              Expanded(
                child: tabIndex == 0
                    ? _InputTab(state: state, controller: controller)
                    : const _ExplanationTab(),
              ),
              // 'Tính' stays pinned at the bottom; the result card appears
              // inside the scrollable content right above it.
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  Spacing.inline,
                  0,
                  Spacing.lg,
                ),
                child: tabIndex == 0
                    ? AppButton(
                        label: 'Tính',
                        expand: true,
                        onPressed: controller.calculate,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputTab extends StatelessWidget {
  const _InputTab({required this.state, required this.controller});

  final Curb65CalculatorState state;
  final Curb65CalculatorController controller;

  @override
  Widget build(BuildContext context) {
    final input = state.input;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(Spacing.control),
            decoration: BoxDecoration(
              color: context.respiraColors.surface,
              borderRadius: AppRadius.md,
              border: Border.all(color: context.respiraColors.borderSubtle),
            ),
            child: Column(
              children: [
                const CriteriaBannerWidget('Tiêu chí CURB-65'),
                const SizedBox(height: Spacing.control),
                // C — confusion checkbox.
                SelectionRowWidget(
                  title: 'Lú lẫn mới xuất hiện',
                  description: 'Confusion',
                  selected: input.confusion,
                  onTap: controller.toggleConfusion,
                ),
                const SizedBox(height: Spacing.inline),
                _RowCard(
                  child: AppUnitField(
                    label: 'Urea',
                    description: 'Ngưỡng > 7 mmol/L',
                    unit: 'mmol/L',
                    initialValue: input.urea,
                    onChanged: controller.setUrea,
                  ),
                ),
                const SizedBox(height: Spacing.inline),
                _RowCard(
                  child: AppUnitField(
                    label: 'Nhịp thở',
                    description: 'Ngưỡng ≥ 30 lần/phút',
                    unit: 'lần/phút',
                    initialValue: input.respRate,
                    onChanged: controller.setRespRate,
                  ),
                ),
                const SizedBox(height: Spacing.inline),
                _RowCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Huyết áp',
                        style: TypographyTokens.body(context).copyWith(
                            color: context.respiraColors.textPrimary),
                      ),
                      const SizedBox(height: Spacing.xxxs),
                      AppText(
                        'Ngưỡng: SBP < 90 mmHg hoặc DBP ≤ 60 mmHg',
                        type: AppTextType.caption,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: Spacing.inline),
                      Row(
                        children: [
                          Expanded(
                            child: AppUnitField(
                              label: 'SBP',
                              unit: 'mmHg',
                              initialValue: input.sbp,
                              onChanged: controller.setSbp,
                            ),
                          ),
                          const SizedBox(width: Spacing.inline),
                          Expanded(
                            child: AppUnitField(
                              label: 'DBP',
                              unit: 'mmHg',
                              initialValue: input.dbp,
                              onChanged: controller.setDbp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.inline),
                _RowCard(
                  child: AppUnitField(
                    label: 'Tuổi',
                    description: 'Ngưỡng ≥ 65 tuổi',
                    unit: 'tuổi',
                    initialValue: input.age,
                    onChanged: controller.setAge,
                  ),
                ),
              ],
            ),
          ),
          if (state.resultVisible) ...[
            const SizedBox(height: Spacing.section),
            Curb65ResultCard(score: input.score),
          ],
          const SizedBox(height: Spacing.section),
        ],
      ),
    );
  }
}

class _RowCard extends StatelessWidget {
  const _RowCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      padding: const EdgeInsets.all(Spacing.control),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: AppRadius.sm,
        border: Border.all(color: c.borderSubtle),
      ),
      child: child,
    );
  }
}

class _ExplanationTab extends StatelessWidget {
  const _ExplanationTab();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ExplanationCard(
            title: 'Phương pháp tính',
            children: [
              AppText(
                'Điểm CURB-65 = tổng số tiêu chí được đáp ứng, từ 0 đến 5 '
                'điểm. Mỗi tiêu chí đáp ứng đóng góp 1 điểm.',
                type: AppTextType.body,
              ),
            ],
          ),
          const SizedBox(height: Spacing.section),
          _ExplanationCard(
            title: 'Mô tả',
            children: [
              AppText(
                'CURB-65 hỗ trợ đánh giá mức độ nặng của viêm phổi cộng đồng.',
                type: AppTextType.body,
              ),
              const SizedBox(height: Spacing.inline),
              AppText(
                'Kết quả cần được bác sĩ xác nhận trong bối cảnh lâm sàng.',
                type: AppTextType.caption,
              ),
            ],
          ),
          const SizedBox(height: Spacing.section),
          _ExplanationCard(
            title: 'Các thành phần',
            children: [
              AppText(
                'Lú lẫn · Urea > 7 mmol/L · Nhịp thở ≥ 30 · Huyết áp thấp · '
                'Tuổi ≥ 65.',
                type: AppTextType.body,
              ),
              const SizedBox(height: Spacing.inline),
              AppText(
                'Chi tiết ngưỡng được hiển thị tại tab Nhập liệu.',
                type: AppTextType.caption,
              ),
            ],
          ),
          const SizedBox(height: Spacing.section),
        ],
      ),
    );
  }
}

class _ExplanationCard extends StatelessWidget {
  const _ExplanationCard({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      padding: const EdgeInsets.all(Spacing.group),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: AppRadius.md,
        border: Border.all(color: c.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TypographyTokens.bodyMedium(context)
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: Spacing.inline),
          ...children,
        ],
      ),
    );
  }
}
