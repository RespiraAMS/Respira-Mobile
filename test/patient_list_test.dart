import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/fake_api_adapter.dart';
import 'helpers/pump_test_app.dart';

/// Patient-list tests: roster render, filters, search, navigation.

Future<FakeApiAdapter> _pumpList(WidgetTester tester) async {
  final adapter = await pumpTestApp(tester, initialLocation: '/');
  // Let the async roster load complete (Dio needs real async time).
  await pumpAsync(tester);
  await pumpAsync(tester);
  return adapter;
}

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets('renders the roster from the API', (tester) async {
    await _pumpList(tester);

    expect(find.text('Danh sách bệnh nhân'), findsOneWidget);
    // Counts derive from the loaded page (mock returns 2 patients: both
    // in treatment).
    expect(find.text('Tất cả · 2'), findsOneWidget);
    expect(find.text('Cần chú ý · 2'), findsOneWidget);
    expect(find.text('Nguy cơ cao · 0'), findsOneWidget);
    expect(find.text('2 bệnh nhân'), findsOneWidget);

    expect(find.text('Khoa'), findsOneWidget);
    expect(find.text('Đang điều trị'), findsWidgets);
  });

  testWidgets('search narrows the roster by code', (tester) async {
    await _pumpList(tester);

    await tester.enterText(find.byType(TextField).first, '0002');
    // setQuery triggers a fresh API call — give it real async time.
    await pumpAsync(tester);
    await pumpAsync(tester);

    expect(find.text('Khoa'), findsNothing);
    expect(find.text('An'), findsOneWidget);
  });

  testWidgets('tapping a card opens the patient detail screen',
      (tester) async {
    await _pumpList(tester);

    await tester.tap(find.text('Khoa'));
    await _settleNavigation(tester);
    // Detail fetches GET /patients/{id} — let it settle.
    await settleApi(tester);

    expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);
  });

  testWidgets('returning from detail refetches the roster (didPopNext)',
      (tester) async {
    final adapter = await _pumpList(tester);

    // A patient created elsewhere appears in the roster after pop.
    adapter.add(
      'GET /api/1/patients',
      MockedResponse(
        200,
        FakeApiAdapter.envelope({
          'metadata': {
            'hasNextPage': false,
            'hasPreviousPage': false,
            'totalItemCount': 3,
            'pageCount': 1,
            'currentPage': 1,
            'pageSize': 10,
          },
          'items': [
            FakeApiAdapter.patient('Khoa', 'BA-2026-0001', 55, 'InTreatment'),
            FakeApiAdapter.patient('An', 'BA-2026-0002', 47, 'InTreatment'),
            FakeApiAdapter.patient('Bình', 'BA-2026-0003', 30, 'Recovered'),
          ],
        }),
      ),
    );

    await tester.tap(find.text('Khoa'));
    await _settleNavigation(tester);
    await settleApi(tester);
    expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);

    // Pop back — didPopNext triggers refresh() which sees 3 patients.
    final navigator = tester.state<NavigatorState>(find.byType(Navigator).first);
    navigator.pop();
    await _settleNavigation(tester);
    await settleApi(tester);
    await settleApi(tester);

    expect(find.text('Danh sách bệnh nhân'), findsOneWidget);
    expect(find.text('Bình'), findsOneWidget);
  });
}
