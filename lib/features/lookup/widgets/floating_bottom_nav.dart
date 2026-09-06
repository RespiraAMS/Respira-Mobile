import 'package:flutter/material.dart';
import '../../../../core/router/app_nav.dart';
import '../../../../design_system/design_system.dart';

/// Bottom navigation of the Tra cứu (lookup) screens.
///
/// Floating-pill variant of the app-wide 5-tab layout; the taps route
/// through the shared [onAppNavTap] handler (Tra cứu is active here, so
/// tapping it is a no-op).
class FloatingBottomNav extends StatelessWidget {
  const FloatingBottomNav({super.key});

  static const _activeIndex = 1;

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
          for (var i = 0; i < appNavItems.length; i++)
            _NavItem(
              icon: appNavItems[i].icon,
              label: appNavItems[i].label,
              isActive: i == _activeIndex,
              onTap: () => onAppNavTap(context, i, activeIndex: _activeIndex),
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
