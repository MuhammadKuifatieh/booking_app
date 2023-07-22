import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/models/show_hotel_response.dart';
import '../../../data/repositories/hotel_repository_implement.dart';
import '../../../domain/usecases/get_hotels.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final _perPage = 10;
  final getHotels = GetHotels(HotelRepositoryImplement());
  HotelsBloc() : super(const HotelsState()) {
    on<GetHotelsEvent>(_mapGetHotelsState);
  }

  FutureOr<void> _mapGetHotelsState(
      GetHotelsEvent event, Emitter<HotelsState> emit) async {
    if (event.isReload || state.getHotelsStataus == GetHotelsStataus.init) {
      emit(state.copyWith(getHotelsStataus: GetHotelsStataus.init));
      final result = await getHotels(GetHotelsParams(
        page: 1,
        perPage: _perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(getHotelsStataus: GetHotelsStataus.failed)),
        (r) => emit(state.copyWith(
          hotels: r.data!.hotels,
          getHotelsStataus: GetHotelsStataus.succ,
          isEndPage: r.data!.hotels!.length < _perPage,
        )),
      );
    } else if (!state.isEndPage) {
      emit(state.copyWith(getHotelsStataus: GetHotelsStataus.init));
      final result = await getHotels(GetHotelsParams(
        page: state.hotels.length ~/ _perPage,
        perPage: _perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(getHotelsStataus: GetHotelsStataus.failed)),
        (r) => emit(state.copyWith(
          getHotelsStataus: GetHotelsStataus.succ,
          isEndPage: r.data!.hotels!.length < _perPage,
          hotels: List.of(state.hotels)..addAll(r.data!.hotels!),
        )),
      );
    }
  }
}
