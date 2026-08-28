import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';

class FloatingBottomNav extends StatelessWidget {
  const FloatingBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 32), // Cách đáy màn hình
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: c.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: c.foreground.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(icon: LucideIcons.users, label: 'Bệnh nhân', isActive: false),
          _NavItem(icon: LucideIcons.search, label: 'Tra cứu', isActive: true), // Tab hiện tại
          _NavItem(icon: LucideIcons.stethoscope, label: 'Chẩn đoán', isActive: false),
          _NavItem(icon: LucideIcons.calculator, label: 'Máy tính', isActive: false),
          _NavItem(icon: LucideIcons.barChart, label: 'Thống kê', isActive: false),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const _NavItem({required this.icon, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      decoration: BoxDecoration(
        color: isActive ? c.primarySoft : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIcon(icon, size: 22, color: isActive ? c.primary : c.iconDefault),
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
    );
  }
}