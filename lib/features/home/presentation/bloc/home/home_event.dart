part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class GetRestaurantsMostFavoriteEvent extends HomeEvent {}

class GetHotelLastAddEvent extends HomeEvent {}

class GetHotelMostPopularEvent extends HomeEvent {}

class GetClinicsMostVisitEvent extends HomeEvent {}
