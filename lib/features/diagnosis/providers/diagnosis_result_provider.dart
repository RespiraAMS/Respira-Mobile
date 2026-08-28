import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/diagnosis_result.dart';
import 'diagnosis_controller.dart';

part 'diagnosis_result_provider.g.dart';

/// Builds the diagnosis result from the wizard selections.
///
/// Demo derivation rules (pending real clinical logic): CURB-65 ≥ 3 →
/// high severity / inpatient care. Medicines & references mirror the
/// Figma templates.
@Riverpod(keepAlive: true)
DiagnosisResult currentDiagnosisResult(CurrentDiagnosisResultRef ref) {
  // Reactive on the wizard selections; severity/care derived from the score.
  final criteria = ref.watch(diagnosisCriteriaControllerProvider);
  final score = criteria.selectedCurb65Criteria.length;
  final isHigh = score >= 3;

  return DiagnosisResult(
    diagnosisName: 'Viêm phổi cộng đồng',
    modeLabel: 'Kinh nghiệm',
    curbScore: score,
    severityLabel: isHigh ? 'Cao' : 'Thấp',
    severityIsHigh: isHigh,
    careSettingLabel: isHigh ? 'Nội trú' : 'Ngoại trú',
    riskLabel: isHigh ? 'Nguy cơ cao' : 'Nguy cơ thấp',
    medicines: const [
      DiagnosisMedicine(name: 'Ceftriaxone', regimenLine: 'Phác đồ A · Kháng sinh'),
      DiagnosisMedicine(name: 'Azithromycin', regimenLine: 'Phác đồ A · Kháng sinh'),
      DiagnosisMedicine(name: 'Piperacillin', regimenLine: 'Phác đồ B · Kháng sinh'),
      DiagnosisMedicine(name: 'Levofloxacin', regimenLine: 'Phác đồ B · Kháng sinh'),
    ],
    references: const [
      DiagnosisReference(
        source: 'Bộ Y tế · v3 · 2024',
        detail: 'Phác đồ A · Viêm phổi cộng đồng nặng',
      ),
      DiagnosisReference(
        source: 'ATS/IDSA · v2 · 2019',
        detail: 'Phác đồ B · Viêm phổi cộng đồng nặng / ICU',
      ),
    ],
  );
}
