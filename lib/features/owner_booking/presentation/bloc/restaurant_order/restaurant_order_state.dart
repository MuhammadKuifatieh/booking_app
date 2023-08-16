part of 'restaurant_order_bloc.dart';

enum GetRestaurantOrdersStatus { init, loading, failed, succ }

enum ActionRestaurantOrdersStatus { init, loading, failed, succ }

class RestaurantOrderState {
  final ActionRestaurantOrdersStatus actionRestaurantOrdersStatus;
  final GetRestaurantOrdersStatus getRestaurantOrdersStatus;

  final List<RestaurantBookingOwnerModel> orderRestaurants;

  RestaurantOrderState({
    this.actionRestaurantOrdersStatus = ActionRestaurantOrdersStatus.init,
    this.getRestaurantOrdersStatus = GetRestaurantOrdersStatus.init,
    this.orderRestaurants = const [],
  });

  RestaurantOrderState copyWith({
    ActionRestaurantOrdersStatus? actionRestaurantOrdersStatus,
    GetRestaurantOrdersStatus? getRestaurantOrdersStatus,
    List<RestaurantBookingOwnerModel>? orderRestaurants,
  }) {
    return RestaurantOrderState(
      actionRestaurantOrdersStatus:
          actionRestaurantOrdersStatus ?? this.actionRestaurantOrdersStatus,
      getRestaurantOrdersStatus:
          getRestaurantOrdersStatus ?? this.getRestaurantOrdersStatus,
      orderRestaurants: orderRestaurants ?? this.orderRestaurants,
    );
  }
}
