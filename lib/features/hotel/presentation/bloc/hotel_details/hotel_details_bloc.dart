import 'package:bloc/bloc.dart';

import '../../../data/models/show_hotel_response.dart';
import '../../../data/repositories/hotel_repository_implement.dart';
import '../../../domain/usecases/show_hotel.dart';

part 'hotel_details_event.dart';
part 'hotel_details_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final _showHotel = ShowHotel(HotelRepositoryImplement());
  HotelBloc() : super(const HotelState()) {
    on<ShowHotelEvent>(_mapShowHotel);
  }
  Future<void> _mapShowHotel(
      ShowHotelEvent event, Emitter<HotelState> emit) async {
    emit(state.copyWith(showHotelStatus: ShowHotelStatus.loading));
    final result = await _showHotel(ShowHotelParams(hotelId: event.hotelId));
    result.fold(
      (l) => emit(state.copyWith(showHotelStatus: ShowHotelStatus.faild)),
      (r) => emit(state.copyWith(
        hotel: r.data!.hotel,
        showHotelStatus: ShowHotelStatus.succ,
      )),
    );
  }
}
