import 'package:go_router/go_router.dart';

import 'screens/calculator_detail_screen.dart';
import 'screens/calculator_list_screen.dart';

class CalculatorRoutes {
  static const list = '/calculators';
  static const curb65 = '/calculators/curb-65';
}

final List<RouteBase> calculatorRoutes = [
  GoRoute(
    path: CalculatorRoutes.list,
    builder: (context, state) => const CalculatorListScreen(),
  ),
  GoRoute(
    path: CalculatorRoutes.curb65,
    builder: (context, state) => const CalculatorDetailScreen(),
  ),
];
