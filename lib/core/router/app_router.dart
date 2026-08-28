import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/diagnosis/routes.dart';

part 'app_router.g.dart';

GoRouter buildAppRouter({String initialLocation = DiagnosisRoutes.curb65}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [...diagnosisRoutes],
  );
}

@riverpod
GoRouter appRouter(AppRouterRef ref) => buildAppRouter();
