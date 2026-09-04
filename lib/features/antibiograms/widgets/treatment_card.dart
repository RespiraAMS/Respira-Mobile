import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';

class TreatmentCard extends StatelessWidget {
  final String name;
  final String? note;

  const TreatmentCard({super.key, required this.name, this.note});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: c.surface,
        border: Border.all(color: c.borderSubtle),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
          const SizedBox(height: 12),
          const _RowTreatment('Liều dùng', 'Không có dữ liệu'),
          const SizedBox(height: 8),
          const _RowTreatment('Đường dùng', 'Không có dữ liệu'),
          const SizedBox(height: 8),
          const _RowTreatment('Tần suất', 'Không có dữ liệu'),
          if (note != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(color: c.primarySoft, borderRadius: BorderRadius.circular(16)),
              child: AppText(note!, type: AppTextType.caption, color: c.primary),
            )
          ]
        ],
      ),
    );
  }
}

class _RowTreatment extends StatelessWidget {
  final String label, value;
  const _RowTreatment(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(label, type: AppTextType.label, color: c.textSecondary),
        AppText(value, type: AppTextType.bodyMedium, fontWeight: FontWeight.w500),
      ],
    );
  }
}