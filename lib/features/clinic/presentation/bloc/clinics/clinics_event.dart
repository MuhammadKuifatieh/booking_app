part of 'clinics_bloc.dart';

abstract class ClinicsEvent {
  const ClinicsEvent();
}

class GetClinicSpecializationEvent extends ClinicsEvent {}

class GetClinicsEvent extends ClinicsEvent with EventWithReload {
  @override
  final bool isReload;
  final int? clinicSpecializationId;

  GetClinicsEvent({
    this.isReload = false,
    required this.clinicSpecializationId,
  });
}

class ChangeClinicSpecializationEvent extends ClinicsEvent {
  final int? clinicSpecializationId;

  ChangeClinicSpecializationEvent({this.clinicSpecializationId});
}
