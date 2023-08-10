part of 'hotel_details_bloc.dart';

class HotelEvent {
  const HotelEvent();
}

class ShowHotelEvent extends HotelEvent {
  final int hotelId;

  ShowHotelEvent({required this.hotelId});
}

class BookingHotelEvent extends HotelEvent {
  final BookingHotelParams params;

  BookingHotelEvent(this.params);
}
