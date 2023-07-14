import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/config/global_functions.dart';
import '../../../data/repositories/auth_repository_implement.dart';
import '../../../domain/usecases/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _login = Login(AuthRepositoryImplement());
  LoginBloc() : super(const LoginState()) {

    on<GetLoginEvent>(_mapLoginState);
  
  }
  FutureOr<void> _mapLoginState(
      GetLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    final result = await _login(event.loginParams);
    result.fold(
      (l) => emit(state.copyWith(loginStatus: LoginStatus.failed)),
      (r) {
        emit(state.copyWith(
          loginStatus: LoginStatus.succ,
        ));
        GlobalFunctions.setToken(r.data!.token!);
        GlobalFunctions.setUserInfo(r.data!.admin!);
      },
    );
  }
}
