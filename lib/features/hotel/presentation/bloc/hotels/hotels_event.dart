part of 'hotels_bloc.dart';

abstract class HotelsEvent {
  const HotelsEvent();
}

class GetHotelsEvent extends HotelsEvent with EventWithReload {
  @override
  final bool isReload;

  GetHotelsEvent({this.isReload = false});
}
