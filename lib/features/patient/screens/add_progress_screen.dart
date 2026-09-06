import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../../../../features/diagnosis/providers/diagnosis_flow_provider.dart';
import '../../../../features/diagnosis/providers/targeted_treatment_provider.dart';
import '../../../../features/diagnosis/routes.dart';
import '../../../../features/diagnosis/widgets/pathogen_picker_field.dart';
import '../models/add_progress_form_state.dart';
import '../providers/add_progress_controller.dart';
import '../providers/current_patient_provider.dart';
import '../routes.dart';
import '../widgets/section_label_widget.dart';

/// Route `/patient/progress` — record a treatment change. The form
/// switches between the empirical variant (reason checkboxes) and the
/// targeted variant (microbiology-based) via the treatment-type tabs.
class AddProgressScreen extends ConsumerStatefulWidget {
  const AddProgressScreen({super.key});

  @override
  ConsumerState<AddProgressScreen> createState() => _AddProgressScreenState();
}

class _AddProgressScreenState extends ConsumerState<AddProgressScreen> {
  @override
  void initState() {
    super.initState();
    // Load disease + criteria for the wizard steps (steps 3–5 render them).
    Future.microtask(
      () => ref.read(diagnosisFlowControllerProvider.notifier).loadDiseaseContext(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(addProgressControllerProvider);
    final controller = ref.read(addProgressControllerProvider.notifier);
    final patient = ref.watch(currentPatientProvider);
    final isTargeted = form.treatmentType == TreatmentType.targeted;

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
                        subtitle: isTargeted
                            ? 'Dựa trên kết quả vi sinh đã có'
                            : 'Ghi nhận thay đổi điều trị mới nhất',
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
                      SectionLabelWidget(
                        isTargeted
                            ? 'Loại điều trị tiếp theo'
                            : 'Loại điều trị',
                      ),
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
                      if (isTargeted)
                        const _TargetedBody()
                      else
                        _EmpiricalBody(
                          form: form,
                          controller: controller,
                        ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Spacing.lg,
                        ),
                        child: AppButton(
                          label: isTargeted
                              ? 'Tiếp tục điều trị đích'
                              : 'Lưu diễn biến',
                          expand: true,
                          onPressed: () => context.push(
                            isTargeted
                                ? DiagnosisRoutes.targetedTreatment
                                : DiagnosisRoutes.vitals,
                          ),
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

/// Empirical variant: editability warning.
class _EmpiricalBody extends StatelessWidget {
  const _EmpiricalBody({required this.form, required this.controller});

  final AddProgressFormState form;
  final AddProgressController controller;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: Spacing.inline),
        ClinicalAlert(
          severity: ClinicalSeverity.needsAttention,
          title: 'Không thể chỉnh sửa sau khi lưu',
          description: 'Tạo diễn biến mới nếu cần cập nhật tiếp.',
        ),
      ],
    );
  }
}

/// Targeted variant: doctor-selectable pathogen (the choice point of
/// the targeted flow — the Chẩn đoán vi sinh screen reads the same
/// selection) + warning to verify before choosing drugs.
class _TargetedBody extends ConsumerWidget {
  const _TargetedBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathogensAsync = ref.watch(pathogenListProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        pathogensAsync.when(
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(Spacing.section),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, _) => _PathogenLoadError(
            message: error is DioException
                ? apiErrorMessage(error)
                : '$error',
            onRetry: () => ref.invalidate(pathogenListProvider),
          ),
          data: (pathogens) {
            if (pathogens.isEmpty) {
              return const AppText(
                'Không có tác nhân gây bệnh trong hệ thống.',
                type: AppTextType.caption,
              );
            }
            return PathogenPickerField(pathogens: pathogens);
          },
        ),
        const SizedBox(height: Spacing.section),
        const ClinicalAlert(
          severity: ClinicalSeverity.needsAttention,
          title: 'Điều trị đích dựa trên kết quả vi sinh',
          description: 'Chọn tác nhân gây bệnh trước khi chọn thuốc.',
        ),
      ],
    );
  }
}

/// Pathogen-list failure on the Add progress screen — server message
/// with a retry, never a red screen.
class _PathogenLoadError extends StatelessWidget {
  const _PathogenLoadError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          message,
          style: TypographyTokens.caption(context).copyWith(color: c.error),
        ),
        const SizedBox(height: Spacing.control),
        AppButton(
          label: 'Thử lại',
          type: AppButtonType.outline,
          onPressed: onRetry,
        ),
      ],
    );
  }
}
