import 'package:go_router/go_router.dart';

import 'screens/add_patient_screen.dart';
import 'screens/add_progress_screen.dart';
import 'screens/patient_detail_screen.dart';
import 'screens/patient_list_screen.dart';

/// Typed path constants for the patient feature.
class PatientRoutes {
  /// Post-login workspace home (patient roster).
  static const list = '/';
  static const addPatient = '/patient/add';
  static const detail = '/patient/detail';
  static const progress = '/patient/progress';
}

final List<RouteBase> patientRoutes = [
  GoRoute(
    path: PatientRoutes.list,
    builder: (context, state) => const PatientListScreen(),
  ),
  GoRoute(
    path: PatientRoutes.addPatient,
    builder: (context, state) => const AddPatientScreen(),
  ),
  GoRoute(
    path: PatientRoutes.detail,
    builder: (context, state) => const PatientDetailScreen(),
  ),
  GoRoute(
    path: PatientRoutes.progress,
    builder: (context, state) => const AddProgressScreen(),
  ),
];
