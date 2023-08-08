import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/models/restaurant_model.dart';
import '../../../data/repositories/restaurant_repository_implement.dart';
import '../../../domain/usecases/show_restaurant.dart';

part 'restaurant_details_event.dart';
part 'restaurant_details_state.dart';

class RestaurantDetailsBloc
    extends Bloc<RestaurantDetailsEvent, RestaurantDetailsState> {
  final _showRestaurant = ShowRestaurant(RestaurantRepositoryImplement());
  RestaurantDetailsBloc() : super(const RestaurantDetailsState()) {
    on<ShowRestaurantEvent>(_mapShowRestaurantState);
  }
  FutureOr<void> _mapShowRestaurantState(
      ShowRestaurantEvent event, Emitter<RestaurantDetailsState> emit) async {
    emit(state.copyWith(showRestaurantStatus: ShowRestaurantStatus.loading));
    final result = await _showRestaurant(
        ShowRestaurantParams(restaurantId: event.restaurantId));
    result.fold(
      (l) => emit(state.copyWith(
        showRestaurantStatus: ShowRestaurantStatus.failed,
      )),
      (r) => emit(state.copyWith(
        restaurant: r.data!.restaurant!,
        showRestaurantStatus: ShowRestaurantStatus.succ,
      )),
    );
  }
}
