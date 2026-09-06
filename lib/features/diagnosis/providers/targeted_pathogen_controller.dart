import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'targeted_pathogen_controller.g.dart';

/// The pathogen the doctor picked on the "Chẩn đoán vi sinh" screen.
///
/// Auto-disposed: leaving the screen clears the selection, so the next
/// entry defaults to the first pathogen of `GET /pathogens/list`.
@riverpod
class TargetedPathogenController extends _$TargetedPathogenController {
  @override
  String? build() => null;

  void select(String pathogenId) => state = pathogenId;
}
