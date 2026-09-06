import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:respira_mobile/design_system/design_system.dart';
import 'package:respira_mobile/features/diagnosis/models/clinical_dtos.dart';
import 'package:respira_mobile/features/diagnosis/providers/targeted_pathogen_controller.dart';
import 'package:respira_mobile/features/diagnosis/providers/targeted_treatment_provider.dart';

/// Tappable "Vi khuẩn" field showing the chosen pathogen; opens a
/// selection dialog listing every pathogen of `GET /pathogens/list`.
///
/// Used on the Add progress screen (the choice point of the targeted
/// flow); selecting one updates [TargetedPathogenController] — the
/// Chẩn đoán vi sinh screen resolves its diagnose call from the same
/// state — and clears any drug picks made for the previous pathogen.
class PathogenPickerField extends ConsumerWidget {
  const PathogenPickerField({super.key, required this.pathogens});

  /// Every pathogen from `GET /pathogens/list`.
  final List<PathogenItemDto> pathogens;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.respiraColors;
    final selectedId = ref.watch(targetedPathogenControllerProvider);
    final selected = pathogens.firstWhere(
      (p) => p.id == selectedId,
      orElse: () => pathogens.first,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vi khuẩn',
          style: TypographyTokens.label(context).copyWith(color: c.textPrimary),
        ),
        const SizedBox(height: Spacing.inline),
        Material(
          color: c.surface,
          borderRadius: AppRadius.md,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => _showPickerDialog(context, ref),
            child: Container(
              height: ControlSize.buttonLarge,
              padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
              decoration: BoxDecoration(
                borderRadius: AppRadius.md,
                border: Border.all(color: c.borderSubtle),
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: AppText(
                      selected.name,
                      type: AppTextType.body,
                      color: c.textSecondary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  AppIcon(
                    LucideIcons.chevronDown,
                    size: ControlSize.iconSm,
                    color: c.textTertiary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showPickerDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        final c = dialogContext.respiraColors;
        final currentId = ref.read(targetedPathogenControllerProvider);
        return AlertDialog(
          backgroundColor: c.surface,
          shape: RoundedRectangleBorder(borderRadius: AppRadius.lg),
          title: Text(
            'Chọn tác nhân gây bệnh',
            style: TypographyTokens.bodyLarge(dialogContext)
                .copyWith(fontWeight: FontWeight.w700),
          ),
          content: AppCard.divided([
            for (final pathogen in pathogens)
              TextButton(
                onPressed: () {
                  ref
                      .read(targetedPathogenControllerProvider.notifier)
                      .select(pathogen.id);
                  // Drug picks belong to the previous pathogen.
                  ref
                      .read(targetedSelectionControllerProvider.notifier)
                      .reset();
                  Navigator.of(dialogContext).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: c.textPrimary,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.inline,
                    vertical: Spacing.control,
                  ),
                ),
                child: Text(
                  pathogen.id == currentId
                      ? '● ${pathogen.name}'
                      : pathogen.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}
