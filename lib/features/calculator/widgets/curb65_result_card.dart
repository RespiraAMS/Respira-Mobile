import 'package:flutter/material.dart';

import 'package:respira_mobile/design_system/design_system.dart';
import 'package:respira_mobile/features/diagnosis/widgets/risk_pill_widget.dart';

/// Result card of the CURB-65 calculator: title · score (0–5) · risk pill
/// · advice line. Band mapping: 0–1 low, 2 watch, 3–5 high (inpatient
/// consideration) — color always paired with the pill's label (§12).
class Curb65ResultCard extends StatelessWidget {
  const Curb65ResultCard({super.key, required this.score});

  final int score;

  String get _riskLabel => score >= 3
      ? 'Nguy cơ cao'
      : score == 2
          ? 'Cần theo dõi'
          : 'Nguy cơ thấp';

  String get _advice => score >= 3
      ? 'Điểm $score → cân nhắc điều trị nội trú'
      : score == 2
          ? 'Điểm $score → cân nhắc nhập viện ngắn hạn'
          : 'Điểm $score → có thể điều trị ngoại trú';

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Container(
      padding: const EdgeInsets.all(Spacing.control + 2),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: AppRadius.md,
        border: Border.all(color: c.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'CURB-65',
                  style: TypographyTokens.body(context)
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                '$score điểm',
                style: TypographyTokens.h3(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: score >= 3 ? c.warning : c.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spacing.inline),
          RiskPillWidget(label: _riskLabel, isHigh: score >= 3),
          const SizedBox(height: Spacing.inline),
          AppText(_advice, type: AppTextType.caption, maxLines: 2),
        ],
      ),
    );
  }
}
