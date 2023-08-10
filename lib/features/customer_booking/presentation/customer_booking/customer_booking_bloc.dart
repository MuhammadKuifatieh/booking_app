import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/usecase/use_case.dart';
import '../../data/models/car_office_booking_customer_response.dart';
import '../../data/models/clinic_booking_customer_response.dart';
import '../../data/models/hotel_booking_customer_response.dart';
import '../../data/models/restaurant_booking_customer_response.dart';
import '../../data/repositories/customer_booking_repository_imp.dart';
import '../../domain/usecases/get_customer_car_office.dart';
import '../../domain/usecases/get_customer_clinic.dart';
import '../../domain/usecases/get_customer_hotel.dart';
import '../../domain/usecases/get_customer_restaurant.dart';

part 'customer_booking_event.dart';
part 'customer_booking_state.dart';

class CustomerBookingBloc
    extends Bloc<CustomerBookingEvent, CustomerBookingState> {
  final _getClinics = GetCustomerClinic(CustomerBookingRepositoryImplment());
  final _getCarOffice =
      GetCustomerCarOffice(CustomerBookingRepositoryImplment());
  final _getRestaurant =
      GetCustomerRestaurant(CustomerBookingRepositoryImplment());
  final _getHotel = GetCustomerHotel(CustomerBookingRepositoryImplment());

  CustomerBookingBloc() : super(CustomerBookingState()) {
    on<GetCustomerCarOfficeEvent>(_mapGetCarOffice);

    on<GetCustomerClinicEvent>(_mapGetClinic);

    on<GetCustomerHotelEvent>(_mapGetHotel);

    on<GetCustomerRestaurantEvent>(_mapGetRestaurant);
  }
  FutureOr<void> _mapGetCarOffice(GetCustomerCarOfficeEvent event,
      Emitter<CustomerBookingState> emit) async {
    emit(state.copyWith(
        getCustomerCarOfficeStatus: GetCustomerCarOfficeStatus.loading));
    final result = await _getCarOffice(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
          getCustomerCarOfficeStatus: GetCustomerCarOfficeStatus.faild)),
      (r) => emit(state.copyWith(
        getCustomerCarOfficeStatus: GetCustomerCarOfficeStatus.succ,
        carOffices: r.data!.carBookings,
      )),
    );
  }

  FutureOr<void> _mapGetClinic(
      GetCustomerClinicEvent event, Emitter<CustomerBookingState> emit) async {
    emit(state.copyWith(
        getCustomerClinicStatus: GetCustomerClinicStatus.loading));
    final result = await _getClinics(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
          getCustomerClinicStatus: GetCustomerClinicStatus.faild)),
      (r) => emit(state.copyWith(
        getCustomerClinicStatus: GetCustomerClinicStatus.succ,
        clinics: r.data!.clinicBookings,
      )),
    );
  }

  FutureOr<void> _mapGetHotel(
      GetCustomerHotelEvent event, Emitter<CustomerBookingState> emit) async {
    emit(
        state.copyWith(getCustomerHotelStatus: GetCustomerHotelStatus.loading));
    final result = await _getHotel(NoParams());
    result.fold(
      (l) => emit(
          state.copyWith(getCustomerHotelStatus: GetCustomerHotelStatus.faild)),
      (r) => emit(state.copyWith(
        getCustomerHotelStatus: GetCustomerHotelStatus.succ,
        hotels: r.data!.hotelBookings,
      )),
    );
  }

  FutureOr<void> _mapGetRestaurant(GetCustomerRestaurantEvent event,
      Emitter<CustomerBookingState> emit) async {
    emit(state.copyWith(
        getCustomerRestaurantStatus: GetCustomerRestaurantStatus.loading));
    final result = await _getRestaurant(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
          getCustomerRestaurantStatus: GetCustomerRestaurantStatus.faild)),
      (r) => emit(state.copyWith(
        getCustomerRestaurantStatus: GetCustomerRestaurantStatus.succ,
        restaurants: r.data!.restaurantBookings,
      )),
    );
  }
}
