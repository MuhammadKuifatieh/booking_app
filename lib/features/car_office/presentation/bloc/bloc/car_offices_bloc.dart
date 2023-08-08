import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/config/droppable_pro_max.dart';
import '../../../../../core/models/car_office_model.dart';
import '../../../data/repositories/car_office_repository_implement.dart';
import '../../../domain/usecases/get_car_offices.dart';

part 'car_offices_event.dart';
part 'car_offices_state.dart';

class CarOfficesBloc extends Bloc<CarOfficesEvent, CarOfficesState> {
  final _perPage = 10;
  final _getCarOffices = GetCarOffices(CarOfficeRepositoryImplement());
  CarOfficesBloc() : super(const CarOfficesState()) {
    on<GetCarOfficesEvent>(_mapGetCarOfficesState);
  }
  FutureOr<void> _mapGetCarOfficesState(
      GetCarOfficesEvent event, Emitter<CarOfficesState> emit) async {
    if (state.getCarOfficesStatus == GetCarOfficesStatus.init ||
        event.isReload) {
      emit(state.copyWith(getCarOfficesStatus: GetCarOfficesStatus.loading));
      final result = await _getCarOffices(GetCarOfficesParams(
        page: 1,
        perPage: _perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(
          getCarOfficesStatus: GetCarOfficesStatus.failed,
        )),
        (r) => emit(state.copyWith(
          carOffices: r.data!.carOffices,
          isEndPage: r.data!.carOffices!.length < _perPage,
          getCarOfficesStatus: GetCarOfficesStatus.succ,
        )),
      );
    } else if (!state.isEndPage) {
      emit(state.copyWith(getCarOfficesStatus: GetCarOfficesStatus.loading));
      final result = await _getCarOffices(GetCarOfficesParams(
        page: state.carOffices.length ~/ _perPage + 1,
        perPage: _perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(
          getCarOfficesStatus: GetCarOfficesStatus.failed,
        )),
        (r) => emit(state.copyWith(
          carOffices: List.of(state.carOffices)..addAll(r.data!.carOffices!),
          isEndPage: r.data!.carOffices!.length < _perPage,
          getCarOfficesStatus: GetCarOfficesStatus.succ,
        )),
      );
    }
  }
}
