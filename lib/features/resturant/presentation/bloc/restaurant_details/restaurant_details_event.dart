part of 'restaurant_details_bloc.dart';

abstract class RestaurantDetailsEvent {
  const RestaurantDetailsEvent();
}

class ShowRestaurantEvent extends RestaurantDetailsEvent {
  final int restaurantId;

  ShowRestaurantEvent(this.restaurantId);
}

class BookingRestaurantEvent extends RestaurantDetailsEvent {
  final BookingRestaurantParams params;

  BookingRestaurantEvent(this.params);
}
