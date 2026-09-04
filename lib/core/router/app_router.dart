import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/diagnosis/routes.dart';
import '../../features/authentication/routes.dart';
import '../../features/calculator/routes.dart';
import '../../features/lookup/lookup_routes.dart';
import '../../features/patient/routes.dart';
import '../../features/statistics/routes.dart';

part 'app_router.g.dart';

GoRouter buildAppRouter({
  String initialLocation = AuthenticationRoutes.splash,
}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      ...authenticationRoutes,
      ...patientRoutes,
      ...diagnosisRoutes,
      ...statisticsRoutes,
      ...calculatorRoutes,
      ...lookupRoutes,
    ],
  );
}

@riverpod
GoRouter appRouter(AppRouterRef ref) => buildAppRouter();
