import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/core/router/app_router.dart';
import 'package:respira_mobile/features/patient/routes.dart';
import 'package:respira_mobile/main.dart';

/// Patient-list tests (ft/patient branch): roster render, filters, search,
/// navigation to detail.

Future<void> _pumpList(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appRouterProvider
            .overrideWithValue(buildAppRouter(initialLocation: PatientRoutes.list)),
      ],
      child: const RespiraMobileApp(),
    ),
  );
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pump(const Duration(milliseconds: 100));
}

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets('renders the roster with derived counts', (tester) async {
    await _pumpList(tester);

    expect(find.text('Danh sách bệnh nhân'), findsOneWidget);
    expect(find.text('12 bệnh nhân đang theo dõi'), findsOneWidget);
    // Counts derived from the seeded roster, not hardcoded.
    expect(find.text('Tất cả · 12'), findsOneWidget);
    expect(find.text('Cần chú ý · 3'), findsOneWidget);
    expect(find.text('Nguy cơ cao · 1'), findsOneWidget);
    expect(find.text('12 bệnh nhân'), findsOneWidget);

    expect(find.text('Nguyễn Văn An'), findsOneWidget);
    expect(find.text('Đang điều trị'), findsWidgets);
    expect(find.text('Tử vong'), findsOneWidget);
    expect(find.text('Hồi phục'), findsWidgets);
  });

  testWidgets('filter chip narrows the roster', (tester) async {
    await _pumpList(tester);

    await tester.tap(find.text('Cần chú ý · 3'));
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('3 bệnh nhân'), findsOneWidget);
    expect(find.text('Nguyễn Văn An'), findsOneWidget);
    expect(find.text('Lê Thu Hà'), findsNothing);
  });

  testWidgets('search matches name or record code', (tester) async {
    await _pumpList(tester);

    await tester.enterText(find.byType(TextField).first, '0208');
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('1 bệnh nhân'), findsOneWidget);
    expect(find.text('Lê Thu Hà'), findsOneWidget);
    expect(find.text('Nguyễn Văn An'), findsNothing);
  });

  testWidgets('tapping a card opens the patient detail screen',
      (tester) async {
    await _pumpList(tester);

    await tester.tap(find.text('Nguyễn Văn An'));
    await _settleNavigation(tester);

    expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);
  });
}
