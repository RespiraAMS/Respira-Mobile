import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_patient_saving_provider.g.dart';

/// In-flight flag of the "Thêm bệnh nhân" submission — keeps the button's
/// loading state stable without re-entering the controller's build.
@Riverpod(keepAlive: true)
class AddPatientSaving extends _$AddPatientSaving {
  @override
  bool build() => false;

  void set(bool value) => state = value;
}
