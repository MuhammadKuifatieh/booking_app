part of 'hotel_details_bloc.dart';

enum ShowHotelStatus { init, loading, succ, failed }

enum BookingHotelStatus { init, loadnig, succ, failed }

class HotelState {
  final HotelModel? hotel;
  final ShowHotelStatus showHotelStatus;
  final BookingHotelStatus bookingHotelStatus;
  const HotelState({
    this.hotel,
    this.showHotelStatus = ShowHotelStatus.init,
    this.bookingHotelStatus = BookingHotelStatus.init,
  });

  HotelState copyWith({
    HotelModel? hotel,
    ShowHotelStatus? showHotelStatus,
    BookingHotelStatus? bookingHotelStatus,
  }) {
    return HotelState(
      hotel: hotel ?? this.hotel,
      showHotelStatus: showHotelStatus ?? this.showHotelStatus,
      bookingHotelStatus: bookingHotelStatus ?? this.bookingHotelStatus,
    );
  }
}
