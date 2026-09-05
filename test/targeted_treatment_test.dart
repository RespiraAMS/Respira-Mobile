import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/core/router/app_router.dart';
import 'package:respira_mobile/features/patient/routes.dart';
import 'package:respira_mobile/main.dart';

/// Targeted-treatment flow tests (ft/patient branch): switching the
/// treatment-type tab on AddProgress, the targeted variant, the
/// Chẩn đoán vi sinh screen and its selection chips.

Future<void> _pumpProgress(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appRouterProvider.overrideWithValue(
          buildAppRouter(initialLocation: PatientRoutes.progress),
        ),
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

    expect(find.text('Chẩn đoán vi sinh'), findsOneWidget);
    expect(
        find.text('Mỗi đường dùng là một lựa chọn thuốc riêng'), findsOneWidget);
    // Template defaults: two pre-selected options → two chips.
    expect(find.text('P1 · Meropenem · TM'), findsOneWidget);
    expect(find.text('P2 · Amoxicillin · Uống'), findsOneWidget);
    expect(find.text('Amikacin'), findsOneWidget);

    // Toggle a third option on → chip P3 appears.
    await tester.ensureVisible(find.text('Amikacin'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Amikacin'));
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('P3 · Amikacin · TM'), findsOneWidget);
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

    // 'Thống kê' nav label is unique here; 'Lưu điều trị đích' sits at
    // the bottom of the scrollable content.
    await tester.ensureVisible(find.text('Lưu điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Lưu điều trị đích'));
    await _settleNavigation(tester);

    expect(find.text('Đã lưu điều trị đích.'), findsOneWidget);
    expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);

    // Flush the toast auto-dismiss timer before the test ends.
    await tester.pump(const Duration(seconds: 3));
  });
}
