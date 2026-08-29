import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/diagnosis/routes.dart';
import '../../features/authentication/routes.dart';
import '../../features/patient/routes.dart';

part 'app_router.g.dart';

GoRouter buildAppRouter({
  String initialLocation = AuthenticationRoutes.splash,
}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [...authenticationRoutes, ...patientRoutes, ...diagnosisRoutes],
  );
}

@riverpod
GoRouter appRouter(AppRouterRef ref) => buildAppRouter();
