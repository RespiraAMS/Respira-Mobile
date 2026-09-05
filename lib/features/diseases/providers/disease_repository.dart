import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../models/disease.dart';

class PaginatedDiseaseResponse {
  final List<Disease> items;
  final bool hasNextPage;

  PaginatedDiseaseResponse({required this.items, required this.hasNextPage});
}

class DiseaseRepository {
  final ApiClient apiClient;

  DiseaseRepository({required this.apiClient});

  Future<PaginatedDiseaseResponse> fetchDiseases({int page = 1, int pageSize = 10}) async {
    try {
      final response = await apiClient.dio.get(
        '/diseases',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
        },
      );

      final Map<String, dynamic> responseBody = response.data;
      final Map<String, dynamic> data = responseBody['data'] ?? {};
      
      final List<dynamic> itemsJson = data['items'] ?? [];
      final bool hasNext = data['metadata']?['hasNextPage'] ?? false;

      return PaginatedDiseaseResponse(
        items: itemsJson.map((item) => Disease.fromJson(item)).toList(),
        hasNextPage: hasNext,
      );
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Lỗi xử lý dữ liệu: $e');
    }
  }

  Future<DiseaseDetail> fetchDiseaseDetail(String id) async {
    try {
      final response = await apiClient.dio.get('/diseases/$id');
      
      final Map<String, dynamic> responseBody = response.data;
      final Map<String, dynamic> data = responseBody['data'] ?? responseBody; 

      return DiseaseDetail.fromJson(data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Lỗi xử lý dữ liệu: $e');
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.response != null) {
      return Exception('Lỗi server: ${e.response?.statusCode}');
    } else {
      return Exception('Lỗi kết nối mạng: Vui lòng kiểm tra internet');
    }
  }
}