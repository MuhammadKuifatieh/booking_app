part of 'car_office_details_bloc.dart';

sealed class CarOfficeDetailsEvent {
  const CarOfficeDetailsEvent();
}

class ShowCarOfficeDetailsEvent extends CarOfficeDetailsEvent {
  final int carOfficeId;

  ShowCarOfficeDetailsEvent({required this.carOfficeId});
}

class BookingCarOfficeEvent extends CarOfficeDetailsEvent {
  final BookingCarOfficeParams params;

  BookingCarOfficeEvent(this.params);
}
