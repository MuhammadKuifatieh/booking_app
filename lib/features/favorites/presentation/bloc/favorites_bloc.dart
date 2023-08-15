import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/enums/categories_enum.dart';
import '../../../../core/models/car_office_model.dart';
import '../../../../core/models/clinic_model.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/models/restaurant_model.dart';
import '../../../../core/presentation/blocs/bloc/favorite_bloc.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../injection.dart';
import '../../data/repositories/get_favorite_repository_implement.dart';
import '../../domain/usecases/get_favorite_car_offices.dart';
import '../../domain/usecases/get_favorite_clinics.dart';
import '../../domain/usecases/get_favorite_hotels.dart';
import '../../domain/usecases/get_favorite_restaurants.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final _getHotels = GetFavoriteHotels(GetFavoriteRepositoryImplemnts());

  final _getRestaurant =
      GetFavoriteRestaurants(GetFavoriteRepositoryImplemnts());

  final _getClinic = GetFavoriteClinic(GetFavoriteRepositoryImplemnts());

  final _getCarOffices =
      GetFavoriteCarOffices(GetFavoriteRepositoryImplemnts());
  FavoritesBloc() : super(FavoritesState()) {
    on<GetFavoriteCarOfficesEvent>(_mapGetCarOfficesState);

    on<GetFavoriteClinicEvent>(_mapGetClinicsState);

    on<GetFavoriteHotelsEvent>(_mapGetHotelsState);

    on<GetFavoriteRestaurantsEvent>(_mapGetRestaurantsState);
  }

  FutureOr<void> _mapGetHotelsState(
      GetFavoriteHotelsEvent event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(
        getFavoriteHotelsStatus: GetFavoriteHotelsStatus.loading));
    final result = await _getHotels(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
          getFavoriteHotelsStatus: GetFavoriteHotelsStatus.failed)),
      (r) {
        emit(state.copyWith(
          hotels: r.data!.hotels,
          getFavoriteHotelsStatus: GetFavoriteHotelsStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.hotels!,
          modelType: CategoriesEnum.hotel.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetRestaurantsState(
      GetFavoriteRestaurantsEvent event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(
        getFavoriteRestaurantsStatus: GetFavoriteRestaurantsStatus.loading));
    final result = await _getRestaurant(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
          getFavoriteRestaurantsStatus: GetFavoriteRestaurantsStatus.failed)),
      (r) {
        emit(state.copyWith(
          getFavoriteRestaurantsStatus: GetFavoriteRestaurantsStatus.succ,
          restaurants: r.data!.restaurants,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.restaurants!,
          modelType: CategoriesEnum.restaurant.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetClinicsState(
      GetFavoriteClinicEvent event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(
        getFavoriteClinicStatus: GetFavoriteClinicStatus.loading));
    final result = await _getClinic(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
          getFavoriteClinicStatus: GetFavoriteClinicStatus.failed)),
      (r) {
        emit(state.copyWith(
          clinics: r.data!.clinics,
          getFavoriteClinicStatus: GetFavoriteClinicStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.clinics!,
          modelType: CategoriesEnum.clinic.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetCarOfficesState(
      GetFavoriteCarOfficesEvent event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(
        getFavoriteCarOfficesStatus: GetFavoriteCarOfficesStatus.loading));
    final result = await _getCarOffices(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
          getFavoriteCarOfficesStatus: GetFavoriteCarOfficesStatus.failed)),
      (r) {
        emit(state.copyWith(
          carOffices: r.data!.carOffices,
          getFavoriteCarOfficesStatus: GetFavoriteCarOfficesStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.carOffices!,
          modelType: CategoriesEnum.carOffice.status,
        ));
      },
    );
  }
}
