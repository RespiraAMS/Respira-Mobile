import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/core/router/app_router.dart';
import 'package:respira_mobile/core/theme/theme_mode_provider.dart';
import 'package:respira_mobile/design_system/design_system.dart';
import 'package:respira_mobile/main.dart';

/// Pumps the app with an isolated router that starts at `/` so clinical
/// flow tests don't walk through the auth journey every time.
Future<void> _pumpClinicalApp(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [appRouterProvider.overrideWithValue(buildAppRouter())],
      child: const RespiraMobileApp(),
    ),
  );
  // Fixed pumps instead of pumpAndSettle: google_fonts may keep a pending
  // timer while resolving the Inter font in the test environment.
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pump(const Duration(milliseconds: 100));
}

/// Pumps the app with its production router (auth-first entry).
Future<void> _pumpProductionApp(WidgetTester tester) async {
  await tester.pumpWidget(const ProviderScope(child: RespiraMobileApp()));
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pump(const Duration(milliseconds: 100));
}

/// Advances past the splash auto-redirect (~2s) plus settle frames.
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
  testWidgets('renders the add patient screen', (tester) async {
    await _pumpClinicalApp(tester);

    expect(find.text('Thêm bệnh nhân'), findsOneWidget);
    expect(find.text('Tạo hồ sơ bệnh nhân mới'), findsOneWidget);
    expect(find.text('Lưu hồ sơ'), findsOneWidget);
    expect(find.text('Họ và tên'), findsOneWidget);
  });

  testWidgets('submitting the form navigates to patient detail', (
    tester,
  ) async {
    await _pumpClinicalApp(tester);

    await tester.tap(find.text('Lưu hồ sơ'));
    await _settleNavigation(tester);

    expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);
    // The form route stays mounted below the pushed detail route, so the
    // name legitimately appears twice (input + header).
    expect(find.text('Nguyễn Minh Khôi'), findsWidgets);
    expect(find.text('Tiến trình điều trị'), findsOneWidget);
  });

  testWidgets('detail actions navigate to add progress screen', (tester) async {
    await _pumpClinicalApp(tester);

    await tester.tap(find.text('Lưu hồ sơ'));
    await _settleNavigation(tester);

    // Bottom-pinned actions may be below the fold on the test surface.
    await tester.ensureVisible(find.text('Cập nhật trạng thái'));
    await tester.pump(const Duration(milliseconds: 200));

    await tester.tap(find.text('Cập nhật trạng thái'));
    await _settleNavigation(tester);

    expect(find.text('Thêm diễn biến'), findsOneWidget);
    expect(find.text('Loại điều trị'), findsOneWidget);
    expect(find.text('Không thể chỉnh sửa sau khi lưu'), findsOneWidget);
  });

  testWidgets('input text is vertically centered inside its field box', (
    tester,
  ) async {
    await _pumpClinicalApp(tester);

    // The decorated field must be exactly one input-height tall.
    final fieldRect = tester.getRect(find.byType(TextFormField).first);
    expect(fieldRect.height, ControlSize.inputDefault);

    // The editable text region must fill/center within the field: its
    // vertical center matches the field's center within a small tolerance.
    final editText = find
        .descendant(
          of: find.byType(TextFormField).first,
          matching: find.byType(EditableText),
        )
        .first;
    final textRect = tester.getRect(editText);

    expect(textRect.center.dy - fieldRect.center.dy, lessThan(2.0));
    expect(fieldRect.center.dy - textRect.center.dy, lessThan(2.0));
  });
}
