import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/core/router/app_router.dart';
import 'package:respira_mobile/features/patient/routes.dart';
import 'package:respira_mobile/main.dart';

/// Clinical patient-flow tests (ft/patient branch): add → detail → progress.

Future<void> _pumpAt(WidgetTester tester, String initialLocation) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        appRouterProvider
            .overrideWithValue(buildAppRouter(initialLocation: initialLocation)),
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

    await tester.tap(find.text('Lưu hồ sơ'));
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
}
