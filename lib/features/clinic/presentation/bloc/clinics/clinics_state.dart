part of 'clinics_bloc.dart';

enum GetClinicSpecializationStatus { init, loading, failed, succ }

enum GetClinicsStatus { init, loading, failed, succ }

class ClinicsState {
  final bool isEndPage;
  final List<ClinicModel> clinics;
  final GetClinicsStatus getClinicsStatus;
  final List<ClinicSpecializationModel> clinicSpecializations;
  final GetClinicSpecializationStatus getClinicSpecializationStatus;
  const ClinicsState({
    this.isEndPage = false,
    this.clinics = const [],
    this.clinicSpecializations = const [],
    this.getClinicsStatus = GetClinicsStatus.init,
    this.getClinicSpecializationStatus = GetClinicSpecializationStatus.init,
  });

  ClinicsState copyWith({
    bool? isEndPage,
    List<ClinicModel>? clinics,
    GetClinicsStatus? getClinicsStatus,
    List<ClinicSpecializationModel>? clinicSpecializations,
    GetClinicSpecializationStatus? getClinicSpecializationStatus,
  }) {
    return ClinicsState(
      isEndPage: isEndPage ?? this.isEndPage,
      clinics: clinics ?? this.clinics,
      getClinicsStatus: getClinicsStatus ?? this.getClinicsStatus,
      clinicSpecializations: clinicSpecializations ?? this.clinicSpecializations,
      getClinicSpecializationStatus: getClinicSpecializationStatus ?? this.getClinicSpecializationStatus,
    );
  }
}
