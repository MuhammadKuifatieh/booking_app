part of 'owner_booking_bloc.dart';

sealed class OwnerBookingEvent {
  const OwnerBookingEvent();
}

class GetOwnerCarOfficesEvent extends OwnerBookingEvent {}

class GetOwnerClinicsEvent extends OwnerBookingEvent {}

class GetOwnerHotelsEvent extends OwnerBookingEvent {}

class GetOwnerRestaurantsEvent extends OwnerBookingEvent {}
