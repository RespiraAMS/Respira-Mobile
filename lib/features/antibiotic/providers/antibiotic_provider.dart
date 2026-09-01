import 'package:flutter/material.dart';
import '../models/antibiotic.dart';
import './antibiotic_service.dart';

class AntibioticProvider extends ChangeNotifier {
  final AntibioticRepository _repository;

  AntibioticProvider(this._repository);

  final List<Antibiotic> _items = [];
  List<Antibiotic> get items => _items;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasMore = true;
  bool get hasMore => _hasMore;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  int _currentPage = 1;
  String _searchQuery = '';

  Future<void> fetchPage() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _repository.fetchAntibiotics(page: _currentPage, name: _searchQuery);
      
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

  void search(String query) {
    if (_searchQuery == query) return;
    
    _searchQuery = query;
    _currentPage = 1;
    _items.clear();
    _hasMore = true;
    _isLoading = false; 
    
    fetchPage();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}