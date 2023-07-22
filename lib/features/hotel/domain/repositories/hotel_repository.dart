import '../../../../core/config/typedef.dart';
import '../../data/models/hotels_response.dart';
import '../../data/models/show_hotel_response.dart';

abstract class HotelRepository {
  DataResponse<HotelsResponse> getHotels(QueryParams params);

  DataResponse<ShowHotelResponse> showHotel(int hotelId);
}
