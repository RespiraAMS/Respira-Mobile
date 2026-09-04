import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../../../../core/network/api_response.dart';
import '../models/patient.dart';
import '../providers/add_patient_controller.dart';
import '../providers/add_patient_saving_provider.dart';
import '../widgets/gender_option_widget.dart';
import '../widgets/section_label_widget.dart';
import '../routes.dart';

/// Route `/patient/add` — "Thêm bệnh nhân" form.
///
/// When reached with [diagnosisEntry] (query `?flow=diagnosis` from the
/// bottom-nav 'Chẩn đoán' tab), saving continues straight into the
/// empirical-treatment progress flow for the just-created patient.
class AddPatientScreen extends ConsumerWidget {
  const AddPatientScreen({super.key, this.diagnosisEntry = false});

  final bool diagnosisEntry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addPatientControllerProvider);
    final controller = ref.read(addPatientControllerProvider.notifier);
    final saving = ref.watch(addPatientSavingProvider);

    Future<void> save(BuildContext context) async {
      try {
        await controller.save();
        if (!context.mounted) return;
        context.push(
          diagnosisEntry ? PatientRoutes.progress : PatientRoutes.detail,
        );
      } on ApiException catch (e) {
        showAppToast(context, e.message);
      } catch (_) {
        showAppToast(context, 'Không thể tạo bệnh nhân. Vui lòng thử lại.');
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppAppBar(
                        title: 'Thêm bệnh nhân',
                        subtitle: 'Tạo hồ sơ bệnh nhân mới',
                        onBack: () => context.goBackOr(PatientRoutes.list),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppTextField(
                        label: 'Họ và tên',
                        initialValue: form.name,
                        onChanged: controller.setName,
                      ),
                      const SizedBox(height: Spacing.group),
                      AppTextField(
                        label: 'Mã bệnh án',
                        initialValue: form.code,
                        onChanged: controller.setCode,
                      ),
                      const SizedBox(height: Spacing.group),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AppTextField(
                              label: 'Ngày sinh',
                              initialValue: form.dob,
                              onChanged: controller.setDob,
                            ),
                          ),
                          const SizedBox(width: Spacing.group),
                          Expanded(
                            child: _GenderField(
                              selected: form.gender,
                              onSelect: controller.setGender,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Spacing.group),
                      AppTextField(
                        label: 'Số thẻ BHYT',
                        keyboardType: TextInputType.text,
                        initialValue: form.insurance,
                        onChanged: controller.setInsurance,
                      ),
                      const SizedBox(height: Spacing.group),
                      AppTextField(
                        label: 'Địa chỉ',
                        initialValue: form.address,
                        onChanged: controller.setAddress,
                      ),
                      const SizedBox(height: Spacing.group),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AppTextField(
                              label: 'Tỉnh/Thành phố',
                              initialValue: form.city,
                              onChanged: controller.setCity,
                            ),
                          ),
                          const SizedBox(width: Spacing.group),
                          Expanded(
                            child: AppTextField(
                              label: 'Quốc gia',
                              initialValue: form.country,
                              onChanged: controller.setCountry,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: Spacing.block),
                        child: AppButton(
                          label: saving ? 'Đang lưu…' : 'Lưu hồ sơ',
                          expand: true,
                          loading: saving,
                          onPressed: saving ? null : () => save(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GenderField extends StatelessWidget {
  const _GenderField({required this.selected, required this.onSelect});

  final Gender selected;
  final ValueChanged<Gender> onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionLabelWidget('Giới tính'),
        const SizedBox(height: Spacing.inline),
        Row(
          children: [
            GenderOptionWidget(
              label: Gender.nam.displayName,
              selected: selected == Gender.nam,
              onTap: () => onSelect(Gender.nam),
            ),
            const SizedBox(width: Spacing.inline),
            GenderOptionWidget(
              label: Gender.nu.displayName,
              selected: selected == Gender.nu,
              onTap: () => onSelect(Gender.nu),
            ),
          ],
        ),
      ],
    );
  }
}
