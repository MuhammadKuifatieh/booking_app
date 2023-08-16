import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking_app/features/owner_booking/data/repositories/owner_booking_repository_implement.dart';

import '../../../data/models/hotel_booking_owner_response.dart';
import '../../../domain/usecases/accept_hotel_order.dart';
import '../../../domain/usecases/get_hotel_orders.dart';
import '../../../domain/usecases/reject_hote_order.dart';

part 'hotel_order_event.dart';
part 'hotel_order_state.dart';

class HotelOrderBloc extends Bloc<HotelOrderEvent, HotelOrderState> {
  final _getOrder = GetHotelOrders(OwnerBookingRepositoryImplements());
  final _rejectOrder = RejectHotelOrder(OwnerBookingRepositoryImplements());
  final _acceptOrder = AcceptHotelOrder(OwnerBookingRepositoryImplements());
  HotelOrderBloc() : super(HotelOrderState()) {
    on<GetHotelOrdersEvent>(_mapGetHotelOrderStatus);
    on<AcceptHotelOrderEvent>(_mapAcceptOrderState);
    on<RejectHotelOrderEvent>(_mapRejectOrderState);
  }
  FutureOr<void> _mapGetHotelOrderStatus(
      GetHotelOrdersEvent event, Emitter<HotelOrderState> emit) async {
    emit(state.copyWith(getHotelOrdersStatus: GetHotelOrdersStatus.loading));
    final result =
        await _getOrder(GetHotelOrdersParams(hotelId: event.hotelId));
    result.fold(
      (l) => emit(
          state.copyWith(getHotelOrdersStatus: GetHotelOrdersStatus.failed)),
      (r) => emit(state.copyWith(
        orderHotels: r.data!.hotelBookings,
        getHotelOrdersStatus: GetHotelOrdersStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapAcceptOrderState(
      AcceptHotelOrderEvent event, Emitter<HotelOrderState> emit) async {
    emit(state.copyWith(
        actionHotelOrdersStatus: ActionHotelOrdersStatus.loading));
    final result =
        await _acceptOrder(GetHotelOrdersParams(hotelId: event.hotelId));
    result.fold(
      (l) => emit(state.copyWith(
          actionHotelOrdersStatus: ActionHotelOrdersStatus.failed)),
      (r) {
        emit(state.copyWith(
            actionHotelOrdersStatus: ActionHotelOrdersStatus.succ));
        add(GetHotelOrdersEvent(hotelId: event.hotelId));
      },
    );
    emit(state.copyWith(actionHotelOrdersStatus: ActionHotelOrdersStatus.init));
  }

  FutureOr<void> _mapRejectOrderState(
      RejectHotelOrderEvent event, Emitter<HotelOrderState> emit) async {
    emit(state.copyWith(
        actionHotelOrdersStatus: ActionHotelOrdersStatus.loading));
    final result =
        await _rejectOrder(GetHotelOrdersParams(hotelId: event.hotelId));
    result.fold(
      (l) => emit(state.copyWith(
          actionHotelOrdersStatus: ActionHotelOrdersStatus.failed)),
      (r) {
        emit(state.copyWith(
            actionHotelOrdersStatus: ActionHotelOrdersStatus.succ));
        add(GetHotelOrdersEvent(hotelId: event.hotelId));
      },
    );
    emit(state.copyWith(actionHotelOrdersStatus: ActionHotelOrdersStatus.init));
  }
}
