import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:booking_app/core/config/droppable_pro_max.dart';
import 'package:booking_app/core/enums/categories_enum.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../core/models/car_office_model.dart';
import '../../../../../core/models/clinic_model.dart';
import '../../../../../core/models/hotel_model.dart';
import '../../../../../core/models/restaurant_model.dart';
import '../../../../../core/presentation/blocs/bloc/favorite_bloc.dart';
import '../../../../../injection.dart';
import '../../../../car_office/data/repositories/car_office_repository_implement.dart';
import '../../../../car_office/domain/usecases/get_car_offices.dart';
import '../../../../clinic/data/repositories/clinic_repository_implement.dart';
import '../../../../clinic/domain/usecases/get_clinics.dart';
import '../../../../hotel/data/repositories/hotel_repository_implement.dart';
import '../../../../hotel/domain/usecases/get_hotels.dart';
import '../../../../resturant/data/repositories/restaurant_repository_implement.dart';
import '../../../../resturant/domain/usecases/get_restaurants.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final _getClinics = GetClinics(ClinicRepositoryImplement());
  final _getCarOffices = GetCarOffices(CarOfficeRepositoryImplement());
  final _getRestaurants = GetRestaurants(RestaurantRepositoryImplement());
  final _getHotels = GetHotels(HotelRepositoryImplement());
  SearchBloc() : super(SearchState()) {
    on<SetTextFilterToSearchEvent>(
        (SetTextFilterToSearchEvent event, Emitter<SearchState> emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(nameFilter: event.name));
      add(GetCarOfficesToSearchEvent(isReload: true));
      add(GetClinicsToSearchEvent(isReload: true));
      add(GetHotelsToSearchEvent(isReload: true));
      add(GetRestaurantsToSearchEvent(isReload: true));
    });

    on<SetCityIdFilterToSearcEvent>(
        (SetCityIdFilterToSearcEvent event, Emitter<SearchState> emit) async {
      emit(state.copyWith(cityId: event.cityId));
      add(GetCarOfficesToSearchEvent(isReload: true));
      add(GetClinicsToSearchEvent(isReload: true));
      add(GetHotelsToSearchEvent(isReload: true));
      add(GetRestaurantsToSearchEvent(isReload: true));
    });

    on<GetCarOfficesToSearchEvent>(
      _mapGetCarOffice,
      transformer: droppableProMax(),
    );
    on<GetClinicsToSearchEvent>(
      _mapGetClinic,
      transformer: droppableProMax(),
    );
    on<GetHotelsToSearchEvent>(
      _mapGetHotel,
      transformer: droppableProMax(),
    );
    on<GetRestaurantsToSearchEvent>(
      _mapGetRestaurant,
      transformer: droppableProMax(),
    );
  }
  FutureOr<void> _mapGetCarOffice(
      GetCarOfficesToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
        getCarOfficesToSearchStatus: GetCarOfficesToSearchStatus.loading));
    final result = await _getCarOffices(GetCarOfficesParams(
      name: state.nameFilter,
      cityId: state.cityId,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getCarOfficesToSearchStatus: GetCarOfficesToSearchStatus.failed,
      )),
      (r) {
        emit(state.copyWith(
            carOffices: r.data!.carOffices,
            getCarOfficesToSearchStatus: GetCarOfficesToSearchStatus.succ,
            loctions: List.of(state.loctions)
              ..addAllLocation(
                r.data!.carOffices!,
                CategoriesEnum.carOffice,
              )));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.carOffices!,
          modelType: CategoriesEnum.carOffice.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetClinic(
      GetClinicsToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
        getClinicsToSearchStatus: GetClinicsToSearchStatus.loading));
    final result = await _getClinics(GetClinicsParams(
      name: state.nameFilter,
      cityId: state.cityId,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getClinicsToSearchStatus: GetClinicsToSearchStatus.failed,
      )),
      (r) {
        emit(state.copyWith(
            clinics: r.data!.clinics,
            getClinicsToSearchStatus: GetClinicsToSearchStatus.succ,
            loctions: List.of(state.loctions)
              ..addAllLocation(
                r.data!.clinics!,
                CategoriesEnum.clinic,
              )));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.clinics!,
          modelType: CategoriesEnum.clinic.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetHotel(
      GetHotelsToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
        getHotelsToSearchStatus: GetHotelsToSearchStatus.loading));
    final result = await _getHotels(GetHotelsParams(
      name: state.nameFilter,
      cityId: state.cityId,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getHotelsToSearchStatus: GetHotelsToSearchStatus.failed,
      )),
      (r) {
        emit(state.copyWith(
            hotels: r.data!.hotels,
            getHotelsToSearchStatus: GetHotelsToSearchStatus.succ,
            loctions: List.of(state.loctions)
              ..addAllLocation(
                r.data!.hotels!,
                CategoriesEnum.hotel,
              )));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.hotels!,
          modelType: CategoriesEnum.hotel.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetRestaurant(
      GetRestaurantsToSearchEvent event, Emitter<SearchState> emit) async {
    emit(state.copyWith(
        getRestaurantsToSearchStatus: GetRestaurantsToSearchStatus.loading));
    final result = await _getRestaurants(GetRestaurantsParams(
      name: state.nameFilter,
      cityId: state.cityId,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getRestaurantsToSearchStatus: GetRestaurantsToSearchStatus.failed,
      )),
      (r) {
        emit(state.copyWith(
            restaurants: r.data!.restaurants,
            getRestaurantsToSearchStatus: GetRestaurantsToSearchStatus.succ,
            loctions: List.of(state.loctions)
              ..addAllLocation(
                r.data!.restaurants!,
                CategoriesEnum.restaurant,
              )));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.restaurants!,
          modelType: CategoriesEnum.restaurant.status,
        ));
      },
    );
  }
}
