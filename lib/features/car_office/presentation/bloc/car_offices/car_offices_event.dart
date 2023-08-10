part of 'car_offices_bloc.dart';

sealed class CarOfficesEvent {
  const CarOfficesEvent();
}

class GetCarOfficesEvent extends CarOfficesEvent with EventWithReload {
  @override
  final bool isReload;

  GetCarOfficesEvent({this.isReload = false});
}
