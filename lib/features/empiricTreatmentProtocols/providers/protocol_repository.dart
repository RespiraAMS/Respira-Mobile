import 'package:dio/dio.dart';
import '../../../core/network/api_client.dart';
import '../models/protocol.dart';

class ProtocolRepository {
  final ApiClient apiClient;

  ProtocolRepository({required this.apiClient});

  Future<ProtocolDetail> fetchProtocolDetail(String id) async {
    try {
      final response = await apiClient.dio.get('/empiric-treatment-protocols/$id');
      final Map<String, dynamic> responseBody = response.data;
      final Map<String, dynamic> data = responseBody['data'] ?? {}; 

      return ProtocolDetail.fromJson(data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Lỗi server: ${e.response?.statusCode}');
      } else {
        throw Exception('Lỗi kết nối mạng');
      }
    } catch (e) {
      throw Exception('Lỗi xử lý dữ liệu: $e');
    }
  }
}