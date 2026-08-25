import 'package:flutter/material.dart';

import '../../theme/theme_extensions.dart';
import '../../tokens/sizes.dart';
import '../../tokens/typography.dart';
import '../../tokens/radius.dart';
import '../../tokens/spacing.dart';

/// Labeled input (§09.2): 52px field, radius 16, clear focus indicator,
/// slots: label · input · helper/error text.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.helperText,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.semanticLabel,
  });

  final String label;
  final TextEditingController? controller;

  /// Initial text when no [controller] is provided; the field keeps its own
  /// editing state (avoids cursor jumps on parent rebuilds).
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  /// Masks the input for password fields.
  final bool obscureText;
  final bool enabled;

  /// Accessibility label for the input itself.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label — Control spacing to the input (§06).
        Text(
          label,
          style: TypographyTokens.label(context).copyWith(color: c.textPrimary),
        ),
        const SizedBox(height: Spacing.inline),
        SizedBox(
          height: ControlSize.inputDefault,
          child: TextFormField(
            controller: controller,
            initialValue: controller == null ? initialValue : null,
            onChanged: onChanged,
            enabled: enabled,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontSize: 15,
              height: 22 / 15,
              color: c.textPrimary,
            ),
            cursorColor: c.primary,
            decoration: InputDecoration(
              filled: true,
              fillColor: c.surface,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 15, color: c.textTertiary),
              // Component-internal geometry (§17 allows raw values in
              // component implementations): 22px text line + 2×14 vertical
              // padding + 2px border == ControlSize.inputDefault, so the
              // decorator's intrinsic height matches the box and the text
              // centers without dense-mode anchoring.
              contentPadding: const EdgeInsets.symmetric(
                horizontal: Spacing.group,
                vertical: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppRadius.md,
                borderSide: BorderSide(color: c.borderSubtle),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: AppRadius.md,
                borderSide: BorderSide(color: c.primary, width: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: AppRadius.md,
                borderSide: BorderSide(color: c.borderSubtle),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: AppRadius.md,
                borderSide: BorderSide(color: c.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: AppRadius.md,
                borderSide: BorderSide(color: c.error, width: 2),
              ),
            ),
          ),
        ),
        if ((errorText ?? helperText) != null) ...[
          const SizedBox(height: Spacing.xxs),
          // Error never relies on color alone — always accompanied by text.
          Text(
            errorText ?? helperText!,
            style: TextStyle(
              fontSize: 12,
              height: 16 / 12,
              color: errorText != null ? c.error : c.textSecondary,
            ),
          ),
        ],
      ],
    );
  }
}
