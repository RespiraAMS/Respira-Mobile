class ProtocolSummary {
  final String id;
  final String name;
  final String issuer;
  final String issueDate;
  final int version;

  const ProtocolSummary({
    required this.id,
    required this.name,
    required this.issuer,
    required this.issueDate,
    required this.version,
  });

  factory ProtocolSummary.fromJson(Map<String, dynamic> json) {
    return ProtocolSummary(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      issuer: json['issuer'] ?? '',
      issueDate: json['issueDate'] ?? '',
      version: json['version'] ?? 1,
    );
  }
}

class ProtocolMedicine {
  final String id;
  final String name;

  const ProtocolMedicine({required this.id, required this.name});

  factory ProtocolMedicine.fromJson(Map<String, dynamic> json) {
    return ProtocolMedicine(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class ProtocolDetail {
  final String id;
  final String name;
  final String issuer;
  final String issueDate;
  final int version;
  final String severity;
  final String treatmentSite;
  final String? targetPathogenName;
  final List<ProtocolMedicine> medicines;

  const ProtocolDetail({
    required this.id,
    required this.name,
    required this.issuer,
    required this.issueDate,
    required this.version,
    required this.severity,
    required this.treatmentSite,
    this.targetPathogenName,
    required this.medicines,
  });

  factory ProtocolDetail.fromJson(Map<String, dynamic> json) {
    return ProtocolDetail(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      issuer: json['issuer'] ?? '',
      issueDate: json['issueDate'] ?? '',
      version: json['version'] ?? 1,
      severity: _translateSeverity(json['severity'] ?? ''),
      treatmentSite: _translateSite(json['treatmentSite'] ?? ''),
      targetPathogenName: json['specialInfection'] != null ? json['specialInfection']['name'] : null,
      medicines: (json['medicines'] as List?)?.map((m) => ProtocolMedicine.fromJson(m)).toList() ?? [],
    );
  }

  static String _translateSeverity(String sev) {
    switch (sev) {
      case 'Severe': return 'Nặng';
      case 'Moderate': return 'Trung bình';
      case 'Mild': return 'Nhẹ';
      default: return sev;
    }
  }

  static String _translateSite(String site) {
    switch (site) {
      case 'IntensiveCareUnit': return 'Hồi sức tích cực (ICU)';
      case 'Inpatient': return 'Nội trú';
      case 'Outpatient': return 'Ngoại trú';
      default: return site;
    }
  }
}