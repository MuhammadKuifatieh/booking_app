part of 'hotel_order_bloc.dart';

sealed class HotelOrderEvent {
  const HotelOrderEvent();
}

class GetHotelOrdersEvent extends HotelOrderEvent {
  final int hotelId;

  GetHotelOrdersEvent({required this.hotelId});
}

class AcceptHotelOrderEvent extends HotelOrderEvent {
  final int hotelId;

  AcceptHotelOrderEvent({required this.hotelId});
}

class RejectHotelOrderEvent extends HotelOrderEvent {
  final int hotelId;

  RejectHotelOrderEvent({required this.hotelId});
}
