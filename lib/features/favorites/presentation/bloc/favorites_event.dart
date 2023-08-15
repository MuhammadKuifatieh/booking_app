part of 'favorites_bloc.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class GetFavoriteCarOfficesEvent extends FavoritesEvent {}

class GetFavoriteClinicEvent extends FavoritesEvent {}

class GetFavoriteHotelsEvent extends FavoritesEvent {}

class GetFavoriteRestaurantsEvent extends FavoritesEvent {}
