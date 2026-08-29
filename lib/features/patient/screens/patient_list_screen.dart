import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../design_system/design_system.dart';
import '../models/patient_summary.dart';
import '../providers/patient_list_controller.dart';
import '../providers/patient_list_provider.dart';
import '../routes.dart';
import '../widgets/patient_card_widget.dart';
import '../widgets/status_filter_chip_widget.dart';

/// Route `/patients` — post-login workspace home: searchable, filterable
/// roster with bottom navigation (§09.6).
class PatientListScreen extends ConsumerWidget {
  const PatientListScreen({super.key});

  void _showTabPlaceholder(BuildContext context, String label) {
    showAppToast(context, 'Tab "$label" sẽ được bổ sung sau.');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final state = ref.watch(patientListControllerProvider);
    final controller = ref.read(patientListControllerProvider.notifier);
    final roster = ref.watch(patientListProvider);
    final visible = ref.watch(visiblePatientsProvider);

    final attentionCount =
        roster.where((p) => p.status == PatientStatus.treating).length;
    final highRiskCount =
        roster.where((p) => p.status == PatientStatus.deceased).length;

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
              _Header(onAttentionSubtitle: '${roster.length} bệnh nhân đang theo dõi'),
              const SizedBox(height: Spacing.section),
              _SearchField(
                query: state.query,
                onChanged: controller.setQuery,
              ),
              const SizedBox(height: Spacing.control),
              Row(
                children: [
                  StatusFilterChipWidget(
                    label: 'Tất cả',
                    count: roster.length,
                    contentColor: c.primary,
                    selected: state.filter == PatientListFilter.all,
                    onTap: () => controller.setFilter(PatientListFilter.all),
                  ),
                  const SizedBox(width: Spacing.inline),
                  StatusFilterChipWidget(
                    label: 'Cần chú ý',
                    count: attentionCount,
                    contentColor: c.warning,
                    selected: state.filter == PatientListFilter.attention,
                    onTap: () =>
                        controller.setFilter(PatientListFilter.attention),
                  ),
                  const SizedBox(width: Spacing.inline),
                  StatusFilterChipWidget(
                    label: 'Nguy cơ cao',
                    count: highRiskCount,
                    contentColor: c.error,
                    selected: state.filter == PatientListFilter.highRisk,
                    onTap: () =>
                        controller.setFilter(PatientListFilter.highRisk),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.section),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${visible.length} bệnh nhân',
                      style: TypographyTokens.bodyMedium(context)
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Material(
                    color: c.surface,
                    borderRadius: BorderRadius.circular(14),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: controller.togglePrioritySort,
                      child: Container(
                        height: ControlSize.touchTargetMin - 4,
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.control,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: c.borderSubtle),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(LucideIcons.arrowDownUp,
                                size: ControlSize.iconSm, color: c.primary),
                            const SizedBox(width: Spacing.xxxs),
                            Text(
                              'Ưu tiên',
                              style: TypographyTokens.label(context)
                                  .copyWith(color: c.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.inline),
              Expanded(
                child: visible.isEmpty
                    ? _EmptyState()
                    : ListView.separated(
                        itemCount: visible.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: Spacing.inline),
                        itemBuilder: (context, index) => PatientCardWidget(
                          patient: visible[index],
                          onTap: () => context.push(PatientRoutes.detail),
                        ),
                      ),
              ),
              const SizedBox(height: Spacing.inline),
              AppBottomNavigation(
                items: navItems,
                activeIndex: 0,
                onTap: (index) {
                  if (index != 0) {
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
  const _Header({required this.onAttentionSubtitle});

  final String onAttentionSubtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;

    return Row(
      children: [
        _CircleAction(
          icon: LucideIcons.logOut,
          background: c.surfaceSecondary,
          foreground: c.iconDefault,
          semanticLabel: 'Đăng xuất',
          onTap: () => showAppToast(
            context,
            'Đăng xuất sẽ được bổ sung sau.',
          ),
        ),
        const SizedBox(width: Spacing.group),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Danh sách bệnh nhân',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TypographyTokens.h3(context)
                    .copyWith(color: c.textPrimary),
              ),
              const SizedBox(height: 2),
              AppText(onAttentionSubtitle,
                  type: AppTextType.caption, maxLines: 1),
            ],
          ),
        ),
        const SizedBox(width: Spacing.group),
        _CircleAction(
          icon: LucideIcons.userPlus,
          background: c.primary,
          foreground: c.onPrimary,
          semanticLabel: 'Thêm bệnh nhân',
          onTap: () => context.push(PatientRoutes.addPatient),
        ),
      ],
    );
  }
}

class _CircleAction extends StatelessWidget {
  const _CircleAction({
    required this.icon,
    required this.background,
    required this.foreground,
    required this.semanticLabel,
    required this.onTap,
  });

  final IconData icon;
  final Color background;
  final Color foreground;
  final String semanticLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: ControlSize.touchTargetMin,
        height: ControlSize.touchTargetMin,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: AppIcon(icon, size: ControlSize.iconXl, color: foreground,
                semanticLabel: semanticLabel),
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.query, required this.onChanged});

  final String query;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      height: ControlSize.buttonLarge,
      padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
      decoration: BoxDecoration(
        color: c.surfaceSecondary,
        borderRadius: AppRadius.full,
        border: Border.all(color: c.borderSubtle),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.search,
              size: ControlSize.iconMd, color: c.textSecondary),
          const SizedBox(width: Spacing.control),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: TextStyle(fontSize: 15, color: c.textPrimary),
              cursorColor: c.primary,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                hintText: 'Tìm theo tên hoặc mã bệnh án',
                hintStyle: TextStyle(fontSize: 15, color: c.textSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.searchX,
              size: ControlSize.iconBase * 2, color: c.iconMuted),
          const SizedBox(height: Spacing.control),
          AppText('Không tìm thấy bệnh nhân phù hợp.',
              type: AppTextType.caption,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
