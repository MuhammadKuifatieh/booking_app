part of 'restaurants_bloc.dart';

abstract class RestaurantsEvent {
  const RestaurantsEvent();
}

class GetRestaurantsEvent extends RestaurantsEvent with EventWithReload {
  @override
  final bool isReload;

  GetRestaurantsEvent({this.isReload = false});
}
