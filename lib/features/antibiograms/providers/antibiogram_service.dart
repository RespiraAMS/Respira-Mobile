import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../models/antibiogram.dart';

class PaginatedAntibiogramResponse {
  final List<Antibiogram> items;
  final bool hasNextPage;

  PaginatedAntibiogramResponse({required this.items, required this.hasNextPage});
}

class AntibiogramRepository {
  final ApiClient apiClient;

  AntibiogramRepository({required this.apiClient});

  Future<PaginatedAntibiogramResponse> fetchAntibiograms({int page = 1, int pageSize = 10}) async {
    try {
      final response = await apiClient.dio.get(
        '/antibiograms',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
        },
      );

      final Map<String, dynamic> responseBody = response.data;
      
      final Map<String, dynamic> data = responseBody['data'] ?? {};
      
      final List<dynamic> itemsJson = data['items'] ?? [];
      final bool hasNext = data['metadata']?['hasNextPage'] ?? false;

      return PaginatedAntibiogramResponse(
        items: itemsJson.map((item) => Antibiogram.fromJson(item)).toList(),
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