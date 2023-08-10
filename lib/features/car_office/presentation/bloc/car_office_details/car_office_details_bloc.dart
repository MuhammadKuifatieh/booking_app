import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/models/car_office_model.dart';
import '../../../data/repositories/car_office_repository_implement.dart';
import '../../../domain/usecases/booking_car_office.dart';
import '../../../domain/usecases/show_car_office.dart';

part 'car_office_details_event.dart';
part 'car_office_details_state.dart';

class CarOfficeDetailsBloc
    extends Bloc<CarOfficeDetailsEvent, CarOfficeDetailsState> {
  final _showCarOffice = ShowCarOffice(CarOfficeRepositoryImplement());

  final _bookingCarOffice = BookingCarOffice(CarOfficeRepositoryImplement());
  CarOfficeDetailsBloc() : super(const CarOfficeDetailsState()) {
    on<ShowCarOfficeDetailsEvent>(_mapShowCarOffice);

    on<BookingCarOfficeEvent>(_mapBookingCarOffice);
  }

  FutureOr<void> _mapBookingCarOffice(
      BookingCarOfficeEvent event, Emitter<CarOfficeDetailsState> emit) async {
    emit(
        state.copyWith(bookingCarOfficeStatus: BookingCarOfficeStatus.loading));
    final result = await _bookingCarOffice(event.params);
    result.fold(
      (l) => emit(state.copyWith(
        bookingCarOfficeStatus: BookingCarOfficeStatus.failed,
      )),
      (r) => emit(state.copyWith(
        bookingCarOfficeStatus: BookingCarOfficeStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapShowCarOffice(ShowCarOfficeDetailsEvent event,
      Emitter<CarOfficeDetailsState> emit) async {
    emit(state.copyWith(showCarOfficeStatus: ShowCarOfficeStatus.loading));
    final result = await _showCarOffice(
        ShowCarOfficeParams(carOfficeId: event.carOfficeId));
    result.fold(
      (l) => emit(
        state.copyWith(showCarOfficeStatus: ShowCarOfficeStatus.failed),
      ),
      (r) => emit(
        state.copyWith(
          carOffice: r.data!.carOffice,
          showCarOfficeStatus: ShowCarOfficeStatus.succ,
        ),
      ),
    );
  }
}
