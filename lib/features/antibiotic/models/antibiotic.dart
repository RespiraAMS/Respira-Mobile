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