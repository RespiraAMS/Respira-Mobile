import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../design_system/design_system.dart';
import '../providers/antibiotic_provider.dart';
import 'antibiotic_detail_screen.dart';

class AntibioticListScreen extends StatefulWidget {
  const AntibioticListScreen({super.key});

  @override
  State<AntibioticListScreen> createState() => _AntibioticListScreenState();
}

class _AntibioticListScreenState extends State<AntibioticListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Gọi fetchPage khi màn hình khởi tạo (nếu chưa có dữ liệu)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AntibioticProvider>();
      if (provider.items.isEmpty) {
        provider.fetchPage();
      }
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<AntibioticProvider>().fetchPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
              child: Consumer<AntibioticProvider>(
                builder: (context, provider, child) {
                  // 1. Đang tải trang đầu tiên
                  if (provider.isLoading && provider.items.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(color: c.primary),
                    );
                  }

                  // 2. Lỗi khi tải trang đầu tiên
                  if (provider.errorMessage != null && provider.items.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(provider.errorMessage!, color: c.error),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => provider.fetchPage(),
                            child: AppSurface(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: AppText('Thử lại', color: c.primary),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  // 3. Danh sách trống
                  if (provider.items.isEmpty) {
                    return Center(
                      child: AppText('Không có dữ liệu kháng sinh'),
                    );
                  }

                  // 4. Hiển thị danh sách dữ liệu
                  return ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(Spacing.group),
                    itemCount: provider.items.length + (provider.hasMore ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(height: Spacing.control),
                    itemBuilder: (context, index) {
                      if (index == provider.items.length) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: Spacing.control),
                          child: Center(
                            child: provider.errorMessage != null
                                ? GestureDetector(
                                    onTap: () => provider.fetchPage(),
                                    child: AppText(
                                      'Không thể tải thêm. Nhấn để thử lại',
                                      type: AppTextType.caption,
                                      color: c.error,
                                    ),
                                  )
                                : CircularProgressIndicator(color: c.primary),
                          ),
                        );
                      }

                      final item = provider.items[index];
                      final Color tagBg = item.classification == 'Access'
                          ? c.successSoft
                          : item.classification == 'Watch'
                              ? c.warningSoft
                              : c.errorSoft;
                      final Color tagText = item.classification == 'Access'
                          ? c.success
                          : item.classification == 'Watch'
                              ? c.warning
                              : c.error;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AntibioticDetailScreen(antibiotic: item),
                            ),
                          );
                        },
                        child: AppSurface(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Spacing.group,
                            vertical: Spacing.control,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      item.name,
                                      type: AppTextType.bodyMedium,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const SizedBox(height: 4),
                                    AppText(
                                      item.groupName,
                                      type: AppTextType.caption,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: tagBg,
                                  borderRadius: AppRadius.full,
                                ),
                                child: AppText(
                                  item.classification,
                                  type: AppTextType.label,
                                  color: tagText,
                                ),
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