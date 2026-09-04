import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/features/calculator/routes.dart';
import 'package:respira_mobile/features/patient/routes.dart';
import 'package:respira_mobile/features/patient/widgets/section_label_widget.dart';
import 'package:respira_mobile/features/statistics/routes.dart';

import '../../../../design_system/design_system.dart';
import '../models/calculator.dart';
import '../providers/calculator_providers.dart';
import '../widgets/calculator_entry_row_widget.dart';

/// Route `/calculators` — the 'Máy tính' bottom-nav tab: roster of
/// clinical calculators.
class CalculatorListScreen extends ConsumerWidget {
  const CalculatorListScreen({super.key});

  void _showTabPlaceholder(BuildContext context, String label) {
    showAppToast(context, 'Tab "$label" sẽ được bổ sung sau.');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final entries = ref.watch(calculatorListProvider);

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
              Row(
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
                          'Máy tính',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TypographyTokens.h3(context)
                              .copyWith(color: c.textPrimary),
                        ),
                        const SizedBox(height: 2),
                        AppText('Công cụ tính lâm sàng',
                            type: AppTextType.caption, maxLines: 1),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.section),
              const SectionLabelWidget('Công cụ thường dùng'),
              const SizedBox(height: Spacing.control),
              Expanded(
                child: ListView.separated(
                  itemCount: entries.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: Spacing.inline),
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    return CalculatorEntryRowWidget(
                      calculator: entry,
                      onTap: () {
                        if (entry == CalculatorId.curb65) {
                          context.push(CalculatorRoutes.curb65);
                        } else {
                          showAppToast(context,
                              'Máy tính "${entry.title}" sẽ được bổ sung sau.');
                        }
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: Spacing.inline),
              AppBottomNavigation(
                items: navItems,
                activeIndex: 3,
                onTap: (index) {
                  if (index == 0) {
                    context.go(PatientRoutes.list);
                  } else if (index == 2) {
                    context.push(PatientRoutes.addPatientForDiagnosis);
                  } else if (index == 4) {
                    context.push(StatisticsRoutes.overview);
                  } else if (index != 3) {
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
