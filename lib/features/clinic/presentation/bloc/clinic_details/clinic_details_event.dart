part of 'clinic_details_bloc.dart';

sealed class ClinicDetailsEvent {
  const ClinicDetailsEvent();
}

class ShowClinicDetailsEvent extends ClinicDetailsEvent {
  final int clinicId;

  ShowClinicDetailsEvent({required this.clinicId});
}
