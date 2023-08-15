import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'restaurant_owner_booking_event.dart';
part 'restaurant_owner_booking_state.dart';

class RestaurantOwnerBookingBloc extends Bloc<RestaurantOwnerBookingEvent, RestaurantOwnerBookingState> {
  RestaurantOwnerBookingBloc() : super(RestaurantOwnerBookingInitial()) {
    on<RestaurantOwnerBookingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
