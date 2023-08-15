part of 'restaurant_owner_booking_bloc.dart';

sealed class RestaurantOwnerBookingState extends Equatable {
  const RestaurantOwnerBookingState();
  
  @override
  List<Object> get props => [];
}

final class RestaurantOwnerBookingInitial extends RestaurantOwnerBookingState {}
