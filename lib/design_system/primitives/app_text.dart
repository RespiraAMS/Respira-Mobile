import 'package:flutter/material.dart';

import '../tokens/typography.dart';
import '../theme/theme_extensions.dart';

/// Semantic text styles of the design system.
enum AppTextType {
  display,
  h1,
  h2,
  h3,
  bodyLarge,
  body,
  bodyMedium,
  button,
  caption,
  label,
}

/// Text primitive bound to the Inter type scale and semantic colors.
///
/// Never use raw [TextStyle] in features; pick a semantic [AppTextType].
class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.type = AppTextType.body,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontWeight,
  });

  final String text;
  final AppTextType type;

  /// Defaults per token semantics: primary content uses `text-primary`,
  /// captions/labels use `text-secondary` unless overridden.
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final style = switch (type) {
      AppTextType.display => TypographyTokens.display(context),
      AppTextType.h1 => TypographyTokens.h1(context),
      AppTextType.h2 => TypographyTokens.h2(context),
      AppTextType.h3 => TypographyTokens.h3(context),
      AppTextType.bodyLarge => TypographyTokens.bodyLarge(context),
      AppTextType.body => TypographyTokens.body(context),
      AppTextType.bodyMedium => TypographyTokens.bodyMedium(context),
      AppTextType.button => TypographyTokens.button(context),
      AppTextType.caption => TypographyTokens.caption(context),
      AppTextType.label => TypographyTokens.label(context),
    };

    final effectiveColor = color ??
        switch (type) {
          AppTextType.caption || AppTextType.label =>
            context.respiraColors.textSecondary,
          _ => context.respiraColors.textPrimary,
        };

    return Text(
      text,
      style: style.copyWith(color: effectiveColor, fontWeight: fontWeight),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
