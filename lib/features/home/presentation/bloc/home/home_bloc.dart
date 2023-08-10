import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:booking_app/core/enums/categories_enum.dart';
import 'package:booking_app/core/presentation/blocs/bloc/favorite_bloc.dart';
import 'package:booking_app/injection.dart';

import '../../../../../core/models/clinic_model.dart';
import '../../../../../core/models/hotel_model.dart';
import '../../../../../core/models/restaurant_model.dart';
import '../../../data/repositories/home_repository_implement.dart';
import '../../../domain/usecases/get_clinic_most_visit.dart';
import '../../../domain/usecases/get_hotel_last_add.dart';
import '../../../domain/usecases/get_hotel_most_popular.dart';
import '../../../domain/usecases/get_restaurant_most_favorite.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _getRestaurant = GetRestaurantsMostFavorite(HomeRepositoryImplement());
  final _getClinic = GetClinicsMostVisit(HomeRepositoryImplement());
  final _getHotelLast = GetHotelLastAdd(HomeRepositoryImplement());
  final _getHotelMost = GetHotelMostPopular(HomeRepositoryImplement());
  HomeBloc() : super(const HomeState()) {
    on<GetClinicsMostVisitEvent>(_mapGetClinicMostVisit);

    on<GetRestaurantsMostFavoriteEvent>(_mapGetRestaurantMostFavorite);

    on<GetHotelMostPopularEvent>(_mapGetHotelMostPopular);

    on<GetHotelLastAddEvent>(_mapGetHoteLastAdd);
  }
  FutureOr<void> _mapGetRestaurantMostFavorite(
      GetRestaurantsMostFavoriteEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      getRestaurantsMostFavoriteStatus:
          GetRestaurantsMostFavoriteStatus.loading,
    ));
    final result = await _getRestaurant(GetRestaurantsMostFavoriteParams(
      page: 1,
      perPage: 5,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getRestaurantsMostFavoriteStatus:
            GetRestaurantsMostFavoriteStatus.faild,
      )),
      (r) {
        log(r.data!.restaurants!.length.toString());
        emit(state.copyWith(
          restaurants: r.data!.restaurants,
          getRestaurantsMostFavoriteStatus:
              GetRestaurantsMostFavoriteStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.restaurants!,
          modelType: CategoriesEnum.restaurant.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetClinicMostVisit(
      GetClinicsMostVisitEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      getClinicsMostVisitStatus: GetClinicsMostVisitStatus.loading,
    ));
    final result = await _getClinic(GetClinicsMostVisitParams(
      page: 1,
      perPage: 5,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getClinicsMostVisitStatus: GetClinicsMostVisitStatus.faild,
      )),
      (r) {
        emit(state.copyWith(
          clinics: r.data!.clinics,
          getClinicsMostVisitStatus: GetClinicsMostVisitStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.clinics!,
          modelType: CategoriesEnum.clinic.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetHotelMostPopular(
      GetHotelMostPopularEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      getHotelMostPopularStatus: GetHotelMostPopularStatus.loading,
    ));
    final result = await _getHotelMost(GetHotelMostPopularParams(
      page: 1,
      perPage: 5,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getHotelMostPopularStatus: GetHotelMostPopularStatus.faild,
      )),
      (r) {
        emit(state.copyWith(
          hotelsMostPopular: r.data!.hotels,
          getHotelMostPopularStatus: GetHotelMostPopularStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.hotels!,
          modelType: CategoriesEnum.hotel.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetHoteLastAdd(
      GetHotelLastAddEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      getHotelLastAddStatus: GetHotelLastAddStatus.loading,
    ));
    final result = await _getHotelLast(GetHotelLastAddParams(
      page: 1,
      perPage: 5,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        getHotelLastAddStatus: GetHotelLastAddStatus.faild,
      )),
      (r) {
        emit(state.copyWith(
          hotelsLastAdd: r.data!.hotels,
          getHotelLastAddStatus: GetHotelLastAddStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.hotels!,
          modelType: CategoriesEnum.hotel.status,
        ));
      },
    );
  }
}
