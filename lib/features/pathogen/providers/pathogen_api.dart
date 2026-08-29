import 'dart:convert';
import '../models/pathogen.dart';

class PaginatedPathogenResponse {
  final List<Pathogen> items;
  final bool hasNextPage;

  PaginatedPathogenResponse({required this.items, required this.hasNextPage});
}

class PathogenApi {
  static Future<PaginatedPathogenResponse> fetchPathogens({int page = 1, int pageSize = 10}) async {
    await Future.delayed(const Duration(seconds: 1)); // Fake network delay

    const String mockResponse = '''
    {
      "metadata": {
        "hasNextPage": false,
        "currentPage": 1
      },
      "items": [
        { "id": "109", "name": "Virus hô hấp", "description": "Virus hô hấp là nhóm các virus tấn công vào niêm mạc đường thở của con người..." },
        { "id": "107", "name": "Streptococcus pneumoniae", "description": "Streptococcus pneumoniae (Phế cầu khuẩn) là một loài cầu khuẩn Gram-dương..." },
        { "id": "108", "name": "Vi khuẩn gram âm đường ruột", "description": "Vi khuẩn Gram-âm đường ruột (chủ yếu thuộc họ Enterobacteriaceae)..." },
        { "id": "105", "name": "Pseudomonas aeruginosae", "description": "Pseudomonas aeruginosa (Trực khuẩn mủ xanh) là một loài vi khuẩn Gram-âm..." },
        { "id": "106", "name": "Staphylococus aureus", "description": "Staphylococcus aureus (Tụ cầu vàng) là một loài cầu khuẩn Gram-dương..." },
        { "id": "104", "name": "Mycoplasma pneumoniae", "description": "Mycoplasma pneumoniae là một loại vi khuẩn đặc biệt gây nhiễm trùng đường hô hấp..." },
        { "id": "103", "name": "Legionella spp", "description": "Legionella spp. (các loài Legionella) là một chi trực khuẩn Gram-âm..." },
        { "id": "102", "name": "Haemophilus influenzae", "description": "Haemophilus influenzae là một loài trực khuẩn Gram-âm..." },
        { "id": "101", "name": "Chlamydia pnuemoniae", "description": "Chlamydia pneumoniae là một loại vi khuẩn nội bào bắt buộc..." }
      ]
    }
    ''';

    final Map<String, dynamic> json = jsonDecode(mockResponse);
    final List<dynamic> itemsJson = json['items'];
    
    final bool hasNext = json['metadata']['hasNextPage'] ?? false;
    
    return PaginatedPathogenResponse(
      items: itemsJson.map((item) => Pathogen.fromJson(item)).toList(),
      hasNextPage: hasNext,
    );
  }
}