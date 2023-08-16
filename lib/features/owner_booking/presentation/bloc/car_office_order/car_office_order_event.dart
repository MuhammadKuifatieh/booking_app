part of 'car_office_order_bloc.dart';

sealed class CarOfficeOrderEvent {
  const CarOfficeOrderEvent();
}

class GetCarOfficeOrdersEvent extends CarOfficeOrderEvent {
  final int carOfficeId;

  GetCarOfficeOrdersEvent({required this.carOfficeId});
}

class AcceptCarOfficeOrderEvent extends CarOfficeOrderEvent {
  final int carOfficeId;

  AcceptCarOfficeOrderEvent({required this.carOfficeId});
}

class RejectCarOfficeOrderEvent extends CarOfficeOrderEvent {
  final int carOfficeId;

  RejectCarOfficeOrderEvent({required this.carOfficeId});
}
