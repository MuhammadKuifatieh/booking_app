import 'package:booking_app/core/models/no_response_model.dart';

import '../../../../core/config/typedef.dart';
import '../../data/models/hotels_response.dart';
import '../../data/models/show_hotel_response.dart';

abstract class HotelRepository {
  DataResponse<HotelsResponse> getHotels(QueryParams params);

  DataResponse<ShowHotelResponse> showHotel(int hotelId);

  DataResponse<NoResponse> bookingHotel(BodyMap body);
}
