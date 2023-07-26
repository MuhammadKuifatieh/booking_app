import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/usecase/use_case.dart';
import '../../../data/models/clinic_specialization_response.dart';
import '../../../data/models/clinics_response.dart';
import '../../../data/repositories/clinic_repository_implement.dart';
import '../../../domain/usecases/get_clinic_specialization.dart';
import '../../../domain/usecases/get_clinics.dart';

part 'clinics_event.dart';
part 'clinics_state.dart';

class ClinicsBloc extends Bloc<ClinicsEvent, ClinicsState> {
  final _perPage = 10;
  final _getClinics = GetClinics(ClinicRepositoryImplement());
  final _getClinicsSpecialization =
      GetClinicSpecialization(ClinicRepositoryImplement());
  ClinicsBloc() : super(const ClinicsState()) {
    on<GetClinicsEvent>(_mapGetClinicsState);

    on<GetClinicSpecializationEvent>(_mapGetClinicSpecializationState);
  }

  Future<void> _mapGetClinicSpecializationState(
      GetClinicSpecializationEvent event, Emitter<ClinicsState> emit) async {
    emit(state.copyWith(
        getClinicSpecializationStatus: GetClinicSpecializationStatus.loading));
    final result = await _getClinicsSpecialization(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
          getClinicSpecializationStatus: GetClinicSpecializationStatus.failed)),
      (r) => emit(state.copyWith(
        clinicSpecializations: r.data!.clinicSpecializations,
        getClinicSpecializationStatus: GetClinicSpecializationStatus.succ,
      )),
    );
  }

  FutureOr<void> _mapGetClinicsState(
      GetClinicsEvent event, Emitter<ClinicsState> emit) async {
    if (state.getClinicsStatus == GetClinicsStatus.init || event.isReload) {
      emit(state.copyWith(getClinicsStatus: GetClinicsStatus.loading));
      final result = await _getClinics(GetClinicsParams(
        page: 1,
        perPage: _perPage,
      ));

      result.fold(
        (l) => emit(state.copyWith(getClinicsStatus: GetClinicsStatus.failed)),
        (r) => emit(state.copyWith(
          clinics: r.data!.clinics,
          getClinicsStatus: GetClinicsStatus.succ,
        )),
      );
    } else if (!state.isEndPage) {
      emit(state.copyWith(getClinicsStatus: GetClinicsStatus.loading));
      final result = await _getClinics(GetClinicsParams(
        page: state.clinics.length ~/ _perPage + 1,
        perPage: _perPage,
      ));

      result.fold(
        (l) => emit(state.copyWith(getClinicsStatus: GetClinicsStatus.failed)),
        (r) => emit(state.copyWith(
          clinics: List.of(state.clinics)..addAll(r.data!.clinics!),
          getClinicsStatus: GetClinicsStatus.succ,
        )),
      );
    }
  }
}
