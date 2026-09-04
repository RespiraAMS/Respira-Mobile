import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import '../../../../design_system/design_system.dart';
import '../../../core/network/api_client.dart';
import '../providers/pathogen_provider.dart';
import '../providers/pathogen_service.dart';
import 'pathogen_detail_screen.dart';

class PathogenListScreen extends StatefulWidget {
  const PathogenListScreen({super.key});

  @override
  State<PathogenListScreen> createState() => _PathogenListScreenState();
}

class _PathogenListScreenState extends State<PathogenListScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PathogenProvider>().fetchPage();
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      context.read<PathogenProvider>().fetchPage();
    }
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        context.read<PathogenProvider>().search(query);
      }
    });
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
                title: 'Tác nhân gây bệnh',
                subtitle: 'Mô tả và độ nhạy',
                onBack: () => Navigator.pop(context),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.group),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm tác nhân...',
                  hintStyle: TextStyle(color: c.textSecondary),
                  prefixIcon: Icon(LucideIcons.search, color: c.iconDefault, size: 20),
                  filled: true,
                  fillColor: c.surface,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: c.textPrimary),
              ),
            ),
            
            const SizedBox(height: Spacing.control),
            Expanded(
              child: Consumer<PathogenProvider>(
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

                  if (provider.items.isEmpty && !provider.isLoading) {
                    return Center(
                      child: AppText('Không tìm thấy kết quả nào.', color: c.textSecondary),
                    );
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
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChangeNotifierProvider(
                                create: (_) {
                                  final apiClient = ApiClient(); 
                                  final repository = PathogenRepository(apiClient: apiClient);
                                  return PathogenProvider(repository);
                                },
                                child: PathogenDetailScreen(pathogen: item),
                              ),
                            ),
                          )
                        },
                        child: AppSurface(
                          padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: Spacing.control),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(item.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                              const SizedBox(height: 4),
                              AppText(
                                item.description, 
                                type: AppTextType.caption, 
                                maxLines: 2, 
                                overflow: TextOverflow.ellipsis,
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