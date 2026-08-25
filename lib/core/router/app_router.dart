import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/authentication/routes.dart';

part 'app_router.g.dart';

GoRouter buildAppRouter({String initialLocation = '/splash'}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [...authenticationRoutes],
  );
}

@riverpod
GoRouter appRouter(AppRouterRef ref) => buildAppRouter();
