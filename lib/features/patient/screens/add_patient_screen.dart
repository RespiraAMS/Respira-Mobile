import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../models/patient.dart';
import '../providers/add_patient_controller.dart';
import '../widgets/gender_option_widget.dart';
import '../widgets/section_label_widget.dart';
import '../routes.dart';

/// Route `/patient/add` — "Thêm bệnh nhân" form.
class AddPatientScreen extends ConsumerWidget {
  const AddPatientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addPatientControllerProvider);
    final controller = ref.read(addPatientControllerProvider.notifier);

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
                        onBack: () => context.goBackOr(PatientRoutes.detail),
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: Spacing.block),
                        child: AppButton(
                          label: 'Lưu hồ sơ',
                          expand: true,
                          onPressed: () {
                            controller.save();
                            context.push(PatientRoutes.detail);
                          },
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
