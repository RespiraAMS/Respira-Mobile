import 'package:freezed_annotation/freezed_annotation.dart';

part 'microbiology_result.freezed.dart';
part 'microbiology_result.g.dart';

/// Antibiogram susceptibility (CLSI-style letter grades).
enum Susceptibility {
  s('S'),
  i('I'),
  r('R');

  const Susceptibility(this.letter);

  final String letter;
}

/// One selectable drug + administration-route option of the targeted
/// treatment screen.
@freezed
class TreatmentOption with _$TreatmentOption {
  const factory TreatmentOption({
    required String id,
    required String drug,

    /// e.g. "Tiêm tĩnh mạch".
    required String route,

    /// Short route for summary chips ("TM", "Uống").
    required String routeAbbrev,
    required String dosage,
    required Susceptibility susceptibility,
  }) = _TreatmentOption;

  factory TreatmentOption.fromJson(Map<String, dynamic> json) =>
      _$TreatmentOptionFromJson(json);
}

/// Microbiology findings backing the targeted-treatment flow.
@freezed
class MicrobiologyResult with _$MicrobiologyResult {
  const factory MicrobiologyResult({
    /// e.g. "Klebsiella pneumoniae".
    required String bacteria,

    /// e.g. "MIC level: Nhạy cảm có chọn lọc".
    required String antibiogramLine,
    @Default([]) List<TreatmentOption> options,
  }) = _MicrobiologyResult;

  factory MicrobiologyResult.fromJson(Map<String, dynamic> json) =>
      _$MicrobiologyResultFromJson(json);
}
