part of 'restaurant_details_bloc.dart';

enum ShowRestaurantStatus { init, loading, succ, failed }

class RestaurantDetailsState {
  final RestaurantModel? restaurant;
  final ShowRestaurantStatus showRestaurantStatus;
  const RestaurantDetailsState({
    this.restaurant,
    this.showRestaurantStatus = ShowRestaurantStatus.init,
  });

  RestaurantDetailsState copyWith({
    RestaurantModel? restaurant,
    ShowRestaurantStatus? showRestaurantStatus,
  }) {
    return RestaurantDetailsState(
      restaurant: restaurant ?? this.restaurant,
      showRestaurantStatus: showRestaurantStatus ?? this.showRestaurantStatus,
    );
  }
}
