import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../models/antibiotic_group.dart';

class PaginatedGroupResponse {
  final List<AntibioticGroup> items;
  final bool hasNextPage;

  PaginatedGroupResponse({required this.items, required this.hasNextPage});
}

class AntibioticGroupRepository {
  final ApiClient apiClient;

  AntibioticGroupRepository({required this.apiClient});

  Future<PaginatedGroupResponse> fetchGroups({int page = 1, int pageSize = 10}) async {
    try {
      final response = await apiClient.dio.get(
        '/antibiotic-groups',
        queryParameters: {
          'page': page,
          'pageSize': pageSize,
        },
      );

      final Map<String, dynamic> responseBody = response.data;
      final Map<String, dynamic> data = responseBody['data'] ?? {};
      
      final List<dynamic> itemsJson = data['items'] ?? [];
      final bool hasNext = data['metadata']?['hasNextPage'] ?? false;

      return PaginatedGroupResponse(
        items: itemsJson.map((item) => AntibioticGroup.fromJson(item)).toList(),
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