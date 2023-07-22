part of 'hotels_bloc.dart';

abstract class HotelsEvent {
  const HotelsEvent();
}

class GetHotelsEvent extends HotelsEvent {
  final bool isReload;

  GetHotelsEvent({this.isReload = false});
}
