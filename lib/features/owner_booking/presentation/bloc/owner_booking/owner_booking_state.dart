part of 'owner_booking_bloc.dart';

enum GetOwnerCarOfficesStatus { init, loading, failed, succ }

enum GetOwnerClinicsStatus { init, loading, failed, succ }

enum GetOwnerHotelsStatus { init, loading, failed, succ }

enum GetOwnerRestaurantsStatus { init, loading, failed, succ }

class OwnerBookingState {
  final List<CarOfficeModel> carOffices;
  final List<ClinicModel> clinics;
  final List<HotelModel> hotels;
  final List<RestaurantModel> restaurants;

  final GetOwnerCarOfficesStatus getOwnerCarOfficesStatus;
  final GetOwnerClinicsStatus getOwnerClinicsStatus;
  final GetOwnerHotelsStatus getOwnerHotelsStatus;
  final GetOwnerRestaurantsStatus getOwnerRestaurantsStatus;

  const OwnerBookingState({
    this.carOffices = const [],
    this.clinics = const [],
    this.hotels = const [],
    this.restaurants = const [],
    this.getOwnerCarOfficesStatus = GetOwnerCarOfficesStatus.init,
    this.getOwnerClinicsStatus = GetOwnerClinicsStatus.init,
    this.getOwnerHotelsStatus = GetOwnerHotelsStatus.init,
    this.getOwnerRestaurantsStatus = GetOwnerRestaurantsStatus.init,
  });

  OwnerBookingState copyWith({
    List<CarOfficeModel>? carOffices,
    List<ClinicModel>? clinics,
    List<HotelModel>? hotels,
    List<RestaurantModel>? restaurants,
    GetOwnerCarOfficesStatus? getOwnerCarOfficesStatus,
    GetOwnerClinicsStatus? getOwnerClinicsStatus,
    GetOwnerHotelsStatus? getOwnerHotelsStatus,
    GetOwnerRestaurantsStatus? getOwnerRestaurantsStatus,
  }) {
    return OwnerBookingState(
      carOffices: carOffices ?? this.carOffices,
      clinics: clinics ?? this.clinics,
      hotels: hotels ?? this.hotels,
      restaurants: restaurants ?? this.restaurants,
      getOwnerCarOfficesStatus:
          getOwnerCarOfficesStatus ?? this.getOwnerCarOfficesStatus,
      getOwnerClinicsStatus: getOwnerClinicsStatus ?? this.getOwnerClinicsStatus,
      getOwnerHotelsStatus: getOwnerHotelsStatus ?? this.getOwnerHotelsStatus,
      getOwnerRestaurantsStatus:
          getOwnerRestaurantsStatus ?? this.getOwnerRestaurantsStatus,
    );
  }
}
