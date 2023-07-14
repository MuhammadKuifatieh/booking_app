part of 'splash_bloc.dart';

abstract class SplashEvent {
  const SplashEvent();
}

class CheckAuthEvent extends SplashEvent {
  const CheckAuthEvent();
}

class GetCitiesEvent extends SplashEvent {
  const GetCitiesEvent();
}
