import 'package:booking_app/core/models/no_response_model.dart';
import 'package:booking_app/core/unified_api/post_api.dart';

import '../../../../core/config/typedef.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/hotels_response.dart';
import '../models/show_hotel_response.dart';

class RemoteHotelDataSource {
  Future<HotelsResponse> getHotels(QueryParams params) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getHotels(params: params),
      fromJson: hotelsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<ShowHotelResponse> showHotel(int hotelId) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.showHotel(hotelId: hotelId),
      fromJson: showHotelResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<NoResponse> bookingHotel(BodyMap body) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.bookingHotel(),
      body: body,
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
