class Antibiotic {
  final String id;
  final String name;
  final String groupName;
  final String classification;

  const Antibiotic({
    required this.id,
    required this.name,
    required this.groupName,
    required this.classification,
  });

  factory Antibiotic.fromJson(Map<String, dynamic> json) {
    return Antibiotic(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      groupName: json['antibioticGroup'] != null ? json['antibioticGroup']['name'] ?? '' : '',
      classification: json['classification'] ?? '',
    );
  }
}

class Crcl {
  final num? min;
  final bool isMinExclusive;
  final num? max;
  final bool isMaxExclusive;

  Crcl({this.min, this.isMinExclusive = false, this.max, this.isMaxExclusive = false});

  factory Crcl.fromJson(Map<String, dynamic> json) {
    return Crcl(
      min: json['min'],
      isMinExclusive: json['isMinExclusive'] ?? false,
      max: json['max'],
      isMaxExclusive: json['isMaxExclusive'] ?? false,
    );
  }
}

class Dosage {
  final String id;
  final String routeOfAdministration;
  final String dose;
  final Crcl? crcl;

  Dosage({
    required this.id,
    required this.routeOfAdministration,
    required this.dose,
    this.crcl,
  });

  factory Dosage.fromJson(Map<String, dynamic> json) {
    return Dosage(
      id: json['id'] ?? '',
      routeOfAdministration: json['routeOfAdministration'] ?? '',
      dose: json['dose'] ?? '',
      crcl: json['crcl'] != null ? Crcl.fromJson(json['crcl']) : null,
    );
  }
}

class AntibioticDetail {
  final String id;
  final String name;
  final String groupName;
  final String classification;
  final List<Dosage> dosages;

  AntibioticDetail({
    required this.id,
    required this.name,
    required this.groupName,
    required this.classification,
    required this.dosages,
  });

  factory AntibioticDetail.fromJson(Map<String, dynamic> json) {
    final dosagesJson = json['dosages'] as List<dynamic>? ?? [];
    return AntibioticDetail(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      groupName: json['antibioticGroup']?['name'] ?? '',
      classification: json['classification'] ?? '',
      dosages: dosagesJson.map((d) => Dosage.fromJson(d)).toList(),
    );
  }
}