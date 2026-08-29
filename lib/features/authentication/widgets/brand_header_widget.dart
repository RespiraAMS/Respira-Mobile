import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../design_system/design_system.dart';

/// The "R." square logo mark used on splash, brand headers and the
/// forgot-password hero.
class RespiraLogoMarkWidget extends StatelessWidget {
  const RespiraLogoMarkWidget({
    super.key,
    this.size = 32,
  });

  /// Side length of the rounded square.
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: c.primary,
        borderRadius: BorderRadius.circular(size * 0.31),
      ),
      child: Text(
        'R.',
        style: GoogleFonts.playfairDisplay(
          color: c.onPrimary,
          fontSize: size * 0.56,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
      ),
    );
  }
}

/// Brand row: logo mark + wordmark, pinned to the top of auth screens.
class BrandHeaderWidget extends StatelessWidget {
  const BrandHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const RespiraLogoMarkWidget(),
        const SizedBox(width: Spacing.control),
        Text(
          'RespiraAMS',
          style: TypographyTokens.bodyMedium(context)
              .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
