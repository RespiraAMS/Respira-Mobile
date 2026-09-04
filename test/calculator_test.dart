import 'package:flutter_test/flutter_test.dart';


import 'package:respira_mobile/design_system/design_system.dart';

import 'helpers/pump_test_app.dart';

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

/// Calculator tests (ft/calculator branch): Máy tính list, CURB-65 detail
/// (inputs → Tính → result) and the Giải thích tab.

Future<void> _pumpList(WidgetTester tester) =>
    pumpTestApp(tester, initialLocation: '/calculators');

void main() {
  testWidgets('renders the calculator list with all five tools',
      (tester) async {
    await _pumpList(tester);

    expect(find.text('Máy tính'), findsWidgets);
    expect(find.text('Công cụ tính lâm sàng'), findsOneWidget);
    expect(find.text('CURB-65'), findsWidgets);
    expect(find.text('eGFR'), findsOneWidget);
    expect(find.text('CrCl'), findsOneWidget);
    expect(find.text('BMI'), findsOneWidget);
    expect(find.text('qSOFA'), findsOneWidget);
  });

  testWidgets('CURB-65 flow: inputs → Tính → derived result',
      (tester) async {
    await _pumpList(tester);

    await tester.tap(find.text('CURB-65'));
    await _settleNavigation(tester);

    expect(find.text('Nhập liệu'), findsOneWidget);
    expect(find.text('Tiêu chí CURB-65'), findsOneWidget);

    // Turn confusion ON (this calculator starts unchecked) + urea 9 (>7)
    // + age 70 (≥65) → score 3 → 'Nguy cơ cao'.
    await tester.tap(find.text('Lú lẫn mới xuất hiện'));
    await tester.pump(const Duration(milliseconds: 100));
    await tester.enterText(find.widgetWithText(AppUnitField, 'Urea'), '9');
    await tester.enterText(find.widgetWithText(AppUnitField, 'Tuổi'), '70');
    await tester.pump(const Duration(milliseconds: 100));

    // No result before pressing Tính.
    expect(find.text('3 điểm'), findsNothing);

    // Tính is pinned at the bottom; the result card appears above it.
    await tester.tap(find.text('Tính'));
    await tester.pump(const Duration(milliseconds: 200));

    expect(
      find.text('3 điểm', skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.text('Nguy cơ cao', skipOffstage: false),
      findsOneWidget,
    );
    expect(
      find.text('Điểm 3 → cân nhắc điều trị nội trú', skipOffstage: false),
      findsOneWidget,
    );
  });

  testWidgets('empty inputs score zero with low risk', (tester) async {
    await _pumpList(tester);

    await tester.tap(find.text('CURB-65'));
    await _settleNavigation(tester);

    // Nothing entered and confusion unchecked → score 0. Tính is pinned
    // at the bottom; the result card appears above it.
    await tester.tap(find.text('Tính'));
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('0 điểm', skipOffstage: false), findsOneWidget);
    expect(find.text('Nguy cơ thấp', skipOffstage: false), findsOneWidget);
  });

  testWidgets('explanation tab shows the method description',
      (tester) async {
    await _pumpList(tester);

    await tester.tap(find.text('CURB-65'));
    await _settleNavigation(tester);

    await tester.tap(find.text('Giải thích'));
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Phương pháp tính'), findsOneWidget);
    expect(find.text('Mô tả'), findsOneWidget);
    expect(find.text('Các thành phần'), findsOneWidget);
  });
}
