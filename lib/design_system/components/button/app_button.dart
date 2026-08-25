import 'package:flutter/material.dart';

import '../../primitives/app_icon.dart';
import '../../tokens/radius.dart';
import '../../tokens/sizes.dart';
import '../../tokens/spacing.dart';
import '../../theme/theme_extensions.dart';

/// Button variants (§09.1).
enum AppButtonType { primary, secondary, outline, ghost, destructive }

/// Button sizes (§09.1): Small 40 · Default 44 · Large/Primary CTA 52.
enum AppButtonSize { small, medium, large }

/// Pill button with typed variants and interaction states
/// (default → pressed → disabled → loading).
///
/// Rules honored: one primary action per context; loading keeps layout
/// stable; minimum touch target enforced by [AppButtonSize].
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.large,
    this.leadingIcon,
    this.trailingIcon,
    this.loading = false,
    this.expand = false,
    this.semanticLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final AppButtonSize size;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  /// Shows a spinner while preserving the button's current size.
  final bool loading;
  final bool expand;
  final String? semanticLabel;

  double get _height => switch (size) {
        AppButtonSize.small => ControlSize.buttonSmall,
        AppButtonSize.medium => ControlSize.buttonDefault,
        AppButtonSize.large => ControlSize.buttonLarge,
      };

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final disabled = onPressed == null && !loading;

    final (Color bg, Color fg, Color? border) = switch ((type, disabled)) {
      (AppButtonType.primary, false) => (c.primary, c.onPrimary, null),
      (AppButtonType.secondary, false) => (c.surfaceSecondary, c.textPrimary, null),
      (AppButtonType.outline, false) => (c.surface, c.primary, c.primary),
      (AppButtonType.ghost, false) => (Colors.transparent, c.primary, null),
      (AppButtonType.destructive, false) => (c.error, c.onPrimary, null),
      (_, true) => (c.surfaceSecondary, c.textTertiary, Colors.transparent),
    };

    final buttonChild = _ButtonContent(
      label: label,
      fg: fg,
      height: _height,
      loading: loading,
      leadingIcon: leadingIcon,
      trailingIcon: trailingIcon,
    );

    return Semantics(
      button: true,
      label: semanticLabel ?? label,
      child: Material(
        color: bg,
        borderRadius: AppRadius.full,
        child: InkWell(
          onTap: loading ? null : onPressed,
          borderRadius: AppRadius.full,
          child: Container(
            height: _height,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: AppRadius.full,
              border: border == null ? null : Border.all(color: border),
            ),
            alignment: Alignment.center,
            child: expand ? Center(child: buttonChild) : buttonChild,
          ),
        ),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.label,
    required this.fg,
    required this.height,
    required this.loading,
    this.leadingIcon,
    this.trailingIcon,
  });

  final String label;
  final Color fg;
  final double height;
  final bool loading;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style.copyWith(
          fontSize: 16,
          height: 20 / 16,
          fontWeight: FontWeight.w600,
          color: fg,
        );

    final row = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null) ...[
          AppIcon(leadingIcon!, size: ControlSize.iconMd, color: fg),
          const SizedBox(width: Spacing.inline),
        ],
        Text(label, style: style, maxLines: 1, overflow: TextOverflow.fade),
        if (trailingIcon != null) ...[
          const SizedBox(width: Spacing.inline),
          AppIcon(trailingIcon!, size: ControlSize.iconMd, color: fg),
        ],
      ],
    );

    if (!loading) return row;

    return Stack(
      alignment: Alignment.center,
      children: [
        // Offstage keeps the button size identical while loading (§09.1).
        Offstage(child: row),
        SizedBox(
          width: 18,
          height: 18,
          child: CircularProgressIndicator(strokeWidth: 2, color: fg),
        ),
      ],
    );
  }
}
