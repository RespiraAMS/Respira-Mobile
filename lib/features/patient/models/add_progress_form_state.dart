import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_progress_form_state.freezed.dart';
part 'add_progress_form_state.g.dart';

/// Treatment approach options ("Loại điều trị").
enum TreatmentType {
  empirical('Kinh nghiệm'),
  targeted('Điều trị đích');

  const TreatmentType(this.displayName);

  final String displayName;
}

/// Editable state of the "Thêm diễn biến" form.
@freezed
class AddProgressFormState with _$AddProgressFormState {
  const factory AddProgressFormState({
    @Default(TreatmentType.empirical) TreatmentType treatmentType,

    /// "Có kết quả vi sinh".
    @Default(true) bool microbiologyResult,

    /// "Đáp ứng kém".
    @Default(false) bool poorResponse,
  }) = _AddProgressFormState;

  factory AddProgressFormState.fromJson(Map<String, dynamic> json) =>
      _$AddProgressFormStateFromJson(json);
}
