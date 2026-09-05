import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../lookup_routes.dart';
import '../../../../design_system/design_system.dart';
/// Bottom navigation of the Tra cứu (lookup) screens.
///
/// Mirrors the app-wide 5-tab layout; tapping the other tabs routes back
/// into the main app sections.
class FloatingBottomNav extends StatelessWidget {
  const FloatingBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: c.borderSubtle),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(
            icon: LucideIcons.users,
            label: 'Bệnh nhân',
            isActive: false,
            onTap: () => context.go('/'),
          ),
          _NavItem(
            icon: LucideIcons.search,
            label: 'Tra cứu',
            isActive: true,
            onTap: () => context.go(LookupRoutes.lookup),
          ),
          _NavItem(
            icon: LucideIcons.stethoscope,
            label: 'Chẩn đoán',
            isActive: false,
            onTap: () => context.push('/patient/add?flow=diagnosis'),
          ),
          _NavItem(
            icon: LucideIcons.calculator,
            label: 'Máy tính',
            isActive: false,
            onTap: () => context.push('/calculators'),
          ),
          _NavItem(
            icon: LucideIcons.barChart,
            label: 'Thống kê',
            isActive: false,
            onTap: () => context.push('/statistics'),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? c.primarySoft : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(icon,
                size: 22, color: isActive ? c.primary : c.iconDefault),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? c.primary : c.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
