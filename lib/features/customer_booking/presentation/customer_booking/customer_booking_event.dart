part of 'customer_booking_bloc.dart';

abstract class CustomerBookingEvent {
  const CustomerBookingEvent();
}

class GetCustomerCarOfficeEvent extends CustomerBookingEvent {}

class GetCustomerHotelEvent extends CustomerBookingEvent {}

class GetCustomerRestaurantEvent extends CustomerBookingEvent {}

class GetCustomerClinicEvent extends CustomerBookingEvent {}
