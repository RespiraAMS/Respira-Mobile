import 'package:flutter/material.dart';
import '../models/disease.dart';
import './disease_repository.dart';

class DiseaseProvider extends ChangeNotifier {
  final DiseaseRepository _repository;

  DiseaseProvider(this._repository);

  final List<Disease> _items = [];
  List<Disease> get items => _items;

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
      final response = await _repository.fetchDiseases(page: _currentPage);
      
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

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<DiseaseDetail> fetchDiseaseDetail(String id) {
    return _repository.fetchDiseaseDetail(id);
  }
}