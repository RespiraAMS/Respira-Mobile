import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/calculator.dart';

part 'calculator_providers.freezed.dart';
part 'calculator_providers.g.dart';

/// The roster of clinical calculators shown on the 'Máy tính' list.
@Riverpod(keepAlive: true)
List<CalculatorId> calculatorList(CalculatorListRef ref) => CalculatorId.values;

/// Which detail tab is active: 0 = Nhập liệu, 1 = Giải thích.
@Riverpod(keepAlive: true)
class CalculatorDetailTabController
    extends _$CalculatorDetailTabController {
  @override
  int build() => 0;

  void setTab(int index) => state = index;
}

/// Inputs + revealed result of the CURB-65 calculator.
@freezed
class Curb65CalculatorState with _$Curb65CalculatorState {
  const factory Curb65CalculatorState({
    @Default(Curb65Input()) Curb65Input input,

    /// Whether the result card is visible (set by the Tính button).
    @Default(false) bool resultVisible,
  }) = _Curb65CalculatorState;
}

@Riverpod(keepAlive: true)
class Curb65CalculatorController extends _$Curb65CalculatorController {
  @override
  Curb65CalculatorState build() => const Curb65CalculatorState();

  void toggleConfusion() => state = state.copyWith(
        input: state.input.copyWith(confusion: !state.input.confusion),
      );

  void setUrea(String v) =>
      state = state.copyWith(input: state.input.copyWith(urea: v));

  void setRespRate(String v) =>
      state = state.copyWith(input: state.input.copyWith(respRate: v));

  void setSbp(String v) =>
      state = state.copyWith(input: state.input.copyWith(sbp: v));

  void setDbp(String v) =>
      state = state.copyWith(input: state.input.copyWith(dbp: v));

  void setAge(String v) =>
      state = state.copyWith(input: state.input.copyWith(age: v));

  /// 'Tính' — reveals the result card computed from the current inputs.
  void calculate() => state = state.copyWith(resultVisible: true);
}
