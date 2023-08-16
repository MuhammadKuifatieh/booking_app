part of 'restaurant_order_bloc.dart';

sealed class RestaurantOrderEvent {
  const RestaurantOrderEvent();
}

class GetRestaurantOrdersEvent extends RestaurantOrderEvent {
  final int restaurantId;

  GetRestaurantOrdersEvent({required this.restaurantId});
}

class AcceptRestaurantOrderEvent extends RestaurantOrderEvent {
  final int restaurantId;

  AcceptRestaurantOrderEvent({required this.restaurantId});
}

class RejectRestaurantOrderEvent extends RestaurantOrderEvent {
  final int restaurantId;

  RejectRestaurantOrderEvent({required this.restaurantId});
}
