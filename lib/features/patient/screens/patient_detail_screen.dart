import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/age.dart';
import '../../../../design_system/design_system.dart';
import '../models/patient.dart';
import '../models/patient_dtos.dart';
import '../providers/current_patient_provider.dart';
import '../providers/patient_detail_provider.dart';
import '../widgets/info_row_widget.dart';
import '../widgets/section_label_widget.dart';
import '../widgets/timeline_widget.dart';
import '../routes.dart';

/// Route `/patient/detail` — read-only profile and treatment timeline.
///
/// Rendered from `GET /patients/{id}` when opened with `?id=` (patient
/// list), which also promotes the record to the active patient so the
/// progress/wizard/save flow uses the real patient id. Without `?id=`
/// (right after creation) it keeps rendering the active patient.
class PatientDetailScreen extends ConsumerWidget {
  const PatientDetailScreen({super.key, this.patientId, this.justSaved = false});

  final String? patientId;

  /// True when arriving right after a successful treatment save — shows
  /// the success toast once on mount (a toast fired on the source screen
  /// races the route transition).
  final bool justSaved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = patientId == null || patientId!.isEmpty
        ? null
        : ref.watch(patientDetailProvider(patientId!));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
              child: detail == null
                  ? _DetailBody(
                      patient: ref.watch(currentPatientProvider),
                      statusLabel: 'Đang điều trị',
                      treatments: const [],
                    )
                  : detail.when(
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, _) => _DetailError(
                        message: error.toString(),
                        onRetry: () => ref.invalidate(
                          patientDetailProvider(patientId!),
                        ),
                      ),
                      data: (d) {
                        final dobParts = d.dateOfBirth.split('-');
                        final dobDisplay = dobParts.length == 3
                            ? '${dobParts[2]}/${dobParts[1]}/${dobParts[0]}'
                            : d.dateOfBirth;
                        return _DetailBody(
                          patient: Patient(
                            id: d.id,
                            name: d.fullName,
                            code: d.medicalRecordCode,
                            dob: dobDisplay,
                            gender: d.isMale ? Gender.nam : Gender.nu,
                            insurance: d.healthInsuranceCardNumber,
                            address: d.address,
                          ),
                          statusLabel:
                              _DetailBody._patientStatusLabels[d.status] ?? '—',
                          treatments: d.treatments,
                        );
                      },
                    ),
            ),
            if (justSaved) const _JustSavedToast(),
          ],
        ),
      ),
    );
  }
}

/// Fires the save-success toast once, after the first frame.
class _JustSavedToast extends StatefulWidget {
  const _JustSavedToast();

  @override
  State<_JustSavedToast> createState() => _JustSavedToastState();
}

class _JustSavedToastState extends State<_JustSavedToast> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      showAppToast(context, 'Đã lưu kết quả chẩn đoán.');
    });
  }

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}

class _DetailBody extends StatelessWidget {
  const _DetailBody({
    required this.patient,
    required this.statusLabel,
    required this.treatments,
  });

  final Patient patient;
  final String statusLabel;
  final List<TreatmentItemDto> treatments;

  static const _patientStatusLabels = {
    PatientStatusDto.inTreatment: 'Đang điều trị',
    PatientStatusDto.recovered: 'Đã khỏi',
    PatientStatusDto.death: 'Đã tử vong',
  };

  /// `PatientTreatmentStatus` string values → Vietnamese labels.
  static const _treatmentStatusLabels = {
    'FavorableResponse': 'Đáp ứng tốt',
    'PoorResponse': 'Đáp ứng kém',
  };

  @override
  Widget build(BuildContext context) {
    final age = computeAgeFromDob(patient.dob);
    final entries = [
      for (final t in treatments)
        TreatmentTimelineEntry(
          dateLabel: _shortDate(t.start),
          title: t.treatmentType == 'TargetedTherapy'
              ? 'Điều trị đích'
              : 'Điều trị kinh nghiệm',
          status: _treatmentStatusLabels[t.status] ?? t.status,
        ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppAppBar(
                  title: 'Chi tiết bệnh nhân',
                  subtitle: 'Thông tin chỉ đọc và tiến trình điều trị',
                  // Always lands on the roster regardless of the entry
                  // point (list, wizard save, add-patient).
                  onBack: () => context.go(PatientRoutes.list),
                ),
                const SizedBox(height: Spacing.block),
                PatientHeader(
                  name: patient.name,
                  metadata:
                      '${patient.code} · ${patient.gender.displayName}${age != null ? ' · $age tuổi' : ''}',
                  avatarGlyph: '👨🏻',
                ),
                const SizedBox(height: Spacing.section),
                const SectionLabelWidget('Thông tin hồ sơ'),
                const SizedBox(height: Spacing.xxs),
                AppCard.divided(
                  [
                    InfoRowWidget(
                      label: 'Ngày sinh · Giới tính',
                      value: '${patient.dob} · ${patient.gender.displayName}',
                    ),
                    InfoRowWidget(
                      label: 'BHYT',
                      value: patient.insurance,
                    ),
                    InfoRowWidget(
                      label: 'Địa chỉ',
                      value: patient.address,
                    ),
                    InfoRowWidget(
                      label: 'Trạng thái điều trị',
                      value: statusLabel,
                    ),
                  ],
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.group,
                  ),
                ),
                const SizedBox(height: Spacing.section),
                const SectionLabelWidget('Tiến trình điều trị'),
                const SizedBox(height: Spacing.inline),
                Padding(
                  padding: const EdgeInsets.only(left: Spacing.xxs),
                  child: entries.isEmpty
                      ? const AppText(
                          'Chưa có diễn biến điều trị nào được ghi nhận.',
                          type: AppTextType.caption,
                        )
                      : TimelineWidget(entries: entries),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: Spacing.block,
                    bottom: Spacing.lg,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          label: 'Thêm điều trị',
                          onPressed: () =>
                              context.push(PatientRoutes.progress),
                        ),
                      ),
                      const SizedBox(width: Spacing.control),
                      Expanded(
                        child: AppButton(
                          label: 'Cập nhật trạng thái',
                          type: AppButtonType.outline,
                          onPressed: () =>
                              context.push(PatientRoutes.progress),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// yyyy-MM-dd (or ISO datetime) → dd/MM.
  String _shortDate(String iso) {
    final datePart = iso.split('T').first;
    final parts = datePart.split('-');
    if (parts.length == 3) return '${parts[2]}/${parts[1]}';
    return datePart;
  }
}

class _DetailError extends StatelessWidget {
  const _DetailError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TypographyTokens.body(context).copyWith(color: c.error),
          ),
          const SizedBox(height: Spacing.control),
          AppButton(
            label: 'Thử lại',
            type: AppButtonType.outline,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
