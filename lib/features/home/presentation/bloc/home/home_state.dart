part of 'home_bloc.dart';

enum GetClinicsMostVisitStatus { init, loading, faild, succ }

enum GetHotelLastAddStatus { init, loading, faild, succ }

enum GetHotelMostPopularStatus { init, loading, faild, succ }

enum GetRestaurantsMostFavoriteStatus { init, loading, faild, succ }

class HomeState {
  final List<ClinicModel> clinics;
  final List<HotelModel> hotelsLastAdd;
  final List<HotelModel> hotelsMostPopular;
  final List<RestaurantModel> restaurants;
  final GetClinicsMostVisitStatus getClinicsMostVisitStatus;
  final GetHotelLastAddStatus getHotelLastAddStatus;
  final GetHotelMostPopularStatus getHotelMostPopularStatus;
  final GetRestaurantsMostFavoriteStatus getRestaurantsMostFavoriteStatus;
  const HomeState({
    this.clinics = const [],
    this.hotelsLastAdd = const [],
    this.hotelsMostPopular = const [],
    this.restaurants = const [],
    this.getClinicsMostVisitStatus = GetClinicsMostVisitStatus.init,
    this.getHotelLastAddStatus = GetHotelLastAddStatus.init,
    this.getHotelMostPopularStatus = GetHotelMostPopularStatus.init,
    this.getRestaurantsMostFavoriteStatus =
        GetRestaurantsMostFavoriteStatus.init,
  });

  HomeState copyWith({
    List<ClinicModel>? clinics,
    List<HotelModel>? hotelsLastAdd,
    List<HotelModel>? hotelsMostPopular,
    List<RestaurantModel>? restaurants,
    GetClinicsMostVisitStatus? getClinicsMostVisitStatus,
    GetHotelLastAddStatus? getHotelLastAddStatus,
    GetHotelMostPopularStatus? getHotelMostPopularStatus,
    GetRestaurantsMostFavoriteStatus? getRestaurantsMostFavoriteStatus,
  }) {
    return HomeState(
      clinics: clinics ?? this.clinics,
      hotelsLastAdd: hotelsLastAdd ?? this.hotelsLastAdd,
      hotelsMostPopular: hotelsMostPopular ?? this.hotelsMostPopular,
      restaurants: restaurants ?? this.restaurants,
      getClinicsMostVisitStatus:
          getClinicsMostVisitStatus ?? this.getClinicsMostVisitStatus,
      getHotelLastAddStatus:
          getHotelLastAddStatus ?? this.getHotelLastAddStatus,
      getHotelMostPopularStatus:
          getHotelMostPopularStatus ?? this.getHotelMostPopularStatus,
      getRestaurantsMostFavoriteStatus: getRestaurantsMostFavoriteStatus ??
          this.getRestaurantsMostFavoriteStatus,
    );
  }
}
