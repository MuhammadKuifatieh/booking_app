import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/models/car_office_booking_owner_response.dart';
import '../../../data/repositories/owner_booking_repository_implement.dart';
import '../../../domain/usecases/accept_car_office_order.dart';
import '../../../domain/usecases/get_car_office_orders.dart';
import '../../../domain/usecases/reject_car_office_order.dart';

part 'car_office_order_event.dart';
part 'car_office_order_state.dart';

class CarOfficeOrderBloc
    extends Bloc<CarOfficeOrderEvent, CarOfficeOrderState> {
  final _getOrder = GetCarOfficeOrders(OwnerBookingRepositoryImplements());
  final _rejectOrder = RejectCarOfficeOrder(OwnerBookingRepositoryImplements());
  final _acceptOrder = AcceptCarOfficeOrder(OwnerBookingRepositoryImplements());
  CarOfficeOrderBloc() : super(CarOfficeOrderState()) {
    on<GetCarOfficeOrdersEvent>(_mapGetCarOfficeOrderStatus);
    on<AcceptCarOfficeOrderEvent>(_mapAcceptOrderState);
    on<RejectCarOfficeOrderEvent>(_mapRejectOrderState);
  }
  FutureOr<void> _mapGetCarOfficeOrderStatus(
      GetCarOfficeOrdersEvent event, Emitter<CarOfficeOrderState> emit) async {
    emit(state.copyWith(
        getCarOfficeOrdersStatus: GetCarOfficeOrdersStatus.loading));
    final result = await _getOrder(
        GetCarOfficeOrdersParams(carOfficeId: event.carOfficeId));
    result.fold(
      (l) => emit(state.copyWith(
          getCarOfficeOrdersStatus: GetCarOfficeOrdersStatus.failed)),
      (r) => emit(state.copyWith(
        orderCarOffices: r.data!.carBookings,
        getCarOfficeOrdersStatus: GetCarOfficeOrdersStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapAcceptOrderState(AcceptCarOfficeOrderEvent event,
      Emitter<CarOfficeOrderState> emit) async {
    emit(state.copyWith(
        actionCarOfficeOrdersStatus: ActionCarOfficeOrdersStatus.loading));
    final result = await _acceptOrder(
        GetCarOfficeOrdersParams(carOfficeId: event.carOfficeId));
    result.fold(
      (l) => emit(state.copyWith(
          actionCarOfficeOrdersStatus: ActionCarOfficeOrdersStatus.failed)),
      (r) {
        emit(state.copyWith(
            actionCarOfficeOrdersStatus: ActionCarOfficeOrdersStatus.succ));
        add(GetCarOfficeOrdersEvent(carOfficeId: event.carOfficeId));
      },
    );
    emit(state.copyWith(
        actionCarOfficeOrdersStatus: ActionCarOfficeOrdersStatus.init));
  }

  FutureOr<void> _mapRejectOrderState(RejectCarOfficeOrderEvent event,
      Emitter<CarOfficeOrderState> emit) async {
    emit(state.copyWith(
        actionCarOfficeOrdersStatus: ActionCarOfficeOrdersStatus.loading));
    final result = await _rejectOrder(
        GetCarOfficeOrdersParams(carOfficeId: event.carOfficeId));
    result.fold(
      (l) => emit(state.copyWith(
          actionCarOfficeOrdersStatus: ActionCarOfficeOrdersStatus.failed)),
      (r) {
        emit(state.copyWith(
            actionCarOfficeOrdersStatus: ActionCarOfficeOrdersStatus.succ));
        add(GetCarOfficeOrdersEvent(carOfficeId: event.carOfficeId));
      },
    );
    emit(state.copyWith(
        actionCarOfficeOrdersStatus: ActionCarOfficeOrdersStatus.init));
  }
}
