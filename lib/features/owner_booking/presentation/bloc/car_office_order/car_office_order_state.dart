part of 'car_office_order_bloc.dart';

enum GetCarOfficeOrdersStatus { init, loading, failed, succ }

enum ActionCarOfficeOrdersStatus { init, loading, failed, succ }

class CarOfficeOrderState {
  final ActionCarOfficeOrdersStatus actionCarOfficeOrdersStatus;
  final GetCarOfficeOrdersStatus getCarOfficeOrdersStatus;

  final List<CarBookingOwnerModel> orderCarOffices;

  CarOfficeOrderState({
    this.actionCarOfficeOrdersStatus = ActionCarOfficeOrdersStatus.init,
    this.getCarOfficeOrdersStatus = GetCarOfficeOrdersStatus.init,
    this.orderCarOffices = const [],
  });

  CarOfficeOrderState copyWith({
    ActionCarOfficeOrdersStatus? actionCarOfficeOrdersStatus,
    GetCarOfficeOrdersStatus? getCarOfficeOrdersStatus,
    List<CarBookingOwnerModel>? orderCarOffices,
  }) {
    return CarOfficeOrderState(
      actionCarOfficeOrdersStatus:
          actionCarOfficeOrdersStatus ?? this.actionCarOfficeOrdersStatus,
      getCarOfficeOrdersStatus:
          getCarOfficeOrdersStatus ?? this.getCarOfficeOrdersStatus,
      orderCarOffices: orderCarOffices ?? this.orderCarOffices,
    );
  }
}
