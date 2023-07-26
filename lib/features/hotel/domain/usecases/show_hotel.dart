import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/show_hotel_response.dart';
import '../repositories/hotel_repository.dart';

class ShowHotel implements UseCase<ShowHotelResponse, ShowHotelParams> {
  final HotelRepository hotelRepository;

  ShowHotel(this.hotelRepository);

  @override
  DataResponse<ShowHotelResponse> call(ShowHotelParams params) async {
    return hotelRepository.showHotel(params.hotelId);
  }
}

class ShowHotelParams with Params {
  final int hotelId;

  ShowHotelParams({required this.hotelId});
}
