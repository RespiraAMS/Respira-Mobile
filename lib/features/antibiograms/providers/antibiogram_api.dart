import 'dart:convert';
import '../models/antibiogram.dart';

class PaginatedAntibiogramResponse {
  final List<Antibiogram> items;
  final bool hasNextPage;

  PaginatedAntibiogramResponse({required this.items, required this.hasNextPage});
}

class AntibiogramApi {
  // Giả lập API có phân trang (Infinite Scrolling)
  static Future<PaginatedAntibiogramResponse> fetchAntibiograms({int page = 1, int pageSize = 10}) async {
    await Future.delayed(const Duration(seconds: 1)); // Fake network delay

    const String mockResponse = '''
    {
      "metadata": {
        "hasNextPage": false,
        "currentPage": 1
      },
      "items": [
        {
          "id": "505",
          "pathogen": { "id": "102", "name": "Haemophilus influenzae" },
          "micLevel": "Resistance",
          "mics": [ { "id": "302", "name": "Ampicilin" }, { "id": "303", "name": "Amoxicillin" } ],
          "firstPriorityMedicines": [ { "id": "304", "name": "Amoxicillin/acid clavulanic" },
          {
            "id": "00000000-0000-0000-0000-00000000030f",
            "name": "Ceftriaxon"
          } ],
          "secondPriorityMedicines": [ { "id": "31c", "name": "Ciprofloxacin" } ]
        },
        {
          "id": "504",
          "pathogen": { "id": "102", "name": "Haemophilus influenzae" },
          "micLevel": "Susceptible",
          "mics": [ { "id": "302", "name": "Ampicilin" } ],
          "firstPriorityMedicines": [ { "id": "302", "name": "Ampicilin" } ],
          "secondPriorityMedicines": [ { "id": "31c", "name": "Ciprofloxacin" } ]
        },
        {
          "id": "503",
          "pathogen": { "id": "107", "name": "Streptococcus pneumoniae" },
          "micLevel": "Resistance",
          "mics": [ { "id": "301", "name": "Penicilin G (Benzylpenicillin)" } ],
          "firstPriorityMedicines": [ { "id": "314", "name": "Ceftarolin" } ],
          "secondPriorityMedicines": [ { "id": "31d", "name": "Moxifloxacin" } ]
        }
      ]
    }
    ''';

    final Map<String, dynamic> json = jsonDecode(mockResponse);
    final List<dynamic> itemsJson = json['items'];
    
    final bool hasNext = json['metadata']['hasNextPage'] ?? false;
    
    return PaginatedAntibiogramResponse(
      items: itemsJson.map((item) => Antibiogram.fromJson(item)).toList(),
      hasNextPage: hasNext,
    );
  }
}