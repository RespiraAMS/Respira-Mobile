import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/features/patient/routes.dart';

import 'helpers/fake_api_adapter.dart';
import 'helpers/fill_add_patient_form.dart';
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

    // Empirical variant by default — the reason-checkbox section is
    // gone; only the editability warning remains.
    expect(find.text('Lý do thay đổi'), findsNothing);
    expect(find.text('Có kết quả vi sinh'), findsNothing);
    expect(find.text('Không thể chỉnh sửa sau khi lưu'), findsOneWidget);
    expect(find.text('Lưu diễn biến'), findsOneWidget);

    await tester.tap(find.text('Điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));

    // Targeted variant: the doctor-selectable pathogen picker (API
    // backed, first pathogen by default) + guidance alert. The demo
    // antibiogram banner is gone.
    expect(find.text('Dựa trên kết quả vi sinh đã có'), findsOneWidget);
    expect(find.text('Loại điều trị tiếp theo'), findsOneWidget);
    for (var i = 0; i < 8; i++) {
      await settleApi(tester);
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.text('Klebsiella pneumoniae'), findsOneWidget);
    expect(find.text('Kháng sinh đồ gần nhất'), findsNothing);
    expect(find.text('Điều trị đích dựa trên kết quả vi sinh'), findsOneWidget);
    expect(find.text('Tiếp tục điều trị đích'), findsOneWidget);
    expect(find.text('Lưu diễn biến'), findsNothing);
  });

  testWidgets('doctor picks the pathogen on Add progress; vi sinh follows',
      (tester) async {
    await _pumpProgress(tester);

    await tester.tap(find.text('Điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));
    for (var i = 0; i < 8; i++) {
      await settleApi(tester);
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(find.text('Klebsiella pneumoniae'), findsOneWidget);

    // Open the picker on the progress screen — both pathogens listed.
    await tester.tap(find.text('Klebsiella pneumoniae'), warnIfMissed: true);
    await tester.pumpAndSettle(const Duration(milliseconds: 300));
    expect(find.text('Chọn tác nhân gây bệnh'), findsOneWidget);
    expect(find.text('Pseudomonas aeruginosa'), findsOneWidget);

    // Switch to Pseudomonas.
    await tester.tap(find.text('Pseudomonas aeruginosa'));
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
    expect(find.text('Pseudomonas aeruginosa'), findsOneWidget);

    // Continue into Chẩn đoán vi sinh — the choice carries over and the
    // pathogen shows read-only.
    await tester.ensureVisible(find.text('Tiếp tục điều trị đích'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Tiếp tục điều trị đích'));
    await _settleNavigation(tester);
    for (var i = 0; i < 12; i++) {
      await settleApi(tester);
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(find.text('Chẩn đoán vi sinh'), findsOneWidget);
    expect(find.text('Pseudomonas aeruginosa'), findsOneWidget);
    expect(find.text('Klebsiella pneumoniae'), findsNothing);
    // Medicines for the chosen pathogen loaded.
    expect(find.text('Meropenem'), findsOneWidget);
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
    // Options from POST /diagnose/target (mock).
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
    // Create a real patient first — treatment saves require an active
    // patient with a server id (empty-id saves are rejected client-side).
    await pumpTestApp(tester, initialLocation: PatientRoutes.addPatient);
    await fillAddPatientForm(tester, name: 'Nguyễn Minh Khôi');
    await tester.ensureVisible(find.text('Lưu hồ sơ'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Lưu hồ sơ'));
    await tester.pump(const Duration(milliseconds: 600));
    await _settleNavigation(tester);
    await settleApi(tester);

    // Add-patient flow (no ?flow=diagnosis) lands on detail — continue
    // into the progress screen from there.
    await tester.ensureVisible(find.text('Thêm điều trị'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.tap(find.text('Thêm điều trị'));
    await _settleNavigation(tester);
    await settleApi(tester);

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

  testWidgets(
      'diagnose 500 renders an error view with retry instead of crashing',
      (tester) async {
    // The real backend throws 500 when a pathogen has no antibiogram.
    await pumpTestApp(
      tester,
      initialLocation: '/patient/progress',
      overrides: {
        'POST /api/1/diagnose/target': MockedResponse(500, {
          'statusCode': 500,
          'success': false,
          'message': 'No antibiogram found for this pathogen',
        }),
      },
    );

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

    // No red screen — the server message is shown with a retry.
    expect(find.text('Chẩn đoán vi sinh'), findsOneWidget);
    expect(
      find.text('No antibiogram found for this pathogen'),
      findsOneWidget,
    );
    expect(find.text('Thử lại'), findsOneWidget);
  });

  testWidgets(
      'pathogen-list failure renders an error view instead of crashing',
      (tester) async {
    await pumpTestApp(
      tester,
      initialLocation: '/patient/progress',
      overrides: {
        'GET /api/1/pathogens/list': MockedResponse(500, {
          'statusCode': 500,
          'success': false,
          'message': 'List endpoint failure',
        }),
      },
    );

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
    expect(find.text('List endpoint failure'), findsOneWidget);
    expect(find.text('Thử lại'), findsOneWidget);
  });
}
