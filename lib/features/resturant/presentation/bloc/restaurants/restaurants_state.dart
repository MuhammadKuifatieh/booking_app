part of 'restaurants_bloc.dart';

enum GetRestaurantsStatus { inti, loading, succ, failed }

class RestaurantsState {
  final GetRestaurantsStatus getRestaurantsStatus;
  final List<RestaurantModel> restaurants;
  final bool isEndPage;
  const RestaurantsState({
    this.isEndPage = false,
    this.restaurants = const [],
    this.getRestaurantsStatus = GetRestaurantsStatus.inti,
  });

  RestaurantsState copyWith({
    GetRestaurantsStatus? getRestaurantsStatus,
    List<RestaurantModel>? restaurants,
    bool? isEndPage,
  }) {
    return RestaurantsState(
      getRestaurantsStatus: getRestaurantsStatus ?? this.getRestaurantsStatus,
      restaurants: restaurants ?? this.restaurants,
      isEndPage: isEndPage ?? this.isEndPage,
    );
  }
}
