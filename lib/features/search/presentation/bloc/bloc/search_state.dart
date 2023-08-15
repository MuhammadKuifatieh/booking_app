part of 'search_bloc.dart';

enum GetCarOfficesToSearchStatus { init, loading, failed, succ }

enum GetClinicsToSearchStatus { init, loading, failed, succ }

enum GetHotelsToSearchStatus { init, loading, failed, succ }

enum GetRestaurantsToSearchStatus { init, loading, failed, succ }

class SearchState {
  final List<CarOfficeModel> carOffices;
  final List<ClinicModel> clinics;
  final List<HotelModel> hotels;
  final List<RestaurantModel> restaurants;
  final List<LocationModel> loctions;

  final GetCarOfficesToSearchStatus getCarOfficesToSearchStatus;
  final GetClinicsToSearchStatus getClinicsToSearchStatus;
  final GetHotelsToSearchStatus getHotelsToSearchStatus;
  final GetRestaurantsToSearchStatus getRestaurantsToSearchStatus;

  final int cityId;
  final String nameFilter;

  SearchState({
    this.cityId = 0,
    this.nameFilter = "",
    this.loctions = const [],
    this.carOffices = const [],
    this.clinics = const [],
    this.hotels = const [],
    this.restaurants = const [],
    this.getCarOfficesToSearchStatus = GetCarOfficesToSearchStatus.init,
    this.getClinicsToSearchStatus = GetClinicsToSearchStatus.init,
    this.getHotelsToSearchStatus = GetHotelsToSearchStatus.init,
    this.getRestaurantsToSearchStatus = GetRestaurantsToSearchStatus.init,
  });

  SearchState copyWith({
    List<CarOfficeModel>? carOffices,
    List<ClinicModel>? clinics,
    List<HotelModel>? hotels,
    List<LocationModel>? loctions,
    List<RestaurantModel>? restaurants,
    GetCarOfficesToSearchStatus? getCarOfficesToSearchStatus,
    GetClinicsToSearchStatus? getClinicsToSearchStatus,
    GetHotelsToSearchStatus? getHotelsToSearchStatus,
    GetRestaurantsToSearchStatus? getRestaurantsToSearchStatus,
    int? cityId,
    String? nameFilter,
  }) {
    return SearchState(
      carOffices: carOffices ?? this.carOffices,
      clinics: clinics ?? this.clinics,
      hotels: hotels ?? this.hotels,
      restaurants: restaurants ?? this.restaurants,
      loctions: loctions ?? this.loctions,
      getCarOfficesToSearchStatus:
          getCarOfficesToSearchStatus ?? this.getCarOfficesToSearchStatus,
      getClinicsToSearchStatus:
          getClinicsToSearchStatus ?? this.getClinicsToSearchStatus,
      getHotelsToSearchStatus:
          getHotelsToSearchStatus ?? this.getHotelsToSearchStatus,
      getRestaurantsToSearchStatus:
          getRestaurantsToSearchStatus ?? this.getRestaurantsToSearchStatus,
      cityId: cityId ?? this.cityId,
      nameFilter: nameFilter ?? this.nameFilter,
    );
  }
}

class LocationModel {
  final CategoriesEnum categoriesEnum;
  final String name;
  final LatLng latLng;
  final int id;

  LocationModel({
    required this.categoriesEnum,
    required this.name,
    required this.latLng,
    required this.id,
  });

  @override
  bool operator ==(covariant LocationModel other) {
    if (identical(this, other)) return true;

    return other.categoriesEnum == categoriesEnum &&
        other.name == name &&
        other.latLng == latLng &&
        other.id == id;
  }

  @override
  int get hashCode {
    return categoriesEnum.hashCode ^
        name.hashCode ^
        latLng.hashCode ^
        id.hashCode;
  }
}

extension ListLocation on List<LocationModel> {
  addAllLocation(List list, CategoriesEnum categoriesType) {
    for (var item in this) {
      if (item.categoriesEnum == categoriesType) {
        remove(item);
      }
    }
    for (var item in list) {
      add(
        LocationModel(
          categoriesEnum: categoriesType,
          name: item.name!,
          latLng: LatLng(double.parse(item.placeContact!.latitude!),
              double.parse(item.placeContact!.longitude!)),
          id: item.id!,
        ),
      );
    }
  }
}
