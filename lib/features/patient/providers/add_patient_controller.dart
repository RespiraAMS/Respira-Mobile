import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_response.dart';
import '../models/add_patient_form_state.dart';
import '../models/patient.dart';
import '../services/patient_service.dart';
import 'active_patient_provider.dart';
import 'add_patient_saving_provider.dart';

part 'add_patient_controller.g.dart';

/// Holds the "Thêm bệnh nhân" form state and submits it to
/// `POST /patients` (guidelines §2.1 Riverpod codegen).
///
/// Starts empty — every field is typed by the doctor.
@Riverpod(keepAlive: true)
class AddPatientController extends _$AddPatientController {
  PatientService get _service => PatientService(ref.watch(apiClientProvider));

  @override
  AddPatientFormState build() => const AddPatientFormState();

  void setName(String value) => state = state.copyWith(name: value);

  void setCode(String value) => state = state.copyWith(code: value);

  void setDob(String value) => state = state.copyWith(dob: value);

  void setInsurance(String value) =>
      state = state.copyWith(insurance: value);

  void setAddress(String value) => state = state.copyWith(address: value);

  void setCity(String value) => state = state.copyWith(city: value);

  void setCountry(String value) => state = state.copyWith(country: value);

  void setGender(Gender gender) {
    state = state.copyWith(gender: gender);
  }

  /// Creates the patient via the API and makes them the active patient so
  /// every downstream screen (progress, wizard, detail) reflects the
  /// record just saved. Returns the new patient's ID.
  ///
  /// Validates against the backend's `CreatePatientValidator` rules
  /// before sending, throwing [ApiException] with a Vietnamese message on
  /// the first failing requirement (guidelines Rule 3).
  Future<String> save() async {
    final saving = ref.read(addPatientSavingProvider.notifier);
    saving.set(true);
    try {
      final form = state;
      _require(form.name.trim(), 'Vui lòng nhập họ và tên.');
      _require(form.code.trim(), 'Vui lòng nhập mã bệnh án.');
      final dob = _validatedDob(form.dob);
      if (form.insurance.trim().length != 10) {
        throw const ApiException(
          400,
          'Số thẻ BHYT phải có đúng 10 ký tự.',
        );
      }
      _require(form.address.trim(), 'Vui lòng nhập địa chỉ.');
      _require(form.city.trim(), 'Vui lòng nhập tỉnh/thành phố.');
      _require(form.country.trim(), 'Vui lòng nhập quốc gia.');

      final id = await _service.createPatient(
        fullName: form.name.trim(),
        dateOfBirth: dob,
        isMale: form.gender == Gender.nam,
        medicalRecordCode: form.code.trim(),
        healthInsuranceCardNumber: form.insurance.trim(),
        address: form.address.trim(),
        city: form.city.trim(),
        country: form.country.trim(),
      );

      final patient = Patient(
        name: form.name.trim(),
        code: form.code.trim(),
        dob: form.dob.trim(),
        gender: form.gender,
        insurance: form.insurance.trim(),
        address: form.address.trim(),
      );
      ref.read(activePatientControllerProvider.notifier).set(patient);
      return id;
    } finally {
      saving.set(false);
    }
  }

  /// Validates dd/MM/yyyy and returns the API's yyyy-MM-dd format.
  /// DOB must be a real date and must not be in the future (mirrors the
  /// backend `LessThanOrEqualTo(Today)` rule).
  String _validatedDob(String raw) {
    final value = raw.trim();
    final parts = value.split('/');
    if (parts.length != 3) {
      throw const ApiException(400, 'Ngày sinh không hợp lệ (dd/MM/yyyy).');
    }
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);
    if (day == null || month == null || year == null) {
      throw const ApiException(400, 'Ngày sinh không hợp lệ (dd/MM/yyyy).');
    }
    final dob = DateTime(year, month, day);
    if (dob.year != year || dob.month != month || dob.day != day) {
      throw const ApiException(400, 'Ngày sinh không hợp lệ (dd/MM/yyyy).');
    }
    final today = DateTime.now();
    final endOfToday = DateTime(today.year, today.month, today.day, 23, 59, 59);
    if (dob.isAfter(endOfToday)) {
      throw const ApiException(400, 'Ngày sinh không được ở tương lai.');
    }
    return '${parts[2]}-${parts[1].padLeft(2, '0')}-${parts[0].padLeft(2, '0')}';
  }

  void _require(String value, String message) {
    if (value.isEmpty) throw ApiException(400, message);
  }
}
