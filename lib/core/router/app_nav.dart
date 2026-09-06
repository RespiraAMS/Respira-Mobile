import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../design_system/design_system.dart';
import '../../features/calculator/routes.dart';
import '../../features/lookup/lookup_routes.dart';
import '../../features/patient/routes.dart';
import '../../features/statistics/routes.dart';

/// The five top-level destinations of the app bottom navigation.
///
/// Declared once — every screen hosting an `AppBottomNavigation` (and the
/// lookup home's floating variant) renders these items.
const List<AppBottomNavItem> appNavItems = [
  AppBottomNavItem(icon: LucideIcons.users, label: 'Bệnh nhân'),
  AppBottomNavItem(icon: LucideIcons.search, label: 'Tra cứu'),
  AppBottomNavItem(icon: LucideIcons.stethoscope, label: 'Chẩn đoán'),
  AppBottomNavItem(icon: LucideIcons.calculator, label: 'Máy tính'),
  AppBottomNavItem(icon: LucideIcons.barChart, label: 'Thống kê'),
];

/// Routes a bottom-navigation tap to its top-level section.
///
/// Semantics: tapping the active tab is a no-op (no duplicate pushes);
/// the workspace home resets the stack (`go`), every other section is
/// pushed so the back button returns to the originating screen.
void onAppNavTap(BuildContext context, int index, {required int activeIndex}) {
  if (index == activeIndex) return;
  switch (index) {
    case 0:
      context.go(PatientRoutes.list);
    case 1:
      context.push(LookupRoutes.lookup);
    case 2:
      // Diagnosis entry: create a patient, then continue with the
      // empirical-treatment flow for them.
      context.push(PatientRoutes.addPatientForDiagnosis);
    case 3:
      context.push(CalculatorRoutes.list);
    case 4:
      context.push(StatisticsRoutes.overview);
  }
}
