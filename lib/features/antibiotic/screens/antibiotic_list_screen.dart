import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';
import '../models/antibiotic.dart';
import '../providers/antibiotic_api.dart';
import 'antibiotic_detail_screen.dart';

class AntibioticListScreen extends StatelessWidget {
  const AntibioticListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.respiraColors;

    return Scaffold(
      backgroundColor: c.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: 8),
              child: AppAppBar(
                title: 'Kháng sinh',
                subtitle: 'Danh mục hoạt chất',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Antibiotic>>(
                future: AntibioticApi.fetchAntibiotics(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator(color: c.primary));
                  }
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(child: AppText('Đã có lỗi xảy ra', color: c.error));
                  }

                  final antibiotics = snapshot.data!;
                  return ListView.separated(
                    padding: const EdgeInsets.all(Spacing.group),
                    itemCount: antibiotics.length,
                    separatorBuilder: (_, __) => const SizedBox(height: Spacing.control),
                    itemBuilder: (context, index) {
                      final item = antibiotics[index];
                      // Định dạng màu classification (Access -> Xanh, Watch -> Vàng, Reserve -> Đỏ)
                      final Color tagBg = item.classification == 'Access' ? c.successSoft 
                                        : item.classification == 'Watch' ? c.warningSoft : c.errorSoft;
                      final Color tagText = item.classification == 'Access' ? c.success 
                                        : item.classification == 'Watch' ? c.warning : c.error;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => AntibioticDetailScreen(antibiotic: item)),
                          );
                        },
                        child: AppSurface(
                          padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: Spacing.control),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(item.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                                    const SizedBox(height: 4),
                                    AppText(item.groupName, type: AppTextType.caption),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(color: tagBg, borderRadius: AppRadius.full),
                                child: AppText(item.classification, type: AppTextType.label, color: tagText),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}