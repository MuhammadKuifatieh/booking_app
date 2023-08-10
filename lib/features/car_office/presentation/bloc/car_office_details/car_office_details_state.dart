part of 'car_office_details_bloc.dart';

enum ShowCarOfficeStatus { init, loading, failed, succ }

enum BookingCarOfficeStatus { init, loading, failed, succ }

class CarOfficeDetailsState {
  final CarOfficeModel? carOffice;
  final ShowCarOfficeStatus showCarOfficeStatus;
  final BookingCarOfficeStatus bookingCarOfficeStatus;

  const CarOfficeDetailsState({
    this.carOffice,
    this.showCarOfficeStatus = ShowCarOfficeStatus.init,
    this.bookingCarOfficeStatus = BookingCarOfficeStatus.init,
  });

  CarOfficeDetailsState copyWith({
    CarOfficeModel? carOffice,
    ShowCarOfficeStatus? showCarOfficeStatus,
    BookingCarOfficeStatus? bookingCarOfficeStatus,
  }) {
    return CarOfficeDetailsState(
      carOffice: carOffice ?? this.carOffice,
      showCarOfficeStatus: showCarOfficeStatus ?? this.showCarOfficeStatus,
      bookingCarOfficeStatus:
          bookingCarOfficeStatus ?? this.bookingCarOfficeStatus,
    );
  }
}
