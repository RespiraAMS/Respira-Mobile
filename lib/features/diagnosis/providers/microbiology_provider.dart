import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/microbiology_result.dart';

part 'microbiology_provider.g.dart';

/// Demo microbiology findings — swap for a repository call once the
/// networking layer (dio + retrofit) exists.
@Riverpod(keepAlive: true)
MicrobiologyResult microbiologyResult(MicrobiologyResultRef ref) =>
    const MicrobiologyResult(
      bacteria: 'Klebsiella pneumoniae',
      antibiogramLine: 'MIC level: Nhạy cảm có chọn lọc',
      options: [
        TreatmentOption(
          id: 'meropenem-iv',
          drug: 'Meropenem',
          route: 'Tiêm tĩnh mạch',
          routeAbbrev: 'TM',
          dosage: '1 g mỗi 8 giờ',
          susceptibility: Susceptibility.s,
        ),
        TreatmentOption(
          id: 'amoxicillin-oral',
          drug: 'Amoxicillin',
          route: 'Uống',
          routeAbbrev: 'Uống',
          dosage: '1 g mỗi 8 giờ',
          susceptibility: Susceptibility.s,
        ),
        TreatmentOption(
          id: 'amoxicillin-iv',
          drug: 'Amoxicillin',
          route: 'Tiêm tĩnh mạch',
          routeAbbrev: 'TM',
          dosage: '1 g mỗi 8 giờ',
          susceptibility: Susceptibility.s,
        ),
        TreatmentOption(
          id: 'amikacin-iv',
          drug: 'Amikacin',
          route: 'Tiêm tĩnh mạch',
          routeAbbrev: 'TM',
          dosage: '15 mg/kg mỗi 24 giờ',
          susceptibility: Susceptibility.s,
        ),
      ],
    );
