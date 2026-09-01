import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../design_system/design_system.dart';
import '../../../core/network/api_client.dart';
import '../providers/disease_provider.dart';
import '../providers/disease_repository.dart';
import 'disease_detail_screen.dart';

class DiseaseListScreen extends StatefulWidget {
  const DiseaseListScreen({super.key});

  @override
  State<DiseaseListScreen> createState() => _DiseaseListScreenState();
}

class _DiseaseListScreenState extends State<DiseaseListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DiseaseProvider>().fetchPage();
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
      context.read<DiseaseProvider>().fetchPage();
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
                title: 'Bệnh lý',
                subtitle: 'Tiêu chí và ICU score',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: Consumer<DiseaseProvider>(
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
                      if (index == provider.items.length) {
                        return Padding(
                          padding: const EdgeInsets.all(Spacing.group),
                          child: Center(child: CircularProgressIndicator(color: c.primary)),
                        );
                      }

                      final item = provider.items[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChangeNotifierProvider(
                              create: (_) {
                                final apiClient = ApiClient(); 
                                final repository = DiseaseRepository(apiClient: apiClient);
                                return DiseaseProvider(repository);
                              },
                              child: DiseaseDetailScreen(diseaseId: item.id),
                            ),
                          ),
                        ),
                        child: AppSurface(
                          padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: Spacing.control),
                          child: AppText(item.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
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