import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/core/theme/theme_mode_provider.dart';
import 'package:respira_mobile/design_system/design_system.dart';
import 'package:respira_mobile/features/patient/routes.dart';

import 'helpers/fill_add_patient_form.dart';
import 'helpers/pump_test_app.dart';

Future<void> _pumpClinicalApp(WidgetTester tester) =>
    pumpTestApp(tester, initialLocation: PatientRoutes.addPatient);

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets(
    'saving progress walks the diagnosis wizard CURB-65 → result + save',
    (tester) async {
      await _pumpClinicalApp(tester);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      // The form now starts empty — fill everything (BHYT exactly 10
      // chars) so validation lets the submit through.
      await fillAddPatientForm(tester, name: 'Nguyễn Minh Khôi');

      await tester.ensureVisible(find.text('Lưu hồ sơ'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Lưu hồ sơ'));
      await tester.pump(const Duration(milliseconds: 600));
      await _settleNavigation(tester);
      // Detail now fetches GET /patients/{id} — let it settle.
      await settleApi(tester);

      await tester.ensureVisible(find.text('Cập nhật trạng thái'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Cập nhật trạng thái'));
      await _settleNavigation(tester);

      // Step 1/5: vitals.
      await tester.ensureVisible(find.text('Lưu diễn biến'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Lưu diễn biến'));
      await _settleNavigation(tester);

      expect(find.text('Bước 1/5 · Chỉ số nền'), findsOneWidget);
      expect(find.text('Chỉ số cơ thể và chức năng thận'), findsOneWidget);
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
      expect(find.text('Lú lẫn mới xuất hiện'), findsOneWidget);

      // Confusion (pre-checked) + urea 9 (>7) + age 70 (≥65) → score 3.
      await tester.enterText(find.widgetWithText(AppUnitField, 'Urea'), '9');
      await tester.enterText(find.widgetWithText(AppUnitField, 'Tuổi'), '70');
      await tester.pump(const Duration(milliseconds: 100));

      // Continue to step 3/5. Unfocus first (caret visibility pins the
      // scroll), then drag the CURB scroll view from the app-bar area —
      // the button is below the fold after the Huyết áp dual-field was
      // added.
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pump();
      await tester.dragFrom(const Offset(400, 40), const Offset(0, -260));
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      await tester.tap(find.text('Tiếp tục'));
      await _settleNavigation(tester);

      expect(find.text('Bước 3/5 · Tiêu chuẩn nhập ICU'), findsOneWidget);
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
      expect(find.text('Dùng kháng sinh 90 ngày gần đây'), findsOneWidget);

      // Continue to step 5/5.
      await tester.tap(find.text('Tiếp tục').last);
      await _settleNavigation(tester);

      expect(find.text('Bước 5/5 · Tiêu chí khác'), findsOneWidget);
      expect(find.text('Không dung nạp thuốc'), findsOneWidget);

      // ── Diagnosis result (3 tabs) ──────────────────────────────────
      await tester.tap(find.text('Chẩn đoán').last);
      await _settleNavigation(tester);

      expect(find.text('Kết quả chẩn đoán'), findsWidgets);
      expect(find.text('Kinh nghiệm · Viêm phổi cộng đồng'), findsOneWidget);
      // Derived CURB-65 score: confusion ✓ + urea 9 (>7) + age 70 (≥65).
      expect(find.text('CURB-65'), findsWidgets);
      expect(find.text('3'), findsWidgets);
      expect(find.text('Viêm phổi cộng đồng'), findsWidgets);
      // Severity tile + basis summary per the approved design.
      expect(find.text('Mức độ'), findsOneWidget);
      expect(find.text('Cao'), findsOneWidget);
      expect(find.text('CURB-65 = 3'), findsOneWidget);

      await tester.tap(find.text('Thuốc khuyến nghị').last);
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.text('Meropenem'), findsWidgets);

      await tester.tap(find.text('Tham khảo').last);
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.text('Phác đồ A · Viêm phổi cộng đồng'), findsOneWidget);

      // ── Confirm dialog completes the route ────────────────────────
      await tester.ensureVisible(find.text('Xác nhận chẩn đoán'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Xác nhận chẩn đoán'));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Lưu kết quả chẩn đoán?'), findsOneWidget);

      // Cancel first — dialog closes, screen stays.
      await tester.tap(find.text('Hủy'));
      await _settleNavigation(tester);
      expect(find.text('Kết quả chẩn đoán'), findsWidgets);

      await tester.ensureVisible(find.text('Xác nhận chẩn đoán'));
      await tester.pump(const Duration(milliseconds: 200));
      await tester.tap(find.text('Xác nhận chẩn đoán'));
      await tester.pump(const Duration(milliseconds: 300));
      await tester.tap(find.text('Xác nhận lưu'));
      await tester.pump(const Duration(milliseconds: 600));
      await _settleNavigation(tester);
      // Detail refetches GET /patients/{id} (provider invalidated after
      // the save) — let it settle before asserting the fresh timeline.
      await settleApi(tester);

      // Success toast now fires on the destination screen.
      expect(find.text('Đã lưu kết quả chẩn đoán.'), findsOneWidget);
      expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);
      // The refreshed timeline carries the treatment just created.
      expect(find.text('Điều trị kinh nghiệm'), findsOneWidget);

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

    final fieldRect = tester.getRect(find.byType(TextFormField).first);
    expect(fieldRect.height, ControlSize.inputDefault);

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
