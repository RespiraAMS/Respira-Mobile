import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/patient.dart';
import 'active_patient_provider.dart';

part 'current_patient_provider.g.dart';

/// The patient shown on detail/progress/wizard screens — mirrors the
/// [activePatientControllerProvider] so a freshly created patient flows
/// through the whole diagnosis journey.
@riverpod
Patient currentPatient(CurrentPatientRef ref) =>
    ref.watch(activePatientControllerProvider);
