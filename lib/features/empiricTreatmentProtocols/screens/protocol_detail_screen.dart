import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../models/protocol.dart';
import '../providers/protocol_provider.dart';

class ProtocolDetailScreen extends StatefulWidget {
  final String protocolId;

  const ProtocolDetailScreen({super.key, required this.protocolId});

  @override
  State<ProtocolDetailScreen> createState() => _ProtocolDetailScreenState();
}

class _ProtocolDetailScreenState extends State<ProtocolDetailScreen> {
  late Future<ProtocolDetail> _detailFuture;

  @override
  void initState() {
    super.initState();
    // Gọi API thông qua Provider
    _detailFuture = context.read<ProtocolProvider>().fetchProtocolDetail(widget.protocolId);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: FutureBuilder<ProtocolDetail>(
          future: _detailFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: c.primary));
            }
            if (!snapshot.hasData || snapshot.hasError) {
              return Center(child: AppText('Không tải được thông tin phác đồ', color: c.error));
            }

            final detail = snapshot.data!;
            final subtitle = '${detail.severity} · ${detail.treatmentSite}';

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
                  child: AppAppBar(
                    title: 'Chi tiết phác đồ',
                    subtitle: subtitle,
                    onBack: () => Navigator.pop(context),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(Spacing.group, 8, Spacing.group, Spacing.screen),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Spacing.block),
                        decoration: BoxDecoration(
                          color: c.primarySoft,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 52, height: 52,
                              decoration: BoxDecoration(color: c.surface, shape: BoxShape.circle),
                              child: Icon(LucideIcons.clipboardList, color: c.iconPrimary, size: 24),
                            ),
                            const SizedBox(width: Spacing.control),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(detail.name, type: AppTextType.h3, fontWeight: FontWeight.w700),
                                  const SizedBox(height: 4),
                                  AppText(subtitle, type: AppTextType.caption),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.section),

                      AppText('Thông tin ban hành', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      const SizedBox(height: Spacing.control),
                      AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        [
                          _InfoRow(label: 'Đơn vị', value: detail.issuer),
                          _InfoRow(label: 'Phiên bản', value: '${detail.version}'),
                          _InfoRow(label: 'Ngày ban hành', value: detail.issueDate),
                          _InfoRow(label: 'Mức độ', value: detail.severity),
                          _InfoRow(label: 'Nơi điều trị', value: detail.treatmentSite),
                        ],
                      ),
                      const SizedBox(height: Spacing.section),

                      if (detail.targetPathogenName != null) ...[
                        AppText('Tiêu chí áp dụng', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                        const SizedBox(height: Spacing.control),
                        AppCard.divided(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          [
                             _ListRow(
                               title: 'Vi khuẩn mục tiêu',
                               subtitle: detail.targetPathogenName!,
                             ),
                          ],
                        ),
                        const SizedBox(height: Spacing.section),
                      ],

                      AppText('Thuốc trong phác đồ', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      const SizedBox(height: Spacing.control),
                      AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        detail.medicines.map((med) => _ListRow(
                          title: med.name, 
                          subtitle: '', 
                        )).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(label, type: AppTextType.label, color: c.textSecondary),
          Expanded(
            child: AppText(
              value, 
              type: AppTextType.label, 
              color: c.textPrimary, 
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListRow extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ListRow({
    required this.title, 
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(title, type: AppTextType.label, color: c.textPrimary, fontWeight: FontWeight.w600),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 2),
              AppText(subtitle, type: AppTextType.caption, color: c.textSecondary, fontWeight: FontWeight.w400),
            ],
          ],
        ),
      ),
    );
  }
}