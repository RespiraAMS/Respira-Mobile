import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';
import '../models/pathogen.dart';
import '../providers/pathogen_api.dart';
import 'pathogen_detail_screen.dart';

class PathogenListScreen extends StatefulWidget {
  const PathogenListScreen({super.key});

  @override
  State<PathogenListScreen> createState() => _PathogenListScreenState();
}

class _PathogenListScreenState extends State<PathogenListScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Pathogen> _pathogens = [];
  
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
      final response = await PathogenApi.fetchPathogens(page: _currentPage);
      setState(() {
        _pathogens.addAll(response.items);
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
                title: 'Tác nhân gây bệnh',
                subtitle: 'Mô tả và độ nhạy',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: _pathogens.isEmpty && _isLoading
                  ? Center(child: CircularProgressIndicator(color: c.primary))
                  : ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(Spacing.group),
                      itemCount: _pathogens.length + (_hasMore ? 1 : 0),
                      separatorBuilder: (_, __) => const SizedBox(height: Spacing.control),
                      itemBuilder: (context, index) {
                        if (index == _pathogens.length) {
                          return Padding(
                            padding: const EdgeInsets.all(Spacing.group),
                            child: Center(child: CircularProgressIndicator(color: c.primary)),
                          );
                        }

                        final item = _pathogens[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => PathogenDetailScreen(pathogen: item)),
                          ),
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}