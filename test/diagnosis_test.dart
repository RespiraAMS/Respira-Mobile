import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/core/router/app_router.dart';
import 'package:respira_mobile/core/theme/theme_mode_provider.dart';
import 'package:respira_mobile/design_system/design_system.dart';
import 'package:respira_mobile/features/patient/routes.dart';
import 'package:respira_mobile/main.dart';

/// Pumps the app with an isolated router that starts on the add-patient
/// screen so clinical flow tests skip the auth journey entirely.
Future<void> _pumpClinicalApp(WidgetTester tester) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appRouterProvider.overrideWithValue(
          buildAppRouter(initialLocation: PatientRoutes.addPatient),
        ),
      ],
      child: const RespiraMobileApp(),
    ),
  );
  // Fixed pumps instead of pumpAndSettle: google_fonts may keep a pending
  // timer while resolving the Inter font in the test environment.
  await tester.pump(const Duration(milliseconds: 100));
  await tester.pump(const Duration(milliseconds: 100));
}

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets(
    'saving progress walks the diagnosis wizard CURB-65 → result + save',
    (tester) async {
      await _pumpClinicalApp(tester);

      await tester.tap(find.text('Lưu hồ sơ'));
      await _settleNavigation(tester);

      await tester.ensureVisible(find.text('Cập nhật trạng thái'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Cập nhật trạng thái'));
      await _settleNavigation(tester);

      // Step 1/5: vitals.
      await tester.ensureVisible(find.text('Lưu diễn biến'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Lưu diễn biến'));
      await _settleNavigation(tester);

      expect(find.text('Bước 1/5 · Thông số lâm sàng'), findsOneWidget);
      expect(find.text('Thông số lâm sàng'), findsOneWidget);
      await tester.enterText(
          find.widgetWithText(AppUnitField, 'Chiều cao'), '170');
      await tester.enterText(
          find.widgetWithText(AppUnitField, 'Cân nặng'), '65');
      await tester.enterText(
          find.widgetWithText(AppUnitField, 'Creatinine máu'), '80');
      await tester.pump(const Duration(milliseconds: 100));

      // Continue to step 2/5: CURB-65.
      await tester.tap(find.text('Tiếp tục'));
      await _settleNavigation(tester);

      expect(find.text('Bước 2/5 · CURB-65'), findsOneWidget);
      expect(find.text('CURB-65'), findsOneWidget);
      expect(find.text('Lú lẫn mới xuất hiện'), findsOneWidget);

      // Confusion (pre-checked) + urea 9 (>7) + age 70 (≥65) → score 3.
      await tester.enterText(find.widgetWithText(AppUnitField, 'Urea'), '9');
      await tester.enterText(find.widgetWithText(AppUnitField, 'Tuổi'), '70');
      await tester.pump(const Duration(milliseconds: 100));

      // Continue to step 3/5 (button may be below the test fold).
      await tester.ensureVisible(find.text('Tiếp tục').last);
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Tiếp tục').last);
      await _settleNavigation(tester);

      expect(find.text('Bước 3/5 · Tiêu chuẩn nhập ICU'), findsOneWidget);
      expect(find.text('Tiêu chuẩn nhập ICU'), findsOneWidget);
      expect(find.text('Cần thở máy xâm nhập'), findsOneWidget);

      // PaO₂/FiO₂ is now a measured input (≤ 250 → supports ICU care).
      expect(find.text('PaO₂/FiO₂'), findsOneWidget);
      await tester.enterText(
          find.widgetWithText(AppUnitField, 'PaO₂/FiO₂'), '220');
      await tester.pump(const Duration(milliseconds: 100));

      // Continue to step 4/5. Wizard steps keep a 'Tiếp tục' button alive
      // below the pushed route, so target the topmost one.
      await tester.tap(find.text('Tiếp tục').last);
      await _settleNavigation(tester);

      expect(find.text('Bước 4/5 · Nguy cơ kháng thuốc'), findsOneWidget);
      expect(find.text('Yếu tố nguy cơ kháng thuốc'), findsOneWidget);
      expect(find.text('Dùng kháng sinh 90 ngày gần đây'), findsOneWidget);
      expect(find.text('Nằm viện ≥ 5 ngày'), findsOneWidget);

      // Continue to step 5/5.
      await tester.tap(find.text('Tiếp tục').last);
      await _settleNavigation(tester);

      expect(find.text('Bước 5/5 · Tiêu chí khác'), findsOneWidget);
      expect(find.text('Tiêu chí khác'), findsOneWidget);
      expect(find.text('Tiêu chí bổ sung'), findsOneWidget);
      expect(find.text('Chẩn đoán'), findsOneWidget);

      // ── Diagnosis result (3 tabs) ──────────────────────────────────
      await tester.tap(find.text('Chẩn đoán'));
      await _settleNavigation(tester);

      expect(find.text('Kết quả chẩn đoán'), findsOneWidget);
      expect(find.text('Kinh nghiệm · Viêm phổi cộng đồng'), findsOneWidget);
      // Derived CURB-65 score: confusion ✓ + urea 9 (>7) + age 70 (≥65).
      expect(find.text('CURB-65'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('Viêm phổi cộng đồng'), findsOneWidget);
      expect(find.text('Nguy cơ cao'), findsOneWidget);

      await tester.tap(find.text('Thuốc khuyến nghị'));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.text('Ceftriaxone'), findsOneWidget);
      expect(find.text('Levofloxacin'), findsOneWidget);

      await tester.tap(find.text('Tham khảo'));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.text('Bộ Y tế · v3 · 2024'), findsOneWidget);

      // ── Confirm dialog completes the route ────────────────────────
      await tester.ensureVisible(find.text('Lưu kết quả'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Lưu kết quả'));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Lưu kết quả chẩn đoán?'), findsOneWidget);
      expect(find.text('Đã chọn 2 phác đồ · 4 thuốc'), findsOneWidget);

      // Cancel first — dialog closes, screen stays.
      await tester.tap(find.text('Hủy'));
      await _settleNavigation(tester);
      expect(find.text('Kết quả chẩn đoán'), findsOneWidget);

      await tester.ensureVisible(find.text('Lưu kết quả'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Lưu kết quả'));
      await tester.pump(const Duration(milliseconds: 300));
      await tester.tap(find.text('Xác nhận lưu'));
      await _settleNavigation(tester);

      expect(find.text('Đã lưu kết quả chẩn đoán.'), findsOneWidget);
      expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);

      // Flush the toast auto-dismiss timer before the test ends.
      await tester.pump(const Duration(seconds: 3));
    },
  );

  testWidgets('theme mode defaults to system and can be forced', (
    tester,
  ) async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final themeMode = container.read(themeModeControllerProvider);
    expect(themeMode, ThemeMode.system);

    container.read(themeModeControllerProvider.notifier).setDark();
    expect(container.read(themeModeControllerProvider), ThemeMode.dark);
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
