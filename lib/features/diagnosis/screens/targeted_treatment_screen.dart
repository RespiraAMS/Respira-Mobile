import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../../../../features/patient/routes.dart';
import '../models/clinical_dtos.dart';
import '../models/microbiology_result.dart';
import '../providers/microbiology_provider.dart';
import '../providers/targeted_treatment_provider.dart';
import '../widgets/microbiology_banner.dart';
import '../widgets/treatment_option_row_widget.dart';

/// Route `/targeted-treatment` — "Chẩn đoán vi sinh": pathogen from the
/// API, then pick drug + route combinations from the targeted-diagnose
/// result and save.
class TargetedTreatmentScreen extends ConsumerWidget {
  const TargetedTreatmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final micro = ref.watch(microbiologyResultProvider);
    final pathogensAsync = ref.watch(pathogenListProvider);
    final pathogens = pathogensAsync.value ?? const [];
    final pathogen = pathogens.isNotEmpty ? pathogens.first : null;
    final diagnoseAsync = pathogen == null
        ? const AsyncValue<TargetedDiagnoseResultDto>.loading()
        : ref.watch(targetedDiagnoseResultProvider(pathogen.id));
    final result = diagnoseAsync.value;

    final selection = ref.watch(targetedSelectionControllerProvider);
    final selectedDrugs = result == null
        ? const []
        : result.medicines
            .where((r) => selection.contains(r.id))
            .toList();
    String abbrev(String route) =>
        route == 'Intravenous' ? 'TM' : route == 'Oral' ? 'Uống' : route;
    final chips = selectedDrugs
        .asMap()
        .entries
        .map((e) =>
            'P${e.key + 1} · ${e.value.name} · ${abbrev(e.value.dosages.isEmpty ? 'Oral' : e.value.dosages.first.routeOfAdministration)}')
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppAppBar(
                title: 'Chẩn đoán vi sinh',
                subtitle: 'Mỗi đường dùng là một lựa chọn thuốc riêng',
                onBack: () => context.goBackOr('/patient/progress'),
              ),
              const SizedBox(height: Spacing.section),
              Expanded(
                child: diagnoseAsync.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : diagnoseAsync.hasError
                        ? _ErrorView(
                            message:
                                'Không thể tải khuyến nghị. Vui lòng thử lại.')
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Patient context.
                                Container(
                                  padding: const EdgeInsets.all(
                                      Spacing.control + 2),
                                  decoration: BoxDecoration(
                                    color: c.surfaceSecondary,
                                    borderRadius: AppRadius.md,
                                  ),
                                  child: Row(
                                    children: [
                                      const AvatarGlyphWidget(glyph: '👨🏻'),
                                      const SizedBox(width: Spacing.group),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Nguyễn Minh Khôi',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TypographyTokens.body(
                                                      context)
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                            const SizedBox(
                                                height: Spacing.xxxs),
                                            AppText('BA-2026-0231 · 55 tuổi',
                                                type: AppTextType.caption),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: Spacing.block),
                                BacteriaDisplayField(
                                    bacteria: micro.bacteria),
                                const SizedBox(height: Spacing.control),
                                AntibiogramBanner(
                                    line: micro.antibiogramLine),
                                const SizedBox(height: Spacing.section),
                                Text(
                                  'Chọn thuốc + đường dùng',
                                  style: TypographyTokens.caption(context)
                                      .copyWith(color: c.textPrimary),
                                ),
                                const SizedBox(height: Spacing.inline),
                                if (result != null)
                                  for (final recommendation
                                      in result.medicines) ...[
                                    Builder(builder: (context) {
                                      final dosages = recommendation.dosages;
                                      final apiRoute = dosages.isEmpty
                                          ? 'Oral'
                                          : dosages.first.routeOfAdministration;
                                      final routeAbbrev = apiRoute ==
                                              'Intravenous'
                                          ? 'TM'
                                          : apiRoute == 'Oral'
                                              ? 'Uống'
                                              : apiRoute;
                                      return TreatmentOptionRowWidget(
                                        option: TreatmentOption(
                                          id: recommendation.id,
                                          drug: recommendation.name,
                                          route: apiRoute,
                                          routeAbbrev: routeAbbrev,
                                          dosage: dosages.isEmpty
                                              ? ''
                                              : dosages.first.dose,
                                          susceptibility: Susceptibility.s,
                                        ),
                                        selected: selection
                                            .contains(recommendation.id),
                                        onToggle: () => ref
                                            .read(
                                                targetedSelectionControllerProvider
                                                    .notifier)
                                            .toggle(recommendation.id),
                                      );
                                    }),
                                    if (recommendation !=
                                        result.medicines.last)
                                      const SizedBox(
                                          height: Spacing.inline),
                                  ],
                                const SizedBox(height: Spacing.section),
                                // Selection summary.
                                Container(
                                  padding:
                                      const EdgeInsets.all(Spacing.group),
                                  decoration: BoxDecoration(
                                    color: c.surface,
                                    borderRadius: AppRadius.md,
                                    border:
                                        Border.all(color: c.borderSubtle),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                          'Đã chọn theo thuốc + đường dùng',
                                          type: AppTextType.caption),
                                      const SizedBox(
                                          height: Spacing.inline),
                                      Wrap(
                                        spacing: Spacing.inline,
                                        runSpacing: Spacing.inline,
                                        children: [
                                          for (final chip in chips)
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal:
                                                    Spacing.control,
                                                vertical: Spacing.xxxs + 2,
                                              ),
                                              decoration: BoxDecoration(
                                                color: c.primarySoft,
                                                borderRadius:
                                                    AppRadius.full,
                                              ),
                                              child: Text(
                                                chip,
                                                style: TypographyTokens
                                                        .label(context)
                                                    .copyWith(
                                                        color:
                                                            c.primary),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: Spacing.section),
                              ],
                            ),
                          ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
                child: AppButton(
                  label: 'Lưu điều trị đích',
                  expand: true,
                  onPressed: pathogen == null || result == null
                      ? null
                      : () async {
                          final ok = await saveTargetedTreatment(
                            ref,
                            pathogenId: pathogen.id,
                            pathogenName: pathogen.name,
                            crcl: result.crcl,
                            medicines: selectedDrugs
                                .map((m) => MedicineRecordDto(
                                      id: m.id,
                                      name: m.name,
                                      classification: m.classification,
                                      routeOfAdministration: m
                                              .dosages.isEmpty
                                          ? 'Oral'
                                          : m.dosages.first
                                              .routeOfAdministration,
                                      dose: m.dosages.isEmpty
                                          ? ''
                                          : m.dosages.first.dose,
                                    ))
                                .toList(),
                          );
                          if (!context.mounted) return;
                          showAppToast(
                            context,
                            ok
                                ? 'Đã lưu điều trị đích.'
                                : 'Lưu thất bại. Vui lòng thử lại.',
                          );
                          if (ok) context.go(PatientRoutes.detail);
                        },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Center(
      child: Text(
        message,
        style: TypographyTokens.caption(context).copyWith(color: c.error),
      ),
    );
  }
}
