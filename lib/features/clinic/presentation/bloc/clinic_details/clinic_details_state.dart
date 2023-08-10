part of 'clinic_details_bloc.dart';

enum ShowClinicDetailsStatus { init, loading, succ, failed, done }

enum BookingClinicStatus { init, loading, succ, failed }

class ClinicDetailsState {
  final ClinicModel? clinic;
  final ShowClinicDetailsStatus showClinicDetailsStatus;
  final BookingClinicStatus bookingClinicStatus;
  const ClinicDetailsState({
    this.clinic,
    this.bookingClinicStatus = BookingClinicStatus.init,
    this.showClinicDetailsStatus = ShowClinicDetailsStatus.init,
  });

  ClinicDetailsState copyWith({
    ClinicModel? clinic,
    BookingClinicStatus? bookingClinicStatus,
    ShowClinicDetailsStatus? showClinicDetailsStatus,
  }) {
    return ClinicDetailsState(
      clinic: clinic ?? this.clinic,
      bookingClinicStatus: bookingClinicStatus ?? this.bookingClinicStatus,
      showClinicDetailsStatus:
          showClinicDetailsStatus ?? this.showClinicDetailsStatus,
    );
  }
}
