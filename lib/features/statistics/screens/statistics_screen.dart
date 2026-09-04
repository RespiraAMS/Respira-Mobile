import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../design_system/design_system.dart';
import '../../../../features/patient/routes.dart';
import '../models/statistics_view.dart';
import '../providers/statistics_provider.dart';
import '../widgets/kpi_tile_widget.dart';
import '../widgets/pathogen_row_widget.dart';
import '../widgets/weekly_bars_widget.dart';

/// Route `/statistics` — treatment activity overview (bottom-nav tab 5).
class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  void _showTabPlaceholder(BuildContext context, String label) {
    showAppToast(context, 'Tab "$label" sẽ được bổ sung sau.');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final period = ref.watch(statisticsPeriodControllerProvider);
    final periodController =
        ref.read(statisticsPeriodControllerProvider.notifier);
    final view = ref.watch(statisticsViewProvider);
    final maxPathogenCount =
        view.pathogens.fold<int>(1, (a, p) => p.count > a ? p.count : a);

    final navItems = const [
      AppBottomNavItem(icon: LucideIcons.users, label: 'Bệnh nhân'),
      AppBottomNavItem(icon: LucideIcons.search, label: 'Tra cứu'),
      AppBottomNavItem(icon: LucideIcons.stethoscope, label: 'Chẩn đoán'),
      AppBottomNavItem(icon: LucideIcons.calculator, label: 'Máy tính'),
      AppBottomNavItem(icon: LucideIcons.barChart2, label: 'Thống kê'),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Spacing.group,
            Spacing.inline,
            Spacing.group,
            Spacing.group,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(),
              const SizedBox(height: Spacing.section),
              AppSegmentedTabs<PeriodRange>(
                segments: [
                  for (final range in PeriodRange.values)
                    (range, range.displayName),
                ],
                selected: period,
                onChanged: periodController.setPeriod,
              ),
              const SizedBox(height: Spacing.section),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final kpi in view.kpis) ...[
                            if (kpi != view.kpis.first)
                              const SizedBox(width: Spacing.inline),
                            Expanded(child: KpiTileWidget(stat: kpi)),
                          ],
                        ],
                      ),
                      const SizedBox(height: Spacing.section),
                      Text(
                        'Chẩn đoán theo tuần',
                        style: TypographyTokens.bodyMedium(context)
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: Spacing.inline),
                      WeeklyBarsWidget(bars: view.bars),
                      const SizedBox(height: Spacing.section),
                      Text(
                        'Tác nhân thường gặp',
                        style: TypographyTokens.bodyLarge(context)
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: Spacing.inline),
                      Container(
                        padding: const EdgeInsets.all(Spacing.group),
                        decoration: BoxDecoration(
                          color: c.surface,
                          borderRadius: AppRadius.md,
                          border: Border.all(color: c.borderSubtle),
                        ),
                        child: Column(
                          children: [
                            for (final pathogen in view.pathogens) ...[
                              if (pathogen != view.pathogens.first)
                                const SizedBox(height: Spacing.block),
                              PathogenRowWidget(
                                stat: pathogen,
                                maxCount: maxPathogenCount,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.section),
                      _SyncBanner(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Spacing.inline),
              AppBottomNavigation(
                items: navItems,
                activeIndex: 4,
                onTap: (index) {
                  if (index == 0) {
                    context.go(PatientRoutes.list);
                  } else if (index == 2) {
                    // Diagnosis entry: create a patient, then continue with
                    // the empirical-treatment flow for them.
                    context.push(PatientRoutes.addPatientForDiagnosis);
                  } else if (index != 4) {
                    _showTabPlaceholder(context, navItems[index].label);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;

    return Row(
      children: [
        Material(
          color: c.surfaceSecondary,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            width: ControlSize.touchTargetMin,
            height: ControlSize.touchTargetMin,
            child: InkWell(
              onTap: () => showAppToast(
                context,
                'Đăng xuất sẽ được bổ sung sau.',
              ),
              child: Icon(LucideIcons.logOut,
                  size: ControlSize.iconXl, color: c.iconDefault),
            ),
          ),
        ),
        const SizedBox(width: Spacing.group),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Thống kê',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    TypographyTokens.h3(context).copyWith(color: c.textPrimary),
              ),
              const SizedBox(height: 2),
              AppText('Tổng quan hoạt động điều trị',
                  type: AppTextType.caption, maxLines: 1),
            ],
          ),
        ),
      ],
    );
  }
}

class _SyncBanner extends StatelessWidget {
  const _SyncBanner();

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      padding: const EdgeInsets.all(Spacing.xxs + 2),
      decoration: BoxDecoration(
        color: c.primarySoft,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: ControlSize.touchTargetMin,
            height: ControlSize.touchTargetMin,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: c.surface, shape: BoxShape.circle),
            child: Icon(LucideIcons.refreshCw,
                size: ControlSize.iconLg, color: c.primary),
          ),
          const SizedBox(width: Spacing.control),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Dữ liệu đã đồng bộ',
                  style: TypographyTokens.label(context)
                      .copyWith(color: c.textPrimary),
                ),
                const SizedBox(height: 2),
                AppText('Cập nhật lúc 19:28 hôm nay',
                    type: AppTextType.caption, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
