part of 'clinics_bloc.dart';

abstract class ClinicsEvent {
  const ClinicsEvent();
}

class GetClinicSpecializationEvent extends ClinicsEvent {}

class GetClinicsEvent extends ClinicsEvent {
  final bool isReload;

  GetClinicsEvent(this.isReload);
}

class ChangeClinicSpecializationEvent extends ClinicsEvent {
  final int? clinicSpecializationId;

  ChangeClinicSpecializationEvent({this.clinicSpecializationId});
}
