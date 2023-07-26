part of 'restaurants_bloc.dart';

abstract class RestaurantsEvent {
  const RestaurantsEvent();
}

class GetRestaurantsEvent extends RestaurantsEvent {
  final bool isReload;

  GetRestaurantsEvent({this.isReload = false});
}
