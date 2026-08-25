import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../primitives/app_text.dart';
import '../../theme/theme_extensions.dart';
import '../../tokens/radius.dart';
import '../../tokens/sizes.dart';
import '../../tokens/spacing.dart';
import '../../tokens/typography.dart';

/// Reusable confirmation dialog (§09.7 anatomy: title · description ·
/// content · actions).
///
/// Returns the popped [bool]: `true` when [confirmLabel] was tapped,
/// `false` when cancelled/dismissed, `null` when dismissed via barrier.
Future<bool?> showAppConfirmDialog(
  BuildContext context, {
  required String title,
  String? description,
  IconData icon = LucideIcons.clipboardCheck,
  String? infoLabel,
  Color? infoBackground,
  required String confirmLabel,
  String cancelLabel = 'Hủy',
}) {
  return showDialog<bool>(
    context: context,
    builder: (_) => _ConfirmDialog(
      title: title,
      description: description,
      icon: icon,
      infoLabel: infoLabel,
      infoBackground: infoBackground,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
    ),
  );
}

class _ConfirmDialog extends StatelessWidget {
  const _ConfirmDialog({
    required this.title,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.icon,
    this.description,
    this.infoLabel,
    this.infoBackground,
  });

  final String title;
  final String? description;
  final IconData icon;
  final String? infoLabel;
  final Color? infoBackground;
  final String confirmLabel;
  final String cancelLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: Spacing.lg),
      child: Container(
        padding: const EdgeInsets.all(Spacing.section),
        decoration: BoxDecoration(
          color: c.surface,
          borderRadius: BorderRadius.circular(AppRadius.lgValue + 4),
          border: Border.all(color: c.borderSubtle),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: ControlSize.touchTargetMin + 12,
                height: ControlSize.touchTargetMin + 12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: c.primarySoft,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon,
                    size: ControlSize.iconBase, color: c.primary),
              ),
            ),
            const SizedBox(height: Spacing.group),
            Text(
              title,
              textAlign: TextAlign.center,
              style:
                  TypographyTokens.h2(context).copyWith(color: c.textPrimary),
            ),
            if (description != null) ...[
              const SizedBox(height: Spacing.inline),
              AppText(
                description!,
                type: AppTextType.caption,
                textAlign: TextAlign.center,
              ),
            ],
            if (infoLabel != null) ...[
              const SizedBox(height: Spacing.section),
              Container(
                height: ControlSize.buttonDefault + 10,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: infoBackground ?? c.warningSoft,
                  borderRadius: AppRadius.md,
                ),
                child: Text(
                  infoLabel!,
                  textAlign: TextAlign.center,
                  style: TypographyTokens.label(context)
                      .copyWith(color: c.textPrimary),
                ),
              ),
            ],
            const SizedBox(height: Spacing.xl),
            Row(
              children: [
                Expanded(
                  child: _DialogButton(
                    label: cancelLabel,
                    background: c.surfaceSecondary,
                    foreground: c.textPrimary,
                    onTap: () => Navigator.of(context).pop(false),
                  ),
                ),
                const SizedBox(width: Spacing.control),
                Expanded(
                  child: _DialogButton(
                    label: confirmLabel,
                    background: c.primary,
                    foreground: c.onPrimary,
                    onTap: () => Navigator.of(context).pop(true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.label,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  final String label;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Dialog action size (template 48px → snapped to the 4px grid).
    const height = ControlSize.buttonDefault + 4;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(AppRadius.lgValue),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          alignment: Alignment.center,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TypographyTokens.bodyMedium(context)
                .copyWith(fontWeight: FontWeight.w600, color: foreground),
          ),
        ),
      ),
    );
  }
}
