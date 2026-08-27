import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/patient/routes.dart';

part 'app_router.g.dart';

GoRouter buildAppRouter({String initialLocation = PatientRoutes.addPatient}) {
  return GoRouter(initialLocation: initialLocation, routes: [...patientRoutes]);
}

@riverpod
GoRouter appRouter(AppRouterRef ref) => buildAppRouter();
