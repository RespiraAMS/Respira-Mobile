import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/add_progress_form_state.dart';

part 'add_progress_controller.g.dart';

/// Holds the "Thêm diễn biến" form state.
@riverpod
class AddProgressController extends _$AddProgressController {
  @override
  AddProgressFormState build() => const AddProgressFormState();

  void selectTreatment(TreatmentType type) {
    state = state.copyWith(treatmentType: type);
  }

  void toggleMicrobiologyResult() {
    state = state.copyWith(microbiologyResult: !state.microbiologyResult);
  }

  void togglePoorResponse() {
    state = state.copyWith(poorResponse: !state.poorResponse);
  }
}
