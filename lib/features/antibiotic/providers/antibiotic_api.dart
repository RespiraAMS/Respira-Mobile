import 'dart:convert';
import '../models/antibiotic.dart';

class AntibioticApi {
  // Giả lập gọi API lấy danh sách
  static Future<List<Antibiotic>> fetchAntibiotics() async {
    await Future.delayed(const Duration(seconds: 1)); // Fake network delay

    const String mockResponse = '''
    {
      "statusCode": 200,
      "success": true,
      "data": {
        "items": [
          {
            "id": "00000000-0000-0000-0000-000000000328",
            "name": "Sulfamethoxazol/trimethoprim",
            "antibioticGroup": { "name": "Sulfonamid (Co-trimoxazol)" },
            "classification": "Access"
          },
          {
            "id": "00000000-0000-0000-0000-000000000327",
            "name": "Clindamycin",
            "antibioticGroup": { "name": "Lincosamid" },
            "classification": "Access"
          },
          {
            "id": "00000000-0000-0000-0000-000000000325",
            "name": "Doxycyclin",
            "antibioticGroup": { "name": "Tetracyclin thế hệ 2" },
            "classification": "Access"
          },
          {
            "id": "00000000-0000-0000-0000-000000000324",
            "name": "Linezolid",
            "antibioticGroup": { "name": "Oxazolidinon" },
            "classification": "Reserve"
          },
          {
            "id": "00000000-0000-0000-0000-000000000322",
            "name": "Vancomycin",
            "antibioticGroup": { "name": "Glycopeptid" },
            "classification": "Watch"
          }
        ]
      }
    }
    ''';

    final Map<String, dynamic> json = jsonDecode(mockResponse);
    final List<dynamic> items = json['data']['items'];
    
    return items.map((item) => Antibiotic.fromJson(item)).toList();
  }
}