import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/design_system/design_system.dart';

import 'helpers/pump_test_app.dart';

Future<void> _pumpProductionApp(WidgetTester tester) =>
    pumpTestApp(tester, initialLocation: '/splash');

Future<void> _skipSplash(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 2, milliseconds: 500));
  await tester.pump(const Duration(milliseconds: 300));
  await tester.pump(const Duration(milliseconds: 300));
}

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}
void main() {
  testWidgets('splash advances to the login screen', (tester) async {
    await _pumpProductionApp(tester);

    expect(find.text('RespiraAMS'), findsWidgets);
    expect(
      find.text('Clinical workspace for respiratory care'),
      findsOneWidget,
    );

    // Splash auto-advances after ~2s — landing on Login (Welcome now
    // comes *after* a successful sign-in).
    await _skipSplash(tester);

    expect(
      find.text('Tiếp tục vào không gian làm việc RespiraAMS.'),
      findsOneWidget,
    );
    expect(find.text('Quên mật khẩu?'), findsOneWidget);
  });

  testWidgets('login lands on welcome, Bắt đầu enters the workspace', (
    tester,
  ) async {
    await _pumpProductionApp(tester);
    await _skipSplash(tester);

    await tester.enterText(find.byType(TextField).first, 'bs.minh@respira.vn');
    await tester.enterText(find.byType(TextField).last, 'secret123');
    await tester.pump(const Duration(milliseconds: 100));

    // Two 'Đăng nhập' texts exist (title + button) → target the button
    // via its widget-type pairing. The API call is real-async now.
    await tester.tap(find.widgetWithText(AppButton, 'Đăng nhập'));
    await pumpAsync(tester);
    await pumpAsync(tester);
    await _settleNavigation(tester);

    // Post-login landing page.
    expect(find.text('MOBILE CLINICAL WORKSPACE'), findsOneWidget);
    expect(find.text('Bắt đầu'), findsOneWidget);

    // Enter the clinical workspace.
    await tester.tap(find.text('Bắt đầu'));
    await _settleNavigation(tester);
    expect(find.text('Danh sách bệnh nhân'), findsOneWidget);
  });

  testWidgets('password reset flow reaches the success screen', (tester) async {
    await _pumpProductionApp(tester);
    await _skipSplash(tester);

    // We are already on Login in the new order.
    expect(
      find.text('Tiếp tục vào không gian làm việc RespiraAMS.'),
      findsOneWidget,
    );

    // Login → Forgot password.
    await tester.tap(find.text('Quên mật khẩu?'));
    await _settleNavigation(tester);
    expect(
      find.text(
        'Nhập email công việc. Hệ thống sẽ gửi mã xác thực gồm 6 chữ số.',
      ),
      findsOneWidget,
    );

    // Submit email.
    await tester.enterText(find.byType(TextField).last, 'bs.minh@respira.vn');
    await tester.ensureVisible(find.text('Gửi mã xác thực'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Gửi mã xác thực'));
    await _settleNavigation(tester);
    expect(find.text('Nhập mã xác thực'), findsOneWidget);

    // Enter the 6-digit code into the hidden capture field.
    await tester.enterText(find.byType(TextField).last, '482107');
    await tester.pump(const Duration(milliseconds: 100));
    await tester.ensureVisible(find.text('Xác nhận'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Xác nhận'));
    await _settleNavigation(tester);
    expect(find.text('Tạo mật khẩu mới'), findsOneWidget);

    // Fill both password fields (topmost screen owns the last two inputs).
    final fields = find.byType(TextField);
    final fieldCount = fields.evaluate().length;
    await tester.enterText(fields.at(fieldCount - 2), 'Abcdef1!');
    await tester.enterText(fields.last, 'Abcdef1!');
    await tester.pump(const Duration(milliseconds: 100));

    // Requirements must all be met for submit to be enabled.
    expect(find.text('Mật khẩu cần có'), findsOneWidget);
    await tester.ensureVisible(find.text('Cập nhật mật khẩu'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Cập nhật mật khẩu'));
    await _settleNavigation(tester);

    expect(find.text('Mật khẩu đã được cập nhật'), findsOneWidget);
    expect(find.text('BS. Lê Hoàng Minh'), findsOneWidget);
    expect(find.text('Không gian làm việc đã sẵn sàng'), findsOneWidget);
  });
}
