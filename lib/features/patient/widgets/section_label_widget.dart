import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';

/// Field legend / section header label (Label scale, primary color).
class SectionLabelWidget extends StatelessWidget {
  const SectionLabelWidget(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TypographyTokens.label(context)
          .copyWith(color: context.respiraColors.textPrimary),
    );
  }
}
