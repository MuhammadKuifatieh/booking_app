import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/config/global_functions.dart';
import '../../../../core/models/city_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/repositories/citiy_repositories_implement.dart';
import '../../domain/usecases/get_cities.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final _getCities = GetCities(CityRepositoryImplement());
  SplashBloc() : super(const SplashState()) {
    on<CheckAuthEvent>(_mapCheckAuthState);

    on<GetCitiesEvent>(_mapGetCities);
  }
  FutureOr<void> _mapCheckAuthState(
      CheckAuthEvent event, Emitter<SplashState> emit) async {
    if (await GlobalFunctions.isFirstOpen()) {
      emit(state.copyWith(authStatus: AuthStatus.isFirstOpen));
    } else if (await GlobalFunctions.isAuth()) {
      emit(state.copyWith(authStatus: AuthStatus.auth));
      add(const GetCitiesEvent());
    } else {
      emit(state.copyWith(authStatus: AuthStatus.unAuth));
    }
  }

  FutureOr<void> _mapGetCities(
      GetCitiesEvent event, Emitter<SplashState> emit) async {
    emit(state.copyWith(getCitiesStatus: GetCitiesStatus.loading));
    final result = await _getCities(NoParams());
    result.fold(
      (l) => emit(state.copyWith(getCitiesStatus: GetCitiesStatus.failed)),
      (r) => emit(state.copyWith(
        cities: r.data!.cities,
        getCitiesStatus: GetCitiesStatus.succ,
      )),
    );
  }
}
