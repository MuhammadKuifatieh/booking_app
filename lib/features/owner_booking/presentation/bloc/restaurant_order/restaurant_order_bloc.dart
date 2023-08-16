import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/models/restaurant_booking_owner_response.dart';
import '../../../data/repositories/owner_booking_repository_implement.dart';
import '../../../domain/usecases/accept_restaurant_order.dart';
import '../../../domain/usecases/get_resturant_orders.dart';
import '../../../domain/usecases/reject_restaurant_order.dart';

part 'restaurant_order_event.dart';
part 'restaurant_order_state.dart';

class RestaurantOrderBloc
    extends Bloc<RestaurantOrderEvent, RestaurantOrderState> {
  final _getOrder = GetRestaurantOrders(OwnerBookingRepositoryImplements());
  final _rejectOrder =
      RejectRestaurantOrder(OwnerBookingRepositoryImplements());
  final _acceptOrder =
      AcceptRestaurantOrder(OwnerBookingRepositoryImplements());
  RestaurantOrderBloc() : super(RestaurantOrderState()) {
    on<GetRestaurantOrdersEvent>(_mapGetRestaurantOrderStatus);
    on<AcceptRestaurantOrderEvent>(_mapAcceptOrderState);
    on<RejectRestaurantOrderEvent>(_mapRejectOrderState);
  }
  FutureOr<void> _mapGetRestaurantOrderStatus(GetRestaurantOrdersEvent event,
      Emitter<RestaurantOrderState> emit) async {
    emit(state.copyWith(
        getRestaurantOrdersStatus: GetRestaurantOrdersStatus.loading));
    final result = await _getOrder(
        GetRestaurantOrdersParams(restaurantId: event.restaurantId));
    result.fold(
      (l) => emit(state.copyWith(
          getRestaurantOrdersStatus: GetRestaurantOrdersStatus.failed)),
      (r) => emit(state.copyWith(
        orderRestaurants: r.data!.restaurantBookings,
        getRestaurantOrdersStatus: GetRestaurantOrdersStatus.succ,
      )),
    );
  }

  Future<void> _mapAcceptOrderState(AcceptRestaurantOrderEvent event,
      Emitter<RestaurantOrderState> emit) async {
    emit(state.copyWith(
        actionRestaurantOrdersStatus: ActionRestaurantOrdersStatus.loading));
    final result = await _acceptOrder(
        GetRestaurantOrdersParams(restaurantId: event.restaurantId));
    result.fold(
      (l) => emit(state.copyWith(
          actionRestaurantOrdersStatus: ActionRestaurantOrdersStatus.failed)),
      (r) {
        emit(state.copyWith(
            actionRestaurantOrdersStatus: ActionRestaurantOrdersStatus.succ));
        add(GetRestaurantOrdersEvent(restaurantId: event.restaurantId));
      },
    );
    emit(state.copyWith(
        actionRestaurantOrdersStatus: ActionRestaurantOrdersStatus.init));
  }

  FutureOr<void> _mapRejectOrderState(RejectRestaurantOrderEvent event,
      Emitter<RestaurantOrderState> emit) async {
    emit(state.copyWith(
        actionRestaurantOrdersStatus: ActionRestaurantOrdersStatus.loading));
    final result = await _rejectOrder(
        GetRestaurantOrdersParams(restaurantId: event.restaurantId));
    result.fold(
      (l) => emit(state.copyWith(
          actionRestaurantOrdersStatus: ActionRestaurantOrdersStatus.failed)),
      (r) {
        emit(state.copyWith(
            actionRestaurantOrdersStatus: ActionRestaurantOrdersStatus.succ));
        add(GetRestaurantOrdersEvent(restaurantId: event.restaurantId));
      },
    );
    emit(state.copyWith(
        actionRestaurantOrdersStatus: ActionRestaurantOrdersStatus.init));
  }
}
