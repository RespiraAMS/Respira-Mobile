import 'package:flutter_test/flutter_test.dart';


import 'helpers/pump_test_app.dart';

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

/// Statistics tests (ft/statistics branch): overview render, period
/// switching, bottom-nav navigation both ways.

Future<void> _pumpStatistics(WidgetTester tester) =>
    pumpTestApp(tester, initialLocation: '/statistics');

void main() {
  testWidgets('renders the overview with KPIs, chart and pathogens',
      (tester) async {
    await _pumpStatistics(tester);

    expect(find.text('Tổng quan hoạt động điều trị'), findsOneWidget);
    // 30-day dataset (template numbers).
    expect(find.text('128'), findsOneWidget);
    expect(find.text('+12%'), findsOneWidget);
    expect(find.text('S. pneumoniae'), findsOneWidget);
    expect(find.text('Chẩn đoán theo tuần'), findsOneWidget);
    expect(find.text('Dữ liệu đã đồng bộ'), findsOneWidget);
  });

  testWidgets('switching the range swaps the dataset', (tester) async {
    await _pumpStatistics(tester);

    expect(find.text('128'), findsOneWidget);

    await tester.tap(find.text('Quý này'));
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('384'), findsOneWidget);
    expect(find.text('128'), findsNothing);
  });

  testWidgets('bottom navigation reaches the patient list and back',
      (tester) async {
    await _pumpStatistics(tester);

    // 'Bệnh nhân' appears once (nav label only — the title says
    // 'Danh sách bệnh nhân' after navigation).
    await tester.tap(find.text('Bệnh nhân'));
    await _settleNavigation(tester);
    expect(find.text('Danh sách bệnh nhân'), findsOneWidget);

    // And back via the statistics tab. The stats screen (title + its own
    // active label) can still be alive below, so target the last match —
    // the list's inactive nav label.
    await tester.tap(find.text('Thống kê').last);
    await _settleNavigation(tester);
    expect(find.text('Tổng quan hoạt động điều trị'), findsOneWidget);
  });
}
