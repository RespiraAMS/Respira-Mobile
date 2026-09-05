class AntibioticGroup {
  final String id;
  final String name;
  final String? parentId;
  final String? parentName;
  final String? description;

  const AntibioticGroup({
    required this.id,
    required this.name,
    this.parentId,
    this.parentName,
    this.description,
  });

  factory AntibioticGroup.fromJson(Map<String, dynamic> json) {
    return AntibioticGroup(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      parentId: json['parentId'],
      parentName: json['parentName'],
      description: json['description']
    );
  }
}