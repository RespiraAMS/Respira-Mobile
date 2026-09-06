import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/context_extensions.dart';
import '../../../../design_system/design_system.dart';
import '../../../../features/patient/providers/current_patient_provider.dart';
import '../../../../features/patient/routes.dart';
import '../models/clinical_dtos.dart';
import '../models/microbiology_result.dart';
import '../providers/targeted_pathogen_controller.dart';
import '../providers/targeted_treatment_provider.dart';
import '../widgets/microbiology_banner.dart';
import '../widgets/treatment_option_row_widget.dart';

/// Route `/targeted-treatment` — "Chẩn đoán vi sinh": pathogen from the
/// API, then pick drug + route combinations from the targeted-diagnose
/// result and save.
///
/// Both async reads go through [AsyncValue.when] — reading `.value` on
/// an error state re-throws the provider exception during build (red
/// screen), so errors are always rendered as views with a retry.
class TargetedTreatmentScreen extends ConsumerWidget {
  const TargetedTreatmentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathogensAsync = ref.watch(pathogenListProvider);

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
                child: pathogensAsync.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, _) => _ErrorView(
                    message: error is DioException
                        ? apiErrorMessage(error)
                        : '$error',
                    onRetry: () => ref.invalidate(pathogenListProvider),
                  ),
                  data: (pathogens) {
                    if (pathogens.isEmpty) {
                      return const _ErrorView(
                        message: 'Không có tác nhân gây bệnh trong hệ thống.',
                      );
                    }
                    final selectedId =
                        ref.watch(targetedPathogenControllerProvider);
                    final pathogen = pathogens.firstWhere(
                      (p) => p.id == selectedId,
                      orElse: () => pathogens.first,
                    );
                    return _TargetedBody(
                      pathogen: pathogen,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Spacing.lg),
                child: _SaveButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The diagnose content once the pathogen list has loaded. The pathogen
/// is chosen on the Add progress screen — shown here read-only.
class _TargetedBody extends ConsumerWidget {
  const _TargetedBody({required this.pathogen});

  final PathogenItemDto pathogen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final patient = ref.watch(currentPatientProvider);
    final diagnoseAsync =
        ref.watch(targetedDiagnoseResultProvider(pathogen.id));
    final selection = ref.watch(targetedSelectionControllerProvider);

    return diagnoseAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => _ErrorView(
        message:
            error is DioException ? apiErrorMessage(error) : '$error',
        onRetry: () => ref.invalidate(
          targetedDiagnoseResultProvider(pathogen.id),
        ),
      ),
      data: (result) {
        final selectedDrugs = result.medicines
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

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Patient context.
              Container(
                padding: const EdgeInsets.all(Spacing.control + 2),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            patient.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TypographyTokens.body(context)
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: Spacing.xxxs),
                          AppText(
                            '${patient.code} · ${patient.gender.displayName}${patient.computedAge != null ? ' · ${patient.computedAge} tuổi' : ''}',
                            type: AppTextType.caption),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Spacing.block),
              // Pathogen chosen on Add progress — read-only here.
              BacteriaDisplayField(bacteria: pathogen.name),
              const SizedBox(height: Spacing.section),
              Text(
                'Chọn thuốc + đường dùng',
                style: TypographyTokens.caption(context)
                    .copyWith(color: c.textPrimary),
              ),
              const SizedBox(height: Spacing.inline),
              for (final recommendation in result.medicines) ...[
                Builder(builder: (context) {
                  final dosages = recommendation.dosages;
                  final apiRoute = dosages.isEmpty
                      ? 'Oral'
                      : dosages.first.routeOfAdministration;
                  final routeAbbrev =
                      apiRoute == 'Intravenous' ? 'TM' : apiRoute == 'Oral' ? 'Uống' : apiRoute;
                  return TreatmentOptionRowWidget(
                    option: TreatmentOption(
                      id: recommendation.id,
                      drug: recommendation.name,
                      route: apiRoute,
                      routeAbbrev: routeAbbrev,
                      dosage: dosages.isEmpty ? '' : dosages.first.dose,
                      susceptibility: Susceptibility.s,
                    ),
                    selected: selection.contains(recommendation.id),
                    onToggle: () => ref
                        .read(targetedSelectionControllerProvider.notifier)
                        .toggle(recommendation.id),
                  );
                }),
                if (recommendation != result.medicines.last)
                  const SizedBox(height: Spacing.inline),
              ],
              const SizedBox(height: Spacing.section),
              // Selection summary.
              Container(
                padding: const EdgeInsets.all(Spacing.group),
                decoration: BoxDecoration(
                  color: c.surface,
                  borderRadius: AppRadius.md,
                  border: Border.all(color: c.borderSubtle),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText('Đã chọn theo thuốc + đường dùng',
                        type: AppTextType.caption),
                    const SizedBox(height: Spacing.inline),
                    Wrap(
                      spacing: Spacing.inline,
                      runSpacing: Spacing.inline,
                      children: [
                        for (final chip in chips)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Spacing.control,
                              vertical: Spacing.xxxs + 2,
                            ),
                            decoration: BoxDecoration(
                              color: c.primarySoft,
                              borderRadius: AppRadius.full,
                            ),
                            child: Text(
                              chip,
                              style: TypographyTokens.label(context)
                                  .copyWith(color: c.primary),
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
        );
      },
    );
  }
}

/// The pinned save action — enabled only when a targeted result exists.
class _SaveButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathogensAsync = ref.watch(pathogenListProvider);
    final pathogens = pathogensAsync.valueOrNull ?? const <PathogenItemDto>[];
    final pathogen = pathogens.isNotEmpty ? pathogens.first : null;
    final diagnoseAsync = pathogen == null
        ? null
        : ref.watch(targetedDiagnoseResultProvider(pathogen.id));
    final result = diagnoseAsync?.valueOrNull;

    return AppButton(
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
                medicines: result.medicines
                    .where((m) =>
                        ref.read(targetedSelectionControllerProvider).contains(m.id))
                    .map((m) => MedicineRecordDto(
                          id: m.id,
                          name: m.name,
                          classification: m.classification,
                          routeOfAdministration: m.dosages.isEmpty
                              ? 'Oral'
                              : m.dosages.first.routeOfAdministration,
                          dose: m.dosages.isEmpty ? '' : m.dosages.first.dose,
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
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

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
            style: TypographyTokens.caption(context).copyWith(color: c.error),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: Spacing.control),
            AppButton(
              label: 'Thử lại',
              type: AppButtonType.outline,
              onPressed: onRetry,
            ),
          ],
        ],
      ),
    );
  }
}
