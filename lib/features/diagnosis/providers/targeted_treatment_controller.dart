import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'microbiology_provider.dart';

part 'targeted_treatment_controller.g.dart';

/// Selected "thuốc + đường dùng" combinations of the targeted-treatment
/// screen. Chip labels are derived in selection order (P1, P2, …).
@riverpod
class TargetedTreatmentController extends _$TargetedTreatmentController {
  @override
  Set<String> build() {
    // Template defaults: the first two rows pre-selected.
    final options = ref.watch(microbiologyResultProvider).options;
    return {
      for (final option in options.take(2)) option.id,
    };
  }

  void toggle(String optionId) {
    final next = {...state};
    if (!next.remove(optionId)) {
      next.add(optionId);
    }
    state = next;
  }

  /// "P1 · Meropenem · TM" chips in selection order.
  List<String> summaryChips() {
    final options = ref.read(microbiologyResultProvider).options;
    final byId = {for (final o in options) o.id: o};
    var index = 0;
    return [
      for (final id in state)
        if (byId[id] != null)
          'P${++index} · ${byId[id]!.drug} · ${byId[id]!.routeAbbrev}',
    ];
  }
}
