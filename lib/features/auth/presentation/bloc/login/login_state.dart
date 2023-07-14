part of 'login_bloc.dart';

enum LoginStatus { init, loading, succ, failed }

class LoginState {
  final LoginStatus loginStatus;

  const LoginState({
    this.loginStatus = LoginStatus.init,
  });

  LoginState copyWith({
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}
