import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../../../core/network/api_client.dart';
import '../../empiricTreatmentProtocols/providers/protocol_provider.dart';
import '../../empiricTreatmentProtocols/providers/protocol_repository.dart';
import '../../empiricTreatmentProtocols/screens/protocol_detail_screen.dart';
import '../models/disease.dart';
import '../providers/disease_provider.dart';
import '../widgets/info_row_with_icon.dart';
import '../widgets/disease_info_row.dart';

class DiseaseDetailScreen extends StatefulWidget {
  final String diseaseId;

  const DiseaseDetailScreen({super.key, required this.diseaseId});

  @override
  State<DiseaseDetailScreen> createState() => _DiseaseDetailScreenState();
}

class _DiseaseDetailScreenState extends State<DiseaseDetailScreen> {
  late Future<DiseaseDetail> _detailFuture;

  @override
  void initState() {
    super.initState();
    _detailFuture = context.read<DiseaseProvider>().fetchDiseaseDetail(widget.diseaseId);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: FutureBuilder<DiseaseDetail>(
          future: _detailFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: c.primary));
            }
            if (!snapshot.hasData || snapshot.hasError) {
              return Center(
                child: AppText(
                  'Không tải được thông tin: ${snapshot.error}', 
                  color: c.error,
                ),
              );
            }

            final detail = snapshot.data!;
            final nameParts = detail.name.split('-');
            final shortName = nameParts.first.trim();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
                  child: AppAppBar(
                    title: shortName,
                    subtitle: 'Bệnh lý hô hấp',
                    onBack: () => Navigator.pop(context),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(Spacing.group, 8, Spacing.group, Spacing.screen),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Spacing.block),
                        decoration: BoxDecoration(color: c.primarySoft, borderRadius: BorderRadius.circular(18)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 52, height: 52,
                              decoration: BoxDecoration(color: c.surface, shape: BoxShape.circle),
                              child: Icon(LucideIcons.activity, color: c.iconPrimary, size: 24),
                            ),
                            const SizedBox(width: Spacing.control),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(detail.name, type: AppTextType.h3, fontWeight: FontWeight.w700),
                                  const SizedBox(height: 4),
                                  AppText('Bệnh lý hô hấp', type: AppTextType.caption),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.section),

                      AppText('Thông tin bệnh', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      const SizedBox(height: Spacing.control),
                      AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        [
                          InfoRowWithIcon(
                            icon: LucideIcons.accessibility, 
                            title: 'Ngưỡng ICU', 
                            label: 'Điểm đánh giá mức độ nặng', 
                            value: '${detail.icuScoreThreshold}'
                          ),
                          const InfoRowWithIcon(
                            icon: LucideIcons.stethoscope, 
                            title: 'Điều trị thường gặp', 
                            label: 'Hình thức điều trị', 
                            value: 'Nội trú / Ngoại trú'
                          ),
                        ],
                      ),
                      const SizedBox(height: Spacing.section),

                      AppText('Tác nhân thường gặp', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      const SizedBox(height: Spacing.control),
                      AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        detail.causes.map((cause) => DiseaseSimpleRow(title: cause)).toList(),
                      ),
                      const SizedBox(height: Spacing.section),

                      AppText('Tiêu chí ICU', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      const SizedBox(height: Spacing.control),
                      AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        detail.icuCriteria.map((c) => DiseaseInfoRow(
                          title: c.name, 
                          subtitle: '', 
                          value: '+${c.score} điểm'
                        )).toList(),
                      ),
                      const SizedBox(height: Spacing.section),

                      AppText('Nguy cơ', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      const SizedBox(height: Spacing.control),
                      AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        detail.risks.map((r) => DiseaseInfoRow(
                          title: r.name, 
                          subtitle: r.type, 
                          value: r.pathogenName
                        )).toList(),
                      ),
                      const SizedBox(height: Spacing.section),
                      AppText('Phác đồ điều trị kinh nghiệm', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      const SizedBox(height: Spacing.control),
                      
                      if (detail.empiricTreatmentProtocols.isEmpty)
                        AppText('Chưa có phác đồ cho bệnh lý này', color: c.textSecondary)
                      else
                        AppCard.divided(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          detail.empiricTreatmentProtocols.map((p) => Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                // Điều hướng sang màn hình Protocol Detail có tiêm Provider
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChangeNotifierProvider(
                                      create: (_) {
                                        final apiClient = ApiClient(); 
                                        final repo = ProtocolRepository(apiClient: apiClient);
                                        return ProtocolProvider(repo);
                                      },
                                      child: ProtocolDetailScreen(protocolId: p.id),
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(p.name, type: AppTextType.label, color: c.textPrimary, fontWeight: FontWeight.w600),
                                          const SizedBox(height: 2),
                                          AppText('${p.issuer} · Phiên bản ${p.version}', type: AppTextType.caption, color: c.textSecondary),
                                        ],
                                      ),
                                    ),
                                    Icon(LucideIcons.chevronRight, color: c.iconDefault, size: 20),
                                  ],
                                ),
                              ),
                            ),
                          )).toList(),
                        ),
                      const SizedBox(height: Spacing.screen),
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

class DiseaseSimpleRow extends StatelessWidget {
  final String title;

  const DiseaseSimpleRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: SizedBox(
        width: double.infinity,
        child: AppText(
          title, 
          type: AppTextType.bodyMedium, 
          fontWeight: FontWeight.w600, 
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}