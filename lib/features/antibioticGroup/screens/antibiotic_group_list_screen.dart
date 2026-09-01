import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../design_system/design_system.dart';
import '../../../core/network/api_client.dart';
import '../providers/antibiotic_group_provider.dart';
import '../providers/antibiotic_group_service.dart';
import 'antibiotic_group_detail_screen.dart';

class AntibioticGroupListScreen extends StatefulWidget {
  const AntibioticGroupListScreen({super.key});

  @override
  State<AntibioticGroupListScreen> createState() => _AntibioticGroupListScreenState();
}

class _AntibioticGroupListScreenState extends State<AntibioticGroupListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AntibioticGroupProvider>().fetchPage();
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      context.read<AntibioticGroupProvider>().fetchPage();
    }
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
                title: 'Nhóm kháng sinh',
                subtitle: 'Phân loại và mô tả',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: Consumer<AntibioticGroupProvider>(
                builder: (context, provider, child) {
                  if (provider.errorMessage != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showAppToast(context, provider.errorMessage!);
                      provider.clearError(); 
                    });
                  }

                  if (provider.items.isEmpty && provider.isLoading) {
                    return Center(child: CircularProgressIndicator(color: c.primary));
                  }

                  return ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(Spacing.group),
                    itemCount: provider.items.length + (provider.hasMore ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(height: Spacing.control),
                    itemBuilder: (context, index) {
                      // Indicator load thêm dữ liệu ở cuối danh sách
                      if (index == provider.items.length) {
                        return Padding(
                          padding: const EdgeInsets.all(Spacing.group),
                          child: Center(child: CircularProgressIndicator(color: c.primary)),
                        );
                      }

                      final item = provider.items[index];
                      return GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider(
                                create: (_) {
                                  final apiClient = ApiClient(); 
                                  final repository = AntibioticGroupRepository(apiClient: apiClient);
                                  return AntibioticGroupProvider(repository);
                                },
                                child: AntibioticGroupDetailScreen(group: item),
                              ),
                            ),
                          )
                        },
                        child: AppSurface(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Spacing.group,
                            vertical: Spacing.control,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                item.name,
                                type: AppTextType.bodyMedium,
                                fontWeight: FontWeight.w600,
                              ),
                              if (item.parentName != null) ...[
                                const SizedBox(height: 4),
                                AppText(item.parentName!, type: AppTextType.caption),
                              ],
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