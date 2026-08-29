import 'package:flutter/material.dart';
import '../../../../design_system/design_system.dart';
import '../models/disease.dart';
import '../providers/disease_api.dart';
import 'disease_detail_screen.dart';

class DiseaseListScreen extends StatefulWidget {
  const DiseaseListScreen({super.key});

  @override
  State<DiseaseListScreen> createState() => _DiseaseListScreenState();
}

class _DiseaseListScreenState extends State<DiseaseListScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<Disease> _diseases = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _fetchPage();
    _scrollController.addListener(_onScroll);
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
      final response = await DiseaseApi.fetchDiseases(page: _currentPage);
      setState(() {
        _diseases.addAll(response.items);
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
                title: 'Bệnh lý',
                subtitle: 'Tiêu chí và ICU score',
                onBack: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: _diseases.isEmpty && _isLoading
                  ? Center(child: CircularProgressIndicator(color: c.primary))
                  : ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(Spacing.group),
                      itemCount: _diseases.length + (_hasMore ? 1 : 0),
                      separatorBuilder: (_, __) => const SizedBox(height: Spacing.control),
                      itemBuilder: (context, index) {
                        if (index == _diseases.length) {
                          return Padding(
                            padding: const EdgeInsets.all(Spacing.group),
                            child: Center(child: CircularProgressIndicator(color: c.primary)),
                          );
                        }

                        final item = _diseases[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => DiseaseDetailScreen(diseaseId: item.id)),
                          ),
                          child: AppSurface(
                            padding: const EdgeInsets.symmetric(horizontal: Spacing.group, vertical: Spacing.control),
                            child: AppText(item.name, type: AppTextType.bodyMedium, fontWeight: FontWeight.w600),
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