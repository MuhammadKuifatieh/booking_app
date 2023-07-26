import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/config/global_functions.dart';
import '../../../data/repositories/auth_repository_implement.dart';
import '../../../domain/usecases/register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final _register = Register(AuthRepositoryImplement());

  RegisterBloc() : super(const RegisterState()) {
    on<GetRegisterEvent>(_mapRegisterState);
  }
  FutureOr<void> _mapRegisterState(
      GetRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(registerStatus: RegisterStatus.loading));
    final result = await _register(event.registerParams);
    result.fold(
      (l) => emit(state.copyWith(registerStatus: RegisterStatus.failed)),
      (r) {
        emit(state.copyWith(registerStatus: RegisterStatus.succ));
        GlobalFunctions.setToken(r.data!.token!);
        GlobalFunctions.setUserInfo(r.data!.admin!);
      },
    );
  }
}
