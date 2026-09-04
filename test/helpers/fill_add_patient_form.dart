import 'package:flutter_test/flutter_test.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Fills every field of the "Thêm bệnh nhân" form. All values satisfy the
/// backend `CreatePatientValidator` rules (BHYT exactly 10 chars, valid
/// past DOB) so a submit reaches the mocked `POST /patients`.
Future<void> fillAddPatientForm(
  WidgetTester tester, {
  String name = 'Bệnh Nhân Mới',
}) async {
  Future<void> type(String label, String value) async {
    await tester.enterText(find.widgetWithText(AppTextField, label), value);
    await tester.pump(const Duration(milliseconds: 50));
  }

  await type('Họ và tên', name);
  await type('Mã bệnh án', 'BA-2026-0100');
  await type('Ngày sinh', '12/08/1970');
  await type('Số thẻ BHYT', '1234567890');
  await type('Địa chỉ', '123 Nguyễn Trãi, Q. Ninh Kiều');
  await type('Tỉnh/Thành phố', 'Cần Thơ');
  await type('Quốc gia', 'Việt Nam');
}
