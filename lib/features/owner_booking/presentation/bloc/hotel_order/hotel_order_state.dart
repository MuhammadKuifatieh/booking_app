part of 'hotel_order_bloc.dart';

enum GetHotelOrdersStatus { init, loading, failed, succ }

enum ActionHotelOrdersStatus { init, loading, failed, succ }

class HotelOrderState {
  final ActionHotelOrdersStatus actionHotelOrdersStatus;
  final GetHotelOrdersStatus getHotelOrdersStatus;

  final List<HotelBookingOwnerModel> orderHotels;

  HotelOrderState({
    this.actionHotelOrdersStatus = ActionHotelOrdersStatus.init,
    this.getHotelOrdersStatus = GetHotelOrdersStatus.init,
    this.orderHotels = const [],
  });

  HotelOrderState copyWith({
    ActionHotelOrdersStatus? actionHotelOrdersStatus,
    GetHotelOrdersStatus? getHotelOrdersStatus,
    List<HotelBookingOwnerModel>? orderHotels,
  }) {
    return HotelOrderState(
      actionHotelOrdersStatus:
          actionHotelOrdersStatus ?? this.actionHotelOrdersStatus,
      getHotelOrdersStatus: getHotelOrdersStatus ?? this.getHotelOrdersStatus,
      orderHotels: orderHotels ?? this.orderHotels,
    );
  }
}
