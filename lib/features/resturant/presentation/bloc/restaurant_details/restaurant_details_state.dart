part of 'restaurant_details_bloc.dart';

enum ShowRestaurantStatus { init, loading, succ, failed }

enum BookingRestaurantStatus { init, loading, succ, failed }

class RestaurantDetailsState {
  final RestaurantModel? restaurant;
  final ShowRestaurantStatus showRestaurantStatus;
  final BookingRestaurantStatus bookingRestaurantStatus;
  const RestaurantDetailsState({
    this.restaurant,
    this.showRestaurantStatus = ShowRestaurantStatus.init,
    this.bookingRestaurantStatus = BookingRestaurantStatus.init,
  });

  RestaurantDetailsState copyWith({
    RestaurantModel? restaurant,
    ShowRestaurantStatus? showRestaurantStatus,
    BookingRestaurantStatus? bookingRestaurantStatus,
  }) {
    return RestaurantDetailsState(
      restaurant: restaurant ?? this.restaurant,
      showRestaurantStatus: showRestaurantStatus ?? this.showRestaurantStatus,
      bookingRestaurantStatus:
          bookingRestaurantStatus ?? this.bookingRestaurantStatus,
    );
  }
}
