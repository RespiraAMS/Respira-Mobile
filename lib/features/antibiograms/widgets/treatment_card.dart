import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../design_system/design_system.dart';
import '../../antibiotic/models/antibiotic.dart';
import '../providers/antibiogram_provider.dart';

class TreatmentCard extends StatefulWidget {
  final String id;
  final String name;
  final String? note;

  const TreatmentCard({
    super.key, 
    required this.id, 
    required this.name, 
    this.note,
  });

  @override
  State<TreatmentCard> createState() => _TreatmentCardState();
}

class _TreatmentCardState extends State<TreatmentCard> {
  late Future<AntibioticDetail> _detailFuture;

  @override
  void initState() {
    super.initState();
    _detailFuture = context.read<AntibiogramProvider>().fetchAntibioticDetail(widget.id);
  }

  String _translateRoute(String route) {
    switch (route.toLowerCase()) {
      case 'oral': return 'Đường uống';
      case 'intravenous': return 'Tiêm tĩnh mạch';
      case 'intramuscular': return 'Tiêm bắp';
      default: return route;
    }
  }

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
      child: FutureBuilder<AntibioticDetail>(
        future: _detailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(widget.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                const SizedBox(height: 16),
                Center(child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: c.primary, strokeWidth: 2))),
              ],
            );
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(widget.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                const SizedBox(height: 12),
                AppText('Không tải được liều dùng', type: AppTextType.caption, color: c.error),
              ],
            );
          }

          final detail = snapshot.data!;
          final standardDosages = detail.dosages.where((d) => d.crcl == null).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(widget.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
              
              if (standardDosages.isEmpty) ...[
                const SizedBox(height: 12),
                const _RowTreatment('Liều dùng', 'Chưa có dữ liệu'),
              ] else ...[
                ...standardDosages.map((dosage) => Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    children: [
                      _RowTreatment('Đường dùng', _translateRoute(dosage.routeOfAdministration)),
                      const SizedBox(height: 8),
                      _RowTreatment('Liều dùng', dosage.dose),
                      const SizedBox(height: 8),
                      Divider(color: c.borderSubtle, height: 1),
                    ],
                  ),
                )),
              ],

              if (widget.note != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(color: c.primarySoft, borderRadius: BorderRadius.circular(16)),
                  child: AppText(widget.note!, type: AppTextType.caption, color: c.primary),
                )
              ]
            ],
          );
        },
      ),
    );
  }
}

class _RowTreatment extends StatelessWidget {
  final String label, value;
  const _RowTreatment(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(label, type: AppTextType.caption, fontWeight: FontWeight.w600),
        const SizedBox(width: Spacing.group),
        Expanded(
          child: AppText(
            value, 
            type: AppTextType.label, 
            color: context.respiraColors.textPrimary,
            textAlign: TextAlign.left, 
          ),
        ),
      ],
    );
  }
}