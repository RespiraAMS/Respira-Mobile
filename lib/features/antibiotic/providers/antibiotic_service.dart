import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../models/antibiotic.dart';

class PaginatedAntibioticResponse {
  final List<Antibiotic> items;
  final bool hasNextPage;

  PaginatedAntibioticResponse({required this.items, required this.hasNextPage});
}

class AntibioticRepository {
  final ApiClient apiClient;

  AntibioticRepository({required this.apiClient});

  Future<PaginatedAntibioticResponse> fetchAntibiotics({int page = 1, int pageSize = 10}) async {
    try {
      final response = await apiClient.dio.get(
        '/antibiotics',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
        },
      );

      final Map<String, dynamic> responseBody = response.data;
      
      final Map<String, dynamic> data = responseBody['data'] ?? {};
      
      final List<dynamic> itemsJson = data['items'] ?? [];
      final bool hasNext = data['metadata']?['hasNextPage'] ?? false;

      return PaginatedAntibioticResponse(
        items: itemsJson.map((item) => Antibiotic.fromJson(item)).toList(),
        hasNextPage: hasNext,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Lỗi server: ${e.response?.statusCode}');
      } else {
        throw Exception('Lỗi kết nối mạng: Vui lòng kiểm tra internet');
      }
    } catch (e) {
      throw Exception('Lỗi xử lý dữ liệu: $e');
    }
  }
}