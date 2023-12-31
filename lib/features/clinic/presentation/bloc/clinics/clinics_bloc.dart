import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../../core/config/droppable_pro_max.dart';
import '../../../../../core/enums/categories_enum.dart';
import '../../../../../core/models/clinic_model.dart';
import '../../../../../core/models/clinic_specialization_response.dart';
import '../../../../../core/presentation/blocs/bloc/favorite_bloc.dart';
import '../../../../../core/usecase/use_case.dart';
import '../../../../../injection.dart';
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
    on<GetClinicsEvent>(
      _mapGetClinicsState,
      transformer: droppableProMax(),
    );

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
      (r) {
        emit(
          state.copyWith(
            clinicSpecializations: r.data!.clinicSpecializations!
              ..insert(0, ClinicSpecializationModel(name: "All")),
            getClinicSpecializationStatus: GetClinicSpecializationStatus.succ,
          ),
        );
        emit(state.copyWith(
            getClinicSpecializationStatus: GetClinicSpecializationStatus.done));
        add(GetClinicsEvent(
          clinicSpecializationId: state.clinicSpecializations.first.id,
        ));
      },
    );
  }

  FutureOr<void> _mapGetClinicsState(
      GetClinicsEvent event, Emitter<ClinicsState> emit) async {
    if (state.getClinicsStatus == GetClinicsStatus.init || event.isReload) {
      emit(state.copyWith(
        clinics: [],
        getClinicsStatus: GetClinicsStatus.loading,
      ));
      final result = await _getClinics(GetClinicsParams(
        page: 1,
        perPage: _perPage,
        clinicSpecializationId: event.clinicSpecializationId,
      ));

      result.fold(
        (l) => emit(state.copyWith(getClinicsStatus: GetClinicsStatus.failed)),
        (r) {
          emit(state.copyWith(
            clinics: r.data!.clinics,
            isEndPage: r.data!.clinics!.length < _perPage,
            getClinicsStatus: GetClinicsStatus.succ,
          ));
          serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
            items: r.data!.clinics!,
            modelType: CategoriesEnum.clinic.status,
          ));
        },
      );
    } else if (!state.isEndPage) {
      emit(state.copyWith(getClinicsStatus: GetClinicsStatus.loading));
      final result = await _getClinics(GetClinicsParams(
        clinicSpecializationId: event.clinicSpecializationId,
        page: state.clinics.length ~/ _perPage + 1,
        perPage: _perPage,
      ));

      result.fold(
        (l) => emit(state.copyWith(getClinicsStatus: GetClinicsStatus.failed)),
        (r) {
          emit(state.copyWith(
            clinics: List.of(state.clinics)..addAll(r.data!.clinics!),
            isEndPage: r.data!.clinics!.length < _perPage,
            getClinicsStatus: GetClinicsStatus.succ,
          ));
          serviceLocator<FavoriteBloc>().add(AddItemsToFavoriteEvent(
            items: r.data!.clinics!,
            modelType: CategoriesEnum.clinic.status,
          ));
        },
      );
    }
  }
}
