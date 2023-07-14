part of 'register_bloc.dart';

enum RegisterStatus { init, succ, loading, failed }

class RegisterState {
  final RegisterStatus registerStatus;
  const RegisterState({
    this.registerStatus = RegisterStatus.init,
  });

  RegisterState copyWith({
    RegisterStatus? registerStatus,
  }) {
    return RegisterState(
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }
}
