import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking_app/features/hotel/domain/usecases/booking_hotel.dart';

import '../../../../../core/models/hotel_model.dart';
import '../../../data/repositories/hotel_repository_implement.dart';
import '../../../domain/usecases/show_hotel.dart';

part 'hotel_details_event.dart';
part 'hotel_details_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final _showHotel = ShowHotel(HotelRepositoryImplement());
  final _bookingHotel = BookingHotel(HotelRepositoryImplement());
  HotelBloc() : super(const HotelState()) {
    on<ShowHotelEvent>(_mapShowHotel);
    on<BookingHotelEvent>(_mapBookingHotel);
  }
  FutureOr<void> _mapShowHotel(
      ShowHotelEvent event, Emitter<HotelState> emit) async {
    emit(state.copyWith(showHotelStatus: ShowHotelStatus.loading));
    final result = await _showHotel(ShowHotelParams(hotelId: event.hotelId));
    result.fold(
      (l) => emit(state.copyWith(showHotelStatus: ShowHotelStatus.failed)),
      (r) => emit(state.copyWith(
        hotel: r.data!.hotel,
        showHotelStatus: ShowHotelStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapBookingHotel(
      BookingHotelEvent event, Emitter<HotelState> emit) async {
    emit(state.copyWith(bookingHotelStatus: BookingHotelStatus.loadnig));
    final result = await _bookingHotel(event.params);
    result.fold(
      (l) =>
          emit(state.copyWith(bookingHotelStatus: BookingHotelStatus.failed)),
      (r) => emit(state.copyWith(bookingHotelStatus: BookingHotelStatus.succ)),
    );
    emit(state.copyWith(bookingHotelStatus: BookingHotelStatus.init));
  }
}
