import 'package:flutter/material.dart';
import '../../antibiograms/models/antibiogram.dart';
import '../models/pathogen.dart';
import 'pathogen_service.dart';

class PathogenProvider extends ChangeNotifier {
  final PathogenRepository _repository;

  PathogenProvider(this._repository);

  final List<Pathogen> _items = [];
  List<Pathogen> get items => _items;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _currentPage = 1;

  Future<void> fetchPage() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _repository.fetchPathogens(page: _currentPage);
      
      _items.addAll(response.items);
      _hasMore = response.hasNextPage;
      _currentPage++;
    } catch (e) {
      _errorMessage = 'Lỗi tải dữ liệu: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<Antibiogram>> fetchPathogenAntibiograms(String pathogenId) {
    return _repository.fetchPathogenAntibiograms(pathogenId);
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}