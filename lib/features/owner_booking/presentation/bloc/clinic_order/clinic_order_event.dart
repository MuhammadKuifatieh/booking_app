part of 'clinic_order_bloc.dart';

sealed class ClinicOrderEvent {
  const ClinicOrderEvent();
}

class GetClinicOrdersEvent extends ClinicOrderEvent {
  final int clinicId;

  GetClinicOrdersEvent({required this.clinicId});
}

class AcceptClinicOrderEvent extends ClinicOrderEvent {
  final int clinicId;

  AcceptClinicOrderEvent({required this.clinicId});
}

class RejectClinicOrderEvent extends ClinicOrderEvent {
  final int clinicId;

  RejectClinicOrderEvent({required this.clinicId});
}
