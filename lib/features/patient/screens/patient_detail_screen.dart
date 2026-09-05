import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../providers/current_patient_provider.dart';
import '../widgets/info_row_widget.dart';
import '../widgets/section_label_widget.dart';
import '../widgets/timeline_widget.dart';
import '../routes.dart';

/// Route `/patient/detail` — read-only profile and treatment timeline.
class PatientDetailScreen extends ConsumerWidget {
  const PatientDetailScreen({super.key});

  static const _timelineEntries = [
    TreatmentTimelineEntry(
      dateLabel: 'Hôm nay',
      title: 'Kháng sinh phối hợp',
      status: 'Đang điều trị',
    ),
    TreatmentTimelineEntry(
      dateLabel: '03/08',
      title: 'Kháng sinh kinh nghiệm',
      status: 'Đang điều trị',
    ),
    TreatmentTimelineEntry(
      dateLabel: '01/08',
      title: 'Điều trị nội trú',
      status: 'Đang điều trị',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        title: 'Chi tiết bệnh nhân',
                        subtitle: 'Thông tin chỉ đọc và tiến trình điều trị',
                        onBack: () =>
                            context.goBackOr(PatientRoutes.list),
                      ),
                      const SizedBox(height: Spacing.block),
                      PatientHeader(
                        name: patient.name,
                        metadata:
                            '${patient.code} · ${patient.gender.displayName} · 55 tuổi',
                        avatarGlyph: '👨🏻',
                      ),
                      const SizedBox(height: Spacing.section),
                      const SectionLabelWidget('Thông tin hồ sơ'),
                      const SizedBox(height: Spacing.xxs),
                      AppCard.divided(
                        [
                          InfoRowWidget(
                            label: 'Ngày sinh · Giới tính',
                            value:
                                '${patient.dob} · ${patient.gender.displayName}',
                          ),
                          InfoRowWidget(
                            label: 'BHYT',
                            value: patient.insurance,
                          ),
                          InfoRowWidget(
                            label: 'Địa chỉ',
                            value: patient.address,
                          ),
                          const InfoRowWidget(
                            label: 'Thể trạng',
                            value: '62 kg · 168 cm',
                          ),
                          const InfoRowWidget(
                            label: 'Trạng thái điều trị',
                            value: 'Đang điều trị',
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
                        child: TimelineWidget(entries: _timelineEntries),
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
          ),
        ),
      ),
    );
  }
}
