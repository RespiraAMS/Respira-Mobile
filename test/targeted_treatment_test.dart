import 'package:flutter_test/flutter_test.dart';

import 'helpers/pump_test_app.dart';

/// Targeted-treatment flow tests: switching the treatment-type tab, the
/// targeted variant, the Chẩn đoán vi sinh screen and its selection chips.

Future<void> _pumpProgress(WidgetTester tester) =>
    pumpTestApp(tester, initialLocation: '/patient/progress');

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets(
      'selecting Điều trị đích swaps the form to the targeted variant',
      (tester) async {
    await _pumpProgress(tester);

    // Empirical variant by default.
    expect(find.text('Lý do thay đổi'), findsOneWidget);
    expect(find.text('Lưu diễn biến'), findsOneWidget);

    await tester.tap(find.text('Điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));

    // Targeted variant.
    expect(find.text('Dựa trên kết quả vi sinh đã có'), findsOneWidget);
    expect(find.text('Loại điều trị tiếp theo'), findsOneWidget);
    expect(find.text('Klebsiella pneumoniae'), findsOneWidget);
    expect(find.text('Kháng sinh đồ gần nhất'), findsOneWidget);
    expect(find.text('Điều trị đích dựa trên kết quả vi sinh'), findsOneWidget);
    expect(find.text('Tiếp tục điều trị đích'), findsOneWidget);
    expect(find.text('Lưu diễn biến'), findsNothing);
  });

  testWidgets('targeted CTA opens Chẩn đoán vi sinh with derived chips',
      (tester) async {
    await _pumpProgress(tester);

    await tester.tap(find.text('Điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));

    await tester.ensureVisible(find.text('Tiếp tục điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Tiếp tục điều trị đích'));
    await _settleNavigation(tester);
    for (var i = 0; i < 12; i++) {
      await settleApi(tester);
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(find.text('Chẩn đoán vi sinh'), findsOneWidget);
    expect(
        find.text('Mỗi đường dùng là một lựa chọn thuốc riêng'),
        findsOneWidget);
    // Recommendations from POST /diagnose/target (mock).
    expect(find.text('Meropenem'), findsOneWidget);
    expect(find.text('Amikacin'), findsOneWidget);

    // Nothing selected initially → no chips. Select Meropenem → P1 chip.
    expect(
        find.text('P1 · Meropenem · TM', skipOffstage: false), findsNothing);
    await tester.tap(find.text('Meropenem'));
    await tester.pump(const Duration(milliseconds: 200));
    expect(
        find.text('P1 · Meropenem · TM', skipOffstage: false), findsOneWidget);

    // Select Amikacin → P2 chip appears.
    await tester.ensureVisible(find.text('Amikacin'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Amikacin'));
    await tester.pump(const Duration(milliseconds: 200));
    expect(
        find.text('P2 · Amikacin · TM', skipOffstage: false), findsOneWidget);
  });

  testWidgets('saving targeted treatment lands on patient detail',
      (tester) async {
    await _pumpProgress(tester);

    await tester.tap(find.text('Điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.ensureVisible(find.text('Tiếp tục điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Tiếp tục điều trị đích'));
    await _settleNavigation(tester);
    for (var i = 0; i < 12; i++) {
      await settleApi(tester);
      await tester.pump(const Duration(milliseconds: 100));
    }

    await tester.tap(find.text('Meropenem'));
    await tester.pump(const Duration(milliseconds: 200));

    await tester.ensureVisible(find.text('Lưu điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Lưu điều trị đích'));
    await tester.pump(const Duration(milliseconds: 600));
    await _settleNavigation(tester);

    expect(find.text('Đã lưu điều trị đích.'), findsOneWidget);
    expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);

    // Flush the toast auto-dismiss timer before the test ends.
    await tester.pump(const Duration(seconds: 3));
  });
}
