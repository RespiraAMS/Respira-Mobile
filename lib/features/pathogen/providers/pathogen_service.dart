import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../../antibiograms/models/antibiogram.dart';
import '../models/pathogen.dart';

class PaginatedPathogenResponse {
  final List<Pathogen> items;
  final bool hasNextPage;

  PaginatedPathogenResponse({required this.items, required this.hasNextPage});
}

class PathogenRepository {
  final ApiClient apiClient;

  PathogenRepository({required this.apiClient});

  Future<PaginatedPathogenResponse> fetchPathogens({int page = 1, int pageSize = 10, String? name}) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'pageSize': pageSize,
      };
      if (name != null && name.trim().isNotEmpty) {
        queryParams['name'] = name.trim();
      }
      final response = await apiClient.dio.get(
        '/pathogens',
        queryParameters: queryParams,
      );

      final Map<String, dynamic> responseBody = response.data;
      final Map<String, dynamic> data = responseBody['data'] ?? {};
      
      final List<dynamic> itemsJson = data['items'] ?? [];
      final bool hasNext = data['metadata']?['hasNextPage'] ?? false;

      return PaginatedPathogenResponse(
        items: itemsJson.map((item) => Pathogen.fromJson(item)).toList(),
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

  Future<List<Antibiogram>> fetchPathogenAntibiograms(String pathogenId) async {
    try {
      final response = await apiClient.dio.get(
        '/antibiograms',
        queryParameters: {
          'PathogenId': pathogenId,
        },
      );

      final Map<String, dynamic> responseBody = response.data;
      final Map<String, dynamic> data = responseBody['data'] ?? {};
      final List<dynamic> itemsJson = data['items'] ?? [];

      return itemsJson.map((item) => Antibiogram.fromJson(item)).toList();
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