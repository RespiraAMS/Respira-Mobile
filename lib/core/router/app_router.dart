import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/diagnosis/routes.dart';
import '../../features/authentication/routes.dart';
import '../../features/calculator/routes.dart';
import '../../features/lookup/lookup_routes.dart';
import '../../features/patient/routes.dart';
import '../../features/statistics/routes.dart';

part 'app_router.g.dart';

/// Shared route lifecycle observer — screens subscribe via [RouteAware]
/// to refetch when they become visible again (e.g. the patient list
/// refreshing after a patient was created).
final RouteObserver<ModalRoute<void>> appRouteObserver =
    RouteObserver<ModalRoute<void>>();

GoRouter buildAppRouter({
  String initialLocation = AuthenticationRoutes.splash,
}) {
  return GoRouter(
    initialLocation: initialLocation,
    observers: [appRouteObserver],
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
