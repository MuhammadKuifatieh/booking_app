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
}
