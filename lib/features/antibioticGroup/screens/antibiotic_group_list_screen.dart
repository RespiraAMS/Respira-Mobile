import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';
import '../models/antibiotic_group.dart';
import '../providers/antibiotic_group_api.dart';
import 'antibiotic_group_detail_screen.dart';

class AntibioticGroupListScreen extends StatefulWidget {
  const AntibioticGroupListScreen({super.key});

  @override
  State<AntibioticGroupListScreen> createState() => _AntibioticGroupListScreenState();
}

class _AntibioticGroupListScreenState extends State<AntibioticGroupListScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<AntibioticGroup> _groups = [];
  
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchPage();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _fetchPage();
    }
  }

  Future<void> _fetchPage() async {
    if (_isLoading || !_hasMore) return;

    setState(() => _isLoading = true);

    try {
      final response = await AntibioticGroupApi.fetchGroups(page: _currentPage);
      setState(() {
        _groups.addAll(response.items);
        _hasMore = response.hasNextPage;
        _currentPage++;
      });
    } catch (e) {
      if (mounted) showAppToast(context, 'Lỗi tải dữ liệu');
    } finally {
      if (mounted) setState(() => _isLoading = false);
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
              child: _groups.isEmpty && _isLoading
                  ? Center(child: CircularProgressIndicator(color: c.primary))
                  : ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(Spacing.group),
                      itemCount: _groups.length + (_hasMore ? 1 : 0),
                      separatorBuilder: (_, __) => const SizedBox(height: Spacing.control),
                      itemBuilder: (context, index) {
                        if (index == _groups.length) {
                          return Padding(
                            padding: const EdgeInsets.all(Spacing.group),
                            child: Center(child: CircularProgressIndicator(color: c.primary)),
                          );
                        }

                        final item = _groups[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => AntibioticGroupDetailScreen(group: item)),
                          ),
                          child: AppSurface(
                            padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: Spacing.control),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(item.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                                if (item.parentName != null) ...[
                                  const SizedBox(height: 4),
                                  AppText(item.parentName!, type: AppTextType.caption),
                                ],
                              ],
                            ),
                          ),
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