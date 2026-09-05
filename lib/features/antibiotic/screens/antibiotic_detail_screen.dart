import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../design_system/design_system.dart';
import '../models/antibiotic.dart';
import '../providers/antibiotic_provider.dart';
import '../widgets/detail_row.dart';
import '../widgets/gfr_card.dart';
import '../widgets/pathogen_tag.dart';

class AntibioticDetailScreen extends StatefulWidget {
  final Antibiotic antibiotic;

  const AntibioticDetailScreen({super.key, required this.antibiotic});

  @override
  State<AntibioticDetailScreen> createState() => _AntibioticDetailScreenState();
}

class _AntibioticDetailScreenState extends State<AntibioticDetailScreen> {
  late Future<AntibioticDetail> _detailFuture;

  @override
  void initState() {
    super.initState();
    _detailFuture = context.read<AntibioticProvider>().fetchAntibioticDetail(widget.antibiotic.id);
  }

  String _translateRoute(String route) {
    switch (route.toLowerCase()) {
      case 'oral': return 'Đường uống';
      case 'intravenous': return 'Tiêm tĩnh mạch';
      case 'intramuscular': return 'Tiêm bắp';
      default: return route;
    }
  }

  String _buildGfrTitle(Crcl crcl) {
    final min = crcl.min ?? 0;
    final max = crcl.max ?? double.infinity;
    
    if (max > 1000) {
      return 'GFR ${crcl.isMinExclusive ? '>' : '≥'} $min mL/phút';
    }
    if (min == 0) {
      return 'GFR ${crcl.isMaxExclusive ? '<' : '≤'} $max mL/phút';
    }
    return 'GFR $min – $max mL/phút';
  }

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: FutureBuilder<AntibioticDetail>(
          future: _detailFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
                    child: AppAppBar(
                      title: widget.antibiotic.name,
                      subtitle: 'Thông tin kháng sinh',
                      onBack: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(child: Center(child: CircularProgressIndicator(color: c.primary))),
                ],
              );
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return Center(child: AppText('Không thể tải dữ liệu: ${snapshot.error}', color: c.error));
            }

            final detail = snapshot.data!;
            
            final standardDosages = detail.dosages.where((d) => d.crcl == null).toList();
            final adjustedDosages = detail.dosages.where((d) => d.crcl != null).toList();

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
                  child: AppAppBar(
                    title: detail.name,
                    subtitle: 'Thông tin kháng sinh',
                    onBack: () => Navigator.pop(context),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(Spacing.group, 8, Spacing.group, Spacing.screen),
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                        decoration: BoxDecoration(
                          color: c.primarySoft,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 56, height: 56,
                              decoration: BoxDecoration(color: c.surface, shape: BoxShape.circle),
                              child: Icon(LucideIcons.pill, color: c.iconPrimary, size: 24),
                            ),
                            const SizedBox(height: Spacing.group),
                            AppText(detail.name, type: AppTextType.h3, fontWeight: FontWeight.w700),
                            const SizedBox(height: 4),
                            AppText(detail.groupName, type: AppTextType.caption),
                            const SizedBox(height: Spacing.control),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                              decoration: BoxDecoration(color: c.surface, borderRadius: AppRadius.full),
                              child: AppText(detail.classification, type: AppTextType.label, color: c.primary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Spacing.section),

                      AppText('Liều dùng', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      const SizedBox(height: Spacing.control),
                      AppCard.divided(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        standardDosages.isEmpty 
                            ? [const DetailRow(label: 'Liều chuẩn', value: 'Chưa có thông tin')]
                            : standardDosages.map((d) => DetailRow(
                                label: _translateRoute(d.routeOfAdministration), 
                                value: d.dose,
                              )).toList(),
                      ),
                      const SizedBox(height: Spacing.section),

                      if (adjustedDosages.isNotEmpty) ...[
                        AppText('Điều chỉnh theo GFR', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                        const SizedBox(height: Spacing.control),
                        ...adjustedDosages.map((d) {
                          final crcl = d.crcl!;
                          // final min = crcl.min ?? 0;
                          
                          // String tag = 'Điều chỉnh';
                          // Color tagBg = c.warningSoft;
                          // Color tagColor = c.warning;

                          // if (min >= 30) {
                          //   tag = 'Chuẩn'; tagBg = c.successSoft; tagColor = c.success;
                          // } else if (min < 10) {
                          //   tag = 'Giảm liều'; tagBg = c.errorSoft; tagColor = c.error;
                          // }

                          // return Padding(
                          //   padding: const EdgeInsets.only(bottom: Spacing.control),
                          //   child: GfrCard(
                          //     title: _buildGfrTitle(crcl),
                          //     sub: '[${_translateRoute(d.routeOfAdministration)}] ${d.dose}',
                          //     tag: tag,
                          //     tagBg: tagBg,
                          //     tagColor: tagColor,
                          //   ),
                          // );


                          String tag = _translateRoute(d.routeOfAdministration);
                          Color tagBg = c.warningSoft;
                          Color tagColor = c.warning;
                          if(d.routeOfAdministration.toLowerCase() == 'oral') {
                            tagBg = c.successSoft;
                            tagColor = c.success;
                          } else if(d.routeOfAdministration.toLowerCase() == 'intravenous') {
                            tagBg = c.primarySoft;
                            tagColor = c.primary;
                          } else if(d.routeOfAdministration.toLowerCase() == 'intramuscular') {
                            tagBg = c.infoSoft;
                            tagColor = c.info;
                          }

                          return Padding(
                            padding: const EdgeInsets.only(bottom: Spacing.control),
                            child: GfrCard(
                              title: _buildGfrTitle(crcl),
                              sub: d.dose,
                              tag: tag,
                              tagBg: tagBg,
                              tagColor: tagColor,
                            ),
                          );



                        }),
                        const SizedBox(height: Spacing.section),
                      ],

                      // AppText('Tác nhân nhạy cảm (Phát triển sau)', type: AppTextType.bodyLarge, fontWeight: FontWeight.w700),
                      // const SizedBox(height: Spacing.control),
                      // AppSurface(
                      //   padding: const EdgeInsets.all(16),
                      //   child: Wrap(
                      //     spacing: 8, runSpacing: 8,
                      //     children: [
                      //       PathogenTag('S. pneumoniae', bg: c.successSoft, color: c.success),
                      //       PathogenTag('Enterobacterales', bg: c.warningSoft, color: c.warning),
                      //     ],
                      //   ),
                      // ),
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