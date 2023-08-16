import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../data/models/clinic_booking_owner_response.dart';
import '../../../data/repositories/owner_booking_repository_implement.dart';
import '../../../domain/usecases/accept_clinic_order.dart';
import '../../../domain/usecases/get_clinic_orders.dart';
import '../../../domain/usecases/reject_clinic_order.dart';

part 'clinic_order_event.dart';
part 'clinic_order_state.dart';

class ClinicOrderBloc extends Bloc<ClinicOrderEvent, ClinicOrderState> {
  final _getOrder = GetClinicOrders(OwnerBookingRepositoryImplements());
  final _rejectOrder = RejectClinicOrder(OwnerBookingRepositoryImplements());
  final _acceptOrder = AcceptClinicOrder(OwnerBookingRepositoryImplements());
  ClinicOrderBloc() : super(ClinicOrderState()) {
    on<GetClinicOrdersEvent>(_mapGetClinicOrderStatus);
    on<AcceptClinicOrderEvent>(_mapAcceptOrderState);
    on<RejectClinicOrderEvent>(_mapRejectOrderState);
  }
  FutureOr<void> _mapGetClinicOrderStatus(
      GetClinicOrdersEvent event, Emitter<ClinicOrderState> emit) async {
    emit(state.copyWith(getClinicOrdersStatus: GetClinicOrdersStatus.loading));
    final result =
        await _getOrder(GetClinicOrdersParams(clinicId: event.clinicId));
    result.fold(
      (l) => emit(
          state.copyWith(getClinicOrdersStatus: GetClinicOrdersStatus.failed)),
      (r) => emit(state.copyWith(
        orderClinics: r.data!.clinicBookings,
        getClinicOrdersStatus: GetClinicOrdersStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapAcceptOrderState(
      AcceptClinicOrderEvent event, Emitter<ClinicOrderState> emit) async {
    emit(state.copyWith(
        actionClinicOrdersStatus: ActionClinicOrdersStatus.loading));
    final result =
        await _acceptOrder(GetClinicOrdersParams(clinicId: event.clinicId));
    result.fold(
      (l) => emit(state.copyWith(
          actionClinicOrdersStatus: ActionClinicOrdersStatus.failed)),
      (r) {
        emit(state.copyWith(
            actionClinicOrdersStatus: ActionClinicOrdersStatus.succ));
        add(GetClinicOrdersEvent(clinicId: event.clinicId));
      },
    );
    emit(state.copyWith(
        actionClinicOrdersStatus: ActionClinicOrdersStatus.init));
  }

  FutureOr<void> _mapRejectOrderState(
      RejectClinicOrderEvent event, Emitter<ClinicOrderState> emit) async {
    emit(state.copyWith(
        actionClinicOrdersStatus: ActionClinicOrdersStatus.loading));
    final result =
        await _rejectOrder(GetClinicOrdersParams(clinicId: event.clinicId));
    result.fold(
      (l) => emit(state.copyWith(
          actionClinicOrdersStatus: ActionClinicOrdersStatus.failed)),
      (r) {
        emit(state.copyWith(
            actionClinicOrdersStatus: ActionClinicOrdersStatus.succ));
        add(GetClinicOrdersEvent(clinicId: event.clinicId));
      },
    );
    emit(state.copyWith(
        actionClinicOrdersStatus: ActionClinicOrdersStatus.init));
  }
}
