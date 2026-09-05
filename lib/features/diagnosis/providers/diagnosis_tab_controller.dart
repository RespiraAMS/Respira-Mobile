import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/diagnosis_result.dart';

part 'diagnosis_tab_controller.g.dart';

/// Active tab of the diagnosis-result screen.
@riverpod
class DiagnosisTabController extends _$DiagnosisTabController {
  @override
  DiagnosisTab build() => DiagnosisTab.result;

  void select(DiagnosisTab tab) => state = tab;
}
