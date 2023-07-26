import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/models/show_restaurant_response.dart';
import '../../../data/repositories/restaurant_repository_implement.dart';
import '../../../domain/usecases/get_restaurants.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final _perPage = 10;
  final _getRestaurants = GetRestaurants(RestaurantRepositoryImplement());
  RestaurantsBloc() : super(const RestaurantsState()) {
    on<GetRestaurantsEvent>(_mapGetRestaurantsState);
  }
  FutureOr<void> _mapGetRestaurantsState(
      GetRestaurantsEvent event, Emitter<RestaurantsState> emit) async {
    if (state.getRestaurantsStatus == GetRestaurantsStatus.inti ||
        event.isReload) {
      emit(state.copyWith(getRestaurantsStatus: GetRestaurantsStatus.loading));
      final result = await _getRestaurants(GetRestaurantsParams(
        page: 1,
        perPage: _perPage,
      ));
      result.fold(
        (l) => emit(
            state.copyWith(getRestaurantsStatus: GetRestaurantsStatus.failed)),
        (r) => emit(state.copyWith(
          isEndPage: r.data!.restaurants!.length < _perPage,
          restaurants: r.data!.restaurants,
          getRestaurantsStatus: GetRestaurantsStatus.succ,
        )),
      );
    } else if (!state.isEndPage) {
      emit(state.copyWith(getRestaurantsStatus: GetRestaurantsStatus.loading));
      final result = await _getRestaurants(GetRestaurantsParams(
        page: state.restaurants.length ~/ _perPage + 1,
        perPage: _perPage,
      ));
      result.fold(
        (l) => emit(
            state.copyWith(getRestaurantsStatus: GetRestaurantsStatus.failed)),
        (r) => emit(state.copyWith(
          isEndPage: r.data!.restaurants!.length < _perPage,
          restaurants: List.of(state.restaurants)..addAll(r.data!.restaurants!),
          getRestaurantsStatus: GetRestaurantsStatus.succ,
        )),
      );
    }
  }
}
