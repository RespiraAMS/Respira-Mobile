import 'dart:convert';
import '../models/disease.dart';

class PaginatedDiseaseResponse {
  final List<Disease> items;
  final bool hasNextPage;

  PaginatedDiseaseResponse({required this.items, required this.hasNextPage});
}

class DiseaseApi {
  static Future<PaginatedDiseaseResponse> fetchDiseases({int page = 1, int pageSize = 10}) async {
    await Future.delayed(const Duration(seconds: 1)); 

    const String mockListResponse = '''
    {
      "metadata": { "hasNextPage": false },
      "items": [
        { "id": "701", "name": "Viêm phổi cộng đồng - CAP" }
      ]
    }
    ''';

    final Map<String, dynamic> json = jsonDecode(mockListResponse);
    final List<dynamic> itemsJson = json['items'];
    
    return PaginatedDiseaseResponse(
      items: itemsJson.map((item) => Disease.fromJson(item)).toList(),
      hasNextPage: json['metadata']['hasNextPage'] ?? false,
    );
  }

  static Future<DiseaseDetail> fetchDiseaseDetail(String id) async {
    await Future.delayed(const Duration(milliseconds: 600));

    const String mockDetailResponse = '''
    {
      "id": "701",
      "name": "Viêm phổi cộng đồng - CAP",
      "description": "Viêm phổi cộng đồng (VPCĐ)...",
      "icuScoreThreshold": 3,
      "icuHospitalizeCriteria": [
        { "criterion": { "name": "Lú lẫn" }, "score": 1 },
        { "criterion": { "name": "Nhịp thở >= 30" }, "score": 1 },
        { "criterion": { "name": "Sốc nhiễm khuẩn" }, "score": 3 }
      ],
      "resistanceRiskFactors": [
        { "criterion": { "name": "Điều trị kháng sinh trong 3 tháng" }, "name": "Kháng thuốc CA-MRSA" },
        { "criterion": { "name": "Nhập viện gần đây" }, "name": "Nghi ngờ trực khuẩn Gram âm" }
      ],
      "causes": [
        { "pathogenName": "S. pneumoniae" },
        { "pathogenName": "H. influenzae" },
        { "pathogenName": "K. pneumoniae" }
      ]
    }
    ''';

    return DiseaseDetail.fromJson(jsonDecode(mockDetailResponse));
  }
}