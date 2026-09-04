class Disease {
  final String id;
  final String name;

  const Disease({required this.id, required this.name});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class DiseaseDetail extends Disease {
  final String description;
  final int icuScoreThreshold;
  final List<String> causes;
  final List<DiseaseCriterion> icuCriteria;
  final List<DiseaseRisk> risks;

  const DiseaseDetail({
    required super.id,
    required super.name,
    required this.description,
    required this.icuScoreThreshold,
    required this.causes,
    required this.icuCriteria,
    required this.risks,
  });

  factory DiseaseDetail.fromJson(Map<String, dynamic> json) {
    // Trích xuất danh sách tác nhân gây bệnh (lọc trùng lặp)
    final causesList = (json['causes'] as List?)
            ?.map((c) => c['pathogenName'].toString())
            .toSet()
            .toList() ?? [];

    final criteriaList = (json['icuHospitalizeCriteria'] as List?)
            ?.map((c) => DiseaseCriterion(
                  name: c['criterion']['name'],
                  type: c['criterion']['type'],
                  score: c['score'],
                ))
            .toList() ?? [];

    final riskList = (json['resistanceRiskFactors'] as List?)
            ?.map((r) => DiseaseRisk(
                  name: r['criterion']['name'],
                  pathogenName: r['pathogenName'],
                  type: r['name'],
                ))
            .toList() ?? [];

    return DiseaseDetail(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icuScoreThreshold: json['icuScoreThreshold'] ?? 0,
      causes: causesList,
      icuCriteria: criteriaList,
      risks: riskList,
    );
  }
}

class DiseaseCriterion {
  final String name;
  final int score;
  final String type;
  const DiseaseCriterion({required this.name, required this.score, required this.type});
}

class DiseaseRisk {
  final String name;
  final String type;
  final String pathogenName;
  const DiseaseRisk({required this.name, required this.type, required this.pathogenName});
}