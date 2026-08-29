import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/patient.dart';

part 'current_patient_provider.g.dart';

/// The patient shown on detail/progress screens.
///
/// Backed by the demo record; swap the body for a repository call once the
/// networking layer (dio + retrofit) is in place.
@riverpod
Patient currentPatient(CurrentPatientRef ref) => samplePatient;
