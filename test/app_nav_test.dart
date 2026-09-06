import 'package:flutter_test/flutter_test.dart';

import 'helpers/pump_test_app.dart';

/// Bottom-nav regression tests: 'Tra cứu' (tab 2) must be reachable from
/// every screen hosting the bottom navigation — the calculator screen
/// used to fall into a "coming soon" placeholder toast instead.

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets('Tra cứu opens from the calculator screen bottom nav',
      (tester) async {
    await pumpTestApp(tester, initialLocation: '/calculators');
    await _settleNavigation(tester);

    expect(find.text('Máy tính'), findsWidgets);
    await tester.tap(find.text('Tra cứu'));
    await _settleNavigation(tester);
    for (var i = 0; i < 4; i++) {
      await settleApi(tester);
      await tester.pump(const Duration(milliseconds: 100));
    }

    // Lookup home reached (its unique section header).
    expect(find.text('Danh mục'), findsOneWidget);
  });

  testWidgets('Tra cứu opens from the statistics screen bottom nav',
      (tester) async {
    await pumpTestApp(tester, initialLocation: '/statistics');
    await _settleNavigation(tester);

    expect(find.text('Thống kê'), findsWidgets);
    await tester.tap(find.text('Tra cứu'));
    await _settleNavigation(tester);
    for (var i = 0; i < 4; i++) {
      await settleApi(tester);
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(find.text('Danh mục'), findsOneWidget);
  });

  testWidgets('tapping the active tab does not push a duplicate screen',
      (tester) async {
    await pumpTestApp(tester, initialLocation: '/calculators');
    await _settleNavigation(tester);

    // 'Máy tính' appears as the screen title AND the nav label — target
    // the nav label explicitly.
    await tester.tap(find.text('Máy tính').last);
    await _settleNavigation(tester);

    // Still on the calculator list — a duplicate route would stack it.
    expect(find.text('Máy tính'), findsWidgets);
    expect(find.text('Danh mục'), findsNothing);
  });
}
