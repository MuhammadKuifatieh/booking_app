import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/config/global_functions.dart';
import '../../../../../core/enums/categories_enum.dart';
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

part 'owner_booking_event.dart';
part 'owner_booking_state.dart';

class OwnerBookingBloc extends Bloc<OwnerBookingEvent, OwnerBookingState> {
  final _getCarOffice = GetCarOffices(CarOfficeRepositoryImplement());
  final _getRestaurant = GetRestaurants(RestaurantRepositoryImplement());
  final _getHotel = GetHotels(HotelRepositoryImplement());
  final _getClinic = GetClinics(ClinicRepositoryImplement());
  OwnerBookingBloc() : super(const OwnerBookingState()) {
    on<GetOwnerCarOfficesEvent>(_mapGetCarOfficeState);

    on<GetOwnerClinicsEvent>(_mapGetClinicState);

    on<GetOwnerHotelsEvent>(_mapGetHotelState);

    on<GetOwnerRestaurantsEvent>(_mapGetRestaurantState);
  }
  FutureOr<void> _mapGetCarOfficeState(
      GetOwnerCarOfficesEvent event, Emitter<OwnerBookingState> emit) async {
    emit(state.copyWith(
        getOwnerCarOfficesStatus: GetOwnerCarOfficesStatus.loading));
    final userId = (await GlobalFunctions.getUserId());
    final result = await _getCarOffice(GetCarOfficesParams(userId: userId));
    result.fold(
      (l) => emit(state.copyWith(
          getOwnerCarOfficesStatus: GetOwnerCarOfficesStatus.failed)),
      (r) {
        emit(state.copyWith(
          carOffices: r.data!.carOffices,
          getOwnerCarOfficesStatus: GetOwnerCarOfficesStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.carOffices!,
          modelType: CategoriesEnum.carOffice.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetClinicState(
      GetOwnerClinicsEvent event, Emitter<OwnerBookingState> emit) async {
    emit(state.copyWith(getOwnerClinicsStatus: GetOwnerClinicsStatus.loading));
    final userId = (await GlobalFunctions.getUserId());
    final result = await _getClinic(GetClinicsParams(userId: userId));
    result.fold(
      (l) => emit(
          state.copyWith(getOwnerClinicsStatus: GetOwnerClinicsStatus.failed)),
      (r) {
        emit(state.copyWith(
          clinics: r.data!.clinics,
          getOwnerClinicsStatus: GetOwnerClinicsStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.clinics!,
          modelType: CategoriesEnum.clinic.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetHotelState(
      GetOwnerHotelsEvent event, Emitter<OwnerBookingState> emit) async {
    emit(state.copyWith(getOwnerHotelsStatus: GetOwnerHotelsStatus.loading));
    final userId = (await GlobalFunctions.getUserId());
    final result = await _getHotel(GetHotelsParams(userId: userId));
    result.fold(
      (l) => emit(
          state.copyWith(getOwnerHotelsStatus: GetOwnerHotelsStatus.failed)),
      (r) {
        emit(state.copyWith(
          hotels: r.data!.hotels,
          getOwnerHotelsStatus: GetOwnerHotelsStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.hotels!,
          modelType: CategoriesEnum.hotel.status,
        ));
      },
    );
  }

  FutureOr<void> _mapGetRestaurantState(
      GetOwnerRestaurantsEvent event, Emitter<OwnerBookingState> emit) async {
    emit(state.copyWith(
        getOwnerRestaurantsStatus: GetOwnerRestaurantsStatus.loading));
    final userId = (await GlobalFunctions.getUserId());
    final result = await _getRestaurant(GetRestaurantsParams(userId: userId));
    result.fold(
      (l) => emit(state.copyWith(
          getOwnerRestaurantsStatus: GetOwnerRestaurantsStatus.failed)),
      (r) {
        emit(state.copyWith(
          restaurants: r.data!.restaurants,
          getOwnerRestaurantsStatus: GetOwnerRestaurantsStatus.succ,
        ));
        serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
          items: r.data!.restaurants!,
          modelType: CategoriesEnum.restaurant.status,
        ));
      },
    );
  }
}
