import 'package:go_router/go_router.dart';

import 'screens/curb_65_screen.dart';
import 'screens/diagnosis_result_screen.dart';
import 'screens/icu_criteria_screen.dart';
import 'screens/other_criteria_screen.dart';
import 'screens/resistance_risk_screen.dart';
import 'screens/targeted_treatment_screen.dart';
import 'screens/vitals_screen.dart';

class DiagnosisRoutes {
  static const vitals = '/vitals';
  static const curb65 = '/curb-65';
  static const icuCriteria = '/icu-criteria';
  static const resistanceRisk = '/resistance-risk';
  static const otherCriteria = '/other-criteria';
  static const diagnosisResult = '/diagnosis-result';
  static const targetedTreatment = '/targeted-treatment';
}

final List<RouteBase> diagnosisRoutes = [
  GoRoute(
    path: DiagnosisRoutes.vitals,
    builder: (c, s) => const VitalsScreen(),
  ),
  GoRoute(
    path: DiagnosisRoutes.curb65,
    builder: (c, s) => const Curb65Screen(),
  ),
  GoRoute(
    path: DiagnosisRoutes.icuCriteria,
    builder: (c, s) => const IcuCriteriaScreen(),
  ),
  GoRoute(
    path: DiagnosisRoutes.resistanceRisk,
    builder: (c, s) => const ResistanceRiskScreen(),
  ),
  GoRoute(
    path: DiagnosisRoutes.otherCriteria,
    builder: (c, s) => const OtherCriteriaScreen(),
  ),
  GoRoute(
    path: DiagnosisRoutes.diagnosisResult,
    builder: (c, s) => const DiagnosisResultScreen(),
  ),
  GoRoute(
    path: DiagnosisRoutes.targetedTreatment,
    builder: (c, s) => const TargetedTreatmentScreen(),
  ),
];
