class AntibiogramPathogen {
  final String id;
  final String name;

  const AntibiogramPathogen({required this.id, required this.name});

  factory AntibiogramPathogen.fromJson(Map<String, dynamic> json) {
    return AntibiogramPathogen(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class AntibiogramMedicine {
  final String id;
  final String name;

  const AntibiogramMedicine({required this.id, required this.name});

  factory AntibiogramMedicine.fromJson(Map<String, dynamic> json) {
    return AntibiogramMedicine(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Antibiogram {
  final String id;
  final AntibiogramPathogen pathogen;
  final String micLevel;
  final List<AntibiogramMedicine> mics;
  final List<AntibiogramMedicine> firstPriorityMedicines;
  final List<AntibiogramMedicine> secondPriorityMedicines;

  const Antibiogram({
    required this.id,
    required this.pathogen,
    required this.micLevel,
    required this.mics,
    required this.firstPriorityMedicines,
    required this.secondPriorityMedicines,
  });

  factory Antibiogram.fromJson(Map<String, dynamic> json) {
    return Antibiogram(
      id: json['id'] ?? '',
      pathogen: AntibiogramPathogen.fromJson(json['pathogen'] ?? {}),
      micLevel: json['micLevel'] ?? '',
      mics: (json['mics'] as List?)?.map((m) => AntibiogramMedicine.fromJson(m)).toList() ?? [],
      firstPriorityMedicines: (json['firstPriorityMedicines'] as List?)?.map((m) => AntibiogramMedicine.fromJson(m)).toList() ?? [],
      secondPriorityMedicines: (json['secondPriorityMedicines'] as List?)?.map((m) => AntibiogramMedicine.fromJson(m)).toList() ?? [],
    );
  }
}