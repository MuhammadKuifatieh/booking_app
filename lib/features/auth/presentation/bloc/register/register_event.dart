part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class GetRegisterEvent extends RegisterEvent {
  final RegisterParams registerParams;

  GetRegisterEvent(this.registerParams);
}
