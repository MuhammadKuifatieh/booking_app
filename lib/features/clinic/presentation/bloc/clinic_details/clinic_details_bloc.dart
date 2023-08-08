import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/models/clinic_model.dart';
import '../../../data/repositories/clinic_repository_implement.dart';
import '../../../domain/usecases/show_clinic.dart';

part 'clinic_details_event.dart';
part 'clinic_details_state.dart';

class ClinicDetailsBloc extends Bloc<ClinicDetailsEvent, ClinicDetailsState> {
  final _showClinic = ShowClinic(ClinicRepositoryImplement());
  ClinicDetailsBloc() : super(const ClinicDetailsState()) {
    on<ShowClinicDetailsEvent>(_mapShowClinicState);
  }
  FutureOr<void> _mapShowClinicState(
      ShowClinicDetailsEvent event, Emitter<ClinicDetailsState> emit) async {
    emit(state.copyWith(
        showClinicDetailsStatus: ShowClinicDetailsStatus.loading));
    final result =
        await _showClinic(ShowClinicParams(clinicId: event.clinicId));
    result.fold(
      (l) => emit(state.copyWith(
          showClinicDetailsStatus: ShowClinicDetailsStatus.failed)),
      (r) {
        emit(state.copyWith(
          clinic: r.data!.clinic,
          showClinicDetailsStatus: ShowClinicDetailsStatus.succ,
        ));
        emit(state.copyWith(
            showClinicDetailsStatus: ShowClinicDetailsStatus.done));
      },
    );
  }
}
