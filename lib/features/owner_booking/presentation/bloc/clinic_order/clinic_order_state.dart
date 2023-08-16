part of 'clinic_order_bloc.dart';

enum GetClinicOrdersStatus { init, loading, failed, succ }

enum ActionClinicOrdersStatus { init, loading, failed, succ }

class ClinicOrderState {
  final ActionClinicOrdersStatus actionClinicOrdersStatus;
  final GetClinicOrdersStatus getClinicOrdersStatus;

  final List<ClinicBookingOwnerModel> orderClinics;

  ClinicOrderState({
    this.actionClinicOrdersStatus = ActionClinicOrdersStatus.init,
    this.getClinicOrdersStatus = GetClinicOrdersStatus.init,
    this.orderClinics = const [],
  });

  ClinicOrderState copyWith({
    ActionClinicOrdersStatus? actionClinicOrdersStatus,
    GetClinicOrdersStatus? getClinicOrdersStatus,
    List<ClinicBookingOwnerModel>? orderClinics,
  }) {
    return ClinicOrderState(
      actionClinicOrdersStatus:
          actionClinicOrdersStatus ?? this.actionClinicOrdersStatus,
      getClinicOrdersStatus:
          getClinicOrdersStatus ?? this.getClinicOrdersStatus,
      orderClinics: orderClinics ?? this.orderClinics,
    );
  }
}
