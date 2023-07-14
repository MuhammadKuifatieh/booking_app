part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class GetLoginEvent extends LoginEvent {
  final LoginParams loginParams;

  GetLoginEvent(this.loginParams);
}
