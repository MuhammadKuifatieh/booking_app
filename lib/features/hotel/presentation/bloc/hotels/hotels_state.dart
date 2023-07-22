part of 'hotels_bloc.dart';

enum GetHotelsStataus { init, loading, succ, failed }

class HotelsState {
  final bool isEndPage;
  final List<HotelModel> hotels;
  final GetHotelsStataus getHotelsStataus;

  const HotelsState({
    this.isEndPage = false,
    this.hotels = const [],
    this.getHotelsStataus = GetHotelsStataus.init,
  });

  HotelsState copyWith({
    bool? isEndPage,
    List<HotelModel>? hotels,
    GetHotelsStataus? getHotelsStataus,
  }) {
    return HotelsState(
      isEndPage: isEndPage ?? this.isEndPage,
      hotels: hotels ?? this.hotels,
      getHotelsStataus: getHotelsStataus ?? this.getHotelsStataus,
    );
  }
}
