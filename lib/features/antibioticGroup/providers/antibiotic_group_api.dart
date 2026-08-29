import 'dart:convert';
import '../models/antibiotic_group.dart';

class PaginatedGroupResponse {
  final List<AntibioticGroup> items;
  final bool hasNextPage;

  PaginatedGroupResponse({required this.items, required this.hasNextPage});
}

class AntibioticGroupApi {
  // Giả lập API có phân trang
  static Future<PaginatedGroupResponse> fetchGroups({int page = 1, int pageSize = 10}) async {
    await Future.delayed(const Duration(seconds: 1)); // Fake network delay

    // Data mock từ API bạn cung cấp
    const String mockResponse = '''
    {
      "metadata": {
        "hasNextPage": true,
        "currentPage": 1
      },
      "items": [
        { "id": "219", "name": "5-nitro-imidazol", "parentId": "216", "parentName": "Các nhóm kháng sinh khác" },
        { "id": "218", "name": "Oxazolidinon", "parentId": "216", "parentName": "Các nhóm kháng sinh khác" },
        { "id": "217", "name": "Sulfonamid (Co-trimoxazol)", "parentId": "216", "parentName": "Các nhóm kháng sinh khác" },
        { "id": "216", "name": "Các nhóm kháng sinh khác", "parentId": null, "parentName": null },
        { "id": "215", "name": "Fluoroquinolon (thế hệ 2, 3, 4)", "parentId": "213", "parentName": "Quinolon" },
        { "id": "214", "name": "Quinolon thế hệ 1", "parentId": "213", "parentName": "Quinolon" },
        { "id": "213", "name": "Quinolon", "parentId": null, "parentName": null },
        { "id": "212", "name": "Lipopeptid", "parentId": "20f", "parentName": "Peptid" },
        { "id": "211", "name": "Polypeptid", "parentId": "20f", "parentName": "Peptid" },
        { "id": "20f", "name": "Peptid", "parentId": null, "parentName": null }
      ]
    }
    ''';

    final Map<String, dynamic> json = jsonDecode(mockResponse);
    final List<dynamic> itemsJson = json['items'];
    
    final isLastPage = page >= 3; 
    
    return PaginatedGroupResponse(
      items: itemsJson.map((item) => AntibioticGroup.fromJson(item)).toList(),
      hasNextPage: !isLastPage,
    );
  }
}