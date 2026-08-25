import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../primitives/app_icon.dart';
import '../../primitives/app_text.dart';
import '../../theme/theme_extensions.dart';
import '../../tokens/sizes.dart';
import '../../tokens/spacing.dart';

/// Screen header: 44px round back button + title (H3) and subtitle (Caption).
///
/// Back button exposes a semantic label for accessibility (§12).
class AppAppBar extends StatelessWidget {
  const AppAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBack,
    this.backSemanticLabel = 'Quay lại',
  });

  final String title;
  final String subtitle;

  /// When null the back button is hidden.
  final VoidCallback? onBack;
  final String backSemanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return SizedBox(
      height: 56,
      child: Row(
        children: [
          if (onBack != null) ...[
            Material(
              color: c.surfaceSecondary,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                width: 44,
                height: 44,
                child: InkWell(
                  onTap: onBack,
                  child: Center(
                    child: AppIcon(
                      LucideIcons.arrowLeft,
                      size: ControlSize.iconXl,
                      semanticLabel: backSemanticLabel,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: Spacing.group),
          ],
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(title, type: AppTextType.h3, maxLines: 1),
                const SizedBox(height: 2),
                AppText(subtitle, type: AppTextType.caption, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
