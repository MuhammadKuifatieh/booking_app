import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking_app/core/config/droppable_pro_max.dart';
import 'package:booking_app/core/enums/categories_enum.dart';
import 'package:booking_app/core/presentation/blocs/bloc/favorite_bloc.dart';
import 'package:booking_app/injection.dart';

import '../../../../../core/models/hotel_model.dart';
import '../../../data/repositories/hotel_repository_implement.dart';
import '../../../domain/usecases/get_hotels.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final _perPage = 10;
  final getHotels = GetHotels(HotelRepositoryImplement());
  HotelsBloc() : super(const HotelsState()) {
    on<GetHotelsEvent>(
      _mapGetHotelsState,
      transformer: droppableProMax(),
    );
  }

  FutureOr<void> _mapGetHotelsState(
      GetHotelsEvent event, Emitter<HotelsState> emit) async {
    if (event.isReload || state.getHotelsStataus == GetHotelsStataus.init) {
      emit(state.copyWith(
        hotels: [],
        getHotelsStataus: GetHotelsStataus.loading,
      ));
      final result = await getHotels(GetHotelsParams(
        page: 1,
        perPage: _perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(getHotelsStataus: GetHotelsStataus.failed)),
        (r) {
          emit(state.copyWith(
            hotels: r.data!.hotels,
            getHotelsStataus: GetHotelsStataus.succ,
            isEndPage: r.data!.hotels!.length < _perPage,
          ));
          serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
            items: r.data!.hotels!,
            modelType: CategoriesEnum.hotel.status,
          ));
        },
      );
    } else if (!state.isEndPage) {
      emit(state.copyWith(getHotelsStataus: GetHotelsStataus.loading));
      final result = await getHotels(GetHotelsParams(
        page: state.hotels.length ~/ _perPage + 1,
        perPage: _perPage,
      ));
      result.fold(
        (l) => emit(state.copyWith(getHotelsStataus: GetHotelsStataus.failed)),
        (r) {
          emit(state.copyWith(
            getHotelsStataus: GetHotelsStataus.succ,
            isEndPage: r.data!.hotels!.length < _perPage,
            hotels: List.of(state.hotels)..addAll(r.data!.hotels!),
          ));
          serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
            items: r.data!.hotels!,
            modelType: CategoriesEnum.hotel.status,
          ));
        },
      );
    }
  }
}
