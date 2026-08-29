import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';
import '../models/antibiogram.dart';
import '../providers/antibiogram_api.dart';
import 'antibiogram_detail_screen.dart';

class AntibiogramListScreen extends StatefulWidget {
  const AntibiogramListScreen({super.key});

  @override
  State<AntibiogramListScreen> createState() => _AntibiogramListScreenState();
}

class _AntibiogramListScreenState extends State<AntibiogramListScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Antibiogram> _antibiograms = [];
  
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
      final response = await AntibiogramApi.fetchAntibiograms(page: _currentPage);
      setState(() {
        _antibiograms.addAll(response.items);
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
                title: 'Kháng sinh đồ',
                subtitle: 'S / I / R và MIC',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: _antibiograms.isEmpty && _isLoading
                  ? Center(child: CircularProgressIndicator(color: c.primary))
                  : ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(Spacing.group),
                      itemCount: _antibiograms.length + (_hasMore ? 1 : 0),
                      separatorBuilder: (_, __) => const SizedBox(height: Spacing.control),
                      itemBuilder: (context, index) {
                        if (index == _antibiograms.length) {
                          return Padding(
                            padding: const EdgeInsets.all(Spacing.group),
                            child: Center(child: CircularProgressIndicator(color: c.primary)),
                          );
                        }

                        final item = _antibiograms[index];
                        
                        final Color tagBg = item.micLevel == 'Susceptible' ? c.successSoft 
                                          : item.micLevel == 'Intermediate' ? c.warningSoft : c.errorSoft;
                        final Color tagText = item.micLevel == 'Susceptible' ? c.success 
                                            : item.micLevel == 'Intermediate' ? c.warning : c.error;

                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => AntibiogramDetailScreen(antibiogram: item)),
                          ),
                          child: AppSurface(
                            padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: Spacing.control),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(item.pathogen.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
                                      const SizedBox(height: 4),
                                      AppText('${item.firstPriorityMedicines.length} thuốc ưu tiên', type: AppTextType.caption),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(color: tagBg, borderRadius: AppRadius.full),
                                  child: AppText(item.micLevel, type: AppTextType.label, color: tagText),
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