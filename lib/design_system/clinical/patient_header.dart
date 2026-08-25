import 'package:flutter/material.dart';

import '../primitives/app_avatar_glyph.dart';
import '../primitives/app_surface.dart';
import '../primitives/app_text.dart';
import '../tokens/radius.dart';
import '../tokens/spacing.dart';
import '../tokens/typography.dart';
import '../theme/theme_extensions.dart';

/// Patient identity block (§09.5 / §10):
/// avatar → name → metadata, identity hierarchy above metadata.
///
/// [PatientHeaderVariant.card] renders on a grouped surface card,
/// [PatientHeaderVariant.nested] on a secondary (nested) surface.
class PatientHeader extends StatelessWidget {
  const PatientHeader({
    super.key,
    required this.name,
    required this.metadata,
    this.avatarGlyph,
    this.variant = PatientHeaderVariant.card,
  });

  final String name;
  final String metadata;

  /// Emoji or initials shown inside the flat circular avatar.
  final String? avatarGlyph;
  final PatientHeaderVariant variant;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    final nested = variant == PatientHeaderVariant.nested;

    return AppSurface(
      radius: AppRadius.mdValue,
      color: nested ? c.surfaceSecondary : c.surface,
      borderColor: nested ? Colors.transparent : null,
      padding: const EdgeInsets.all(Spacing.group),
      child: Row(
        children: [
          _Avatar(glyph: avatarGlyph),
          const SizedBox(width: Spacing.group),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Identity hierarchy: name above metadata.
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TypographyTokens.bodyLarge(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: c.textPrimary,
                  ),
                ),
                const SizedBox(height: Spacing.xxs),
                AppText(
                  metadata,
                  type: AppTextType.caption,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum PatientHeaderVariant { card, nested }

class _Avatar extends StatelessWidget {
  const _Avatar({this.glyph});

  final String? glyph;

  @override
  Widget build(BuildContext context) {
    return AvatarGlyphWidget(glyph: glyph ?? '👤');
  }
}
