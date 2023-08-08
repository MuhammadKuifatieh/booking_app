part of 'clinic_details_bloc.dart';

enum ShowClinicDetailsStatus { init, loading, succ, failed, done }

class ClinicDetailsState {
  final ClinicModel? clinic;
  final ShowClinicDetailsStatus showClinicDetailsStatus;
  const ClinicDetailsState({
    this.clinic,
    this.showClinicDetailsStatus = ShowClinicDetailsStatus.init,
  });

  ClinicDetailsState copyWith({
    ClinicModel? clinic,
    ShowClinicDetailsStatus? showClinicDetailsStatus,
  }) {
    return ClinicDetailsState(
      clinic: clinic ?? this.clinic,
      showClinicDetailsStatus:
          showClinicDetailsStatus ?? this.showClinicDetailsStatus,
    );
  }
}
