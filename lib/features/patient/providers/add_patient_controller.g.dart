// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_patient_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addPatientControllerHash() =>
    r'4bb59cb3810fef33a9068072a938d01103a61f95';

/// Holds the "Thêm bệnh nhân" form state and submits it to
/// `POST /patients` (guidelines §2.1 Riverpod codegen).
///
/// Starts empty — every field is typed by the doctor.
///
/// Copied from [AddPatientController].
@ProviderFor(AddPatientController)
final addPatientControllerProvider =
    NotifierProvider<AddPatientController, AddPatientFormState>.internal(
      AddPatientController.new,
      name: r'addPatientControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$addPatientControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AddPatientController = Notifier<AddPatientFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
