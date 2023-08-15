part of 'favorites_bloc.dart';

enum GetFavoriteHotelsStatus { init, succ, loading, failed }

enum GetFavoriteClinicStatus { init, succ, loading, failed }

enum GetFavoriteCarOfficesStatus { init, succ, loading, failed }

enum GetFavoriteRestaurantsStatus { init, succ, loading, failed }

class FavoritesState {
  final List<RestaurantModel> restaurants;
  final List<HotelModel> hotels;
  final List<ClinicModel> clinics;
  final List<CarOfficeModel> carOffices;
  final GetFavoriteHotelsStatus getFavoriteHotelsStatus;
  final GetFavoriteClinicStatus getFavoriteClinicStatus;
  final GetFavoriteCarOfficesStatus getFavoriteCarOfficesStatus;
  final GetFavoriteRestaurantsStatus getFavoriteRestaurantsStatus;

  FavoritesState({
    this.restaurants = const [],
    this.hotels = const [],
    this.clinics = const [],
    this.carOffices = const [],
    this.getFavoriteHotelsStatus = GetFavoriteHotelsStatus.init,
    this.getFavoriteClinicStatus = GetFavoriteClinicStatus.init,
    this.getFavoriteCarOfficesStatus = GetFavoriteCarOfficesStatus.init,
    this.getFavoriteRestaurantsStatus = GetFavoriteRestaurantsStatus.init,
  });

  FavoritesState copyWith({
    List<RestaurantModel>? restaurants,
    List<HotelModel>? hotels,
    List<ClinicModel>? clinics,
    List<CarOfficeModel>? carOffices,
    GetFavoriteHotelsStatus? getFavoriteHotelsStatus,
    GetFavoriteClinicStatus? getFavoriteClinicStatus,
    GetFavoriteCarOfficesStatus? getFavoriteCarOfficesStatus,
    GetFavoriteRestaurantsStatus? getFavoriteRestaurantsStatus,
  }) {
    return FavoritesState(
      restaurants: restaurants ?? this.restaurants,
      hotels: hotels ?? this.hotels,
      clinics: clinics ?? this.clinics,
      carOffices: carOffices ?? this.carOffices,
      getFavoriteHotelsStatus:
          getFavoriteHotelsStatus ?? this.getFavoriteHotelsStatus,
      getFavoriteClinicStatus:
          getFavoriteClinicStatus ?? this.getFavoriteClinicStatus,
      getFavoriteCarOfficesStatus:
          getFavoriteCarOfficesStatus ?? this.getFavoriteCarOfficesStatus,
      getFavoriteRestaurantsStatus:
          getFavoriteRestaurantsStatus ?? this.getFavoriteRestaurantsStatus,
    );
  }
}
