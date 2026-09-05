import 'package:go_router/go_router.dart';

import 'screens/statistics_screen.dart';

class StatisticsRoutes {
  static const overview = '/statistics';
}

final List<RouteBase> statisticsRoutes = [
  GoRoute(
    path: StatisticsRoutes.overview,
    builder: (context, state) => const StatisticsScreen(),
  ),
];
