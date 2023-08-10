import '../../../../core/config/typedef.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../../../clinic/data/models/clinics_response.dart';
import '../../../hotel/data/models/hotels_response.dart';
import '../../../resturant/data/models/restaurant_response.dart';

class RemoteHomeDataSource {
  Future<ClinicsResponse> getClinicsMostVisit(QueryParams params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getClinics(params),
      fromJson: clinicsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<HotelsResponse> getHotelMostPopular(QueryParams params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getHotels(params: params),
      fromJson: hotelsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<HotelsResponse> getHotelLastAdd(QueryParams params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getHotels(params: params),
      fromJson: hotelsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<RestaurantsResponse> getRestaurantsMostFavorite(
      QueryParams params) async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getRestaurants(params: params),
      fromJson: restaurantsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
