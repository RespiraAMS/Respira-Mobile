import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import 'package:respira_mobile/features/diagnosis/routes.dart';

import '../models/add_progress_form_state.dart';
import '../providers/add_progress_controller.dart';
import '../providers/current_patient_provider.dart';
import '../widgets/section_label_widget.dart';
import '../widgets/selection_row_widget.dart';
import '../routes.dart';

/// Route `/patient/progress` — record a new treatment change.
class AddProgressScreen extends ConsumerWidget {
  const AddProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(addProgressControllerProvider);
    final controller = ref.read(addProgressControllerProvider.notifier);
    final patient = ref.watch(currentPatientProvider);

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
                        title: 'Thêm diễn biến',
                        subtitle: 'Ghi nhận thay đổi điều trị mới nhất',
                        onBack: () => context.goBackOr(PatientRoutes.detail),
                      ),
                      const SizedBox(height: Spacing.section),
                      PatientHeader(
                        variant: PatientHeaderVariant.nested,
                        name: patient.name,
                        metadata: '${patient.code} · Điều trị ngày 4',
                        avatarGlyph: '👩🏾',
                      ),
                      const SizedBox(height: Spacing.section),
                      const SectionLabelWidget('Loại điều trị'),
                      const SizedBox(height: Spacing.xxxs),
                      AppSegmentedTabs<TreatmentType>(
                        segments: [
                          (
                            TreatmentType.empirical,
                            TreatmentType.empirical.displayName,
                          ),
                          (
                            TreatmentType.targeted,
                            TreatmentType.targeted.displayName,
                          ),
                        ],
                        selected: form.treatmentType,
                        onChanged: controller.selectTreatment,
                      ),
                      const SizedBox(height: Spacing.section),
                      const SectionLabelWidget('Lý do thay đổi'),
                      const SizedBox(height: Spacing.xxxs),
                      SelectionRowWidget(
                        title: 'Có kết quả vi sinh',
                        description: 'Chuyển sang điều trị đích khi phù hợp.',
                        selected: form.microbiologyResult,
                        onTap: controller.toggleMicrobiologyResult,
                      ),
                      const SizedBox(height: Spacing.control),
                      SelectionRowWidget(
                        title: 'Đáp ứng kém',
                        description:
                            'Triệu chứng không cải thiện sau theo dõi.',
                        selected: form.poorResponse,
                        onTap: controller.togglePoorResponse,
                      ),
                      const SizedBox(height: Spacing.section),
                      const ClinicalAlert(
                        severity: ClinicalSeverity.needsAttention,
                        title: 'Không thể chỉnh sửa sau khi lưu',
                        description: 'Tạo diễn biến mới nếu cần cập nhật tiếp.',
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Spacing.lg,
                        ),
                        child: AppButton(
                          label: 'Lưu diễn biến',
                          expand: true,
                          onPressed: () => context.push(DiagnosisRoutes.curb65),
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
