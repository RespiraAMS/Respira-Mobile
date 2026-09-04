import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/design_system/design_system.dart';
import 'package:respira_mobile/features/patient/routes.dart';

import 'helpers/pump_test_app.dart';

/// Clinical patient-flow tests (ft/patient branch): add → detail → progress.

Future<void> _pumpAt(WidgetTester tester, String initialLocation) =>
    pumpTestApp(tester, initialLocation: initialLocation);

Future<void> _settleNavigation(WidgetTester tester) async {
  await tester.pump(const Duration(milliseconds: 400));
  await tester.pump(const Duration(milliseconds: 400));
}

void main() {
  testWidgets('renders the add patient screen', (tester) async {
    await _pumpAt(tester, PatientRoutes.addPatient);

    expect(find.text('Thêm bệnh nhân'), findsOneWidget);
    expect(find.text('Tạo hồ sơ bệnh nhân mới'), findsOneWidget);
    expect(find.text('Lưu hồ sơ'), findsOneWidget);
    expect(find.text('Họ và tên'), findsOneWidget);
  });

  testWidgets('submitting the form navigates to patient detail',
      (tester) async {
    await _pumpAt(tester, PatientRoutes.addPatient);

    await tester.ensureVisible(find.text('Lưu hồ sơ'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Lưu hồ sơ'));
    // POST /patients is async now — wait for it, then for navigation.
    await tester.pump(const Duration(milliseconds: 600));
    await _settleNavigation(tester);

    expect(find.text('Chi tiết bệnh nhân'), findsOneWidget);
    // The form route stays mounted below the pushed detail route, so the
    // name legitimately appears twice (input + header).
    expect(find.text('Nguyễn Minh Khôi'), findsWidgets);
    expect(find.text('Tiến trình điều trị'), findsOneWidget);
  });

  testWidgets('detail actions navigate to add progress screen',
      (tester) async {
    await _pumpAt(tester, PatientRoutes.addPatient);

    await tester.ensureVisible(find.text('Lưu hồ sơ'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Lưu hồ sơ'));
    await tester.pump(const Duration(milliseconds: 600));
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

  testWidgets(
      'Chẩn đoán nav tab: create patient then start empirical treatment '
      'for them', (tester) async {
    await _pumpAt(tester, PatientRoutes.list);

    // 'Chẩn đoán' appears only as the nav label on the list screen.
    await tester.tap(find.text('Chẩn đoán'));
    await _settleNavigation(tester);

    expect(find.text('Thêm bệnh nhân'), findsOneWidget);

    // Fill in a distinguishable patient and save.
    await tester.enterText(
      find.widgetWithText(AppTextField, 'Họ và tên'),
      'Bệnh Nhân Mới',
    );
    await tester.pump(const Duration(milliseconds: 100));

    await tester.ensureVisible(find.text('Lưu hồ sơ'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Lưu hồ sơ'));
    await tester.pump(const Duration(milliseconds: 600));
    await _settleNavigation(tester);

    // Straight into the empirical progress flow — the header shows the
    // patient that was just created (active-patient propagation). The
    // form below still holds the name as an EditableText too, so expect
    // "at least one" rather than exactly one.
    expect(find.text('Thêm diễn biến'), findsOneWidget);
    expect(find.text('Ghi nhận thay đổi điều trị mới nhất'), findsOneWidget);
    expect(find.text('Bệnh Nhân Mới'), findsWidgets);

    // And the wizard continues for that patient.
    await tester.ensureVisible(find.text('Lưu diễn biến'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Lưu diễn biến'));
    await _settleNavigation(tester);

    expect(find.text('Bước 1/5 · Chỉ số nền'), findsOneWidget);
  });
}
