part of 'hotel_details_bloc.dart';

enum ShowHotelStatus { init, loading, succ, faild }

class HotelState {
  final HotelModel? hotel;
  final ShowHotelStatus showHotelStatus;
  const HotelState({
    this.hotel,
    this.showHotelStatus = ShowHotelStatus.init,
  });

  HotelState copyWith({
    HotelModel? hotel,
    ShowHotelStatus? showHotelStatus,
  }) {
    return HotelState(
      hotel: hotel ?? this.hotel,
      showHotelStatus: showHotelStatus ?? this.showHotelStatus,
    );
  }
}
