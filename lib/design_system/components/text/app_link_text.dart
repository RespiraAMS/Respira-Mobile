import 'package:flutter/material.dart';

import '../../primitives/app_text.dart';
import '../../theme/theme_extensions.dart';
import '../../tokens/sizes.dart';
import '../../tokens/spacing.dart';

/// Inline tappable text link in primary color (e.g. "Quên mật khẩu?").
///
/// Enforces the 44px minimum touch target (§12) around a compact label.
class AppLinkText extends StatelessWidget {
  const AppLinkText(
    this.label, {
    super.key,
    this.onPressed,
    this.semanticLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      link: true,
      label: semanticLabel ?? label,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Spacing.xxs),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(minHeight: ControlSize.touchTargetMin),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.xxs),
              child: Center(
                child: AppText(
                  label,
                  type: AppTextType.caption,
                  color: context.respiraColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
