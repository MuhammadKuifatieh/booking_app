import 'dart:async';

import '../../../../core/config/typedef.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../../../car_office/data/models/car_offices_response.dart';
import '../../../clinic/data/models/clinics_response.dart';
import '../../../hotel/data/models/hotels_response.dart';
import '../../../resturant/data/models/restaurant_response.dart';

class RemoteGetFavoriteDataSource {
  Future<RestaurantsResponse> getRestaurants(QueryParams params) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getFavoriteRestaurant(params),
      fromJson: restaurantsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<HotelsResponse> getHotels(QueryParams params) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getFavoriteHotels(params),
      fromJson: hotelsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<ClinicsResponse> getClinics(QueryParams params) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getFavoriteClinic(params),
      fromJson: clinicsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<CarOfficesResponse> getCarOffices(QueryParams params) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getFavoriteCarOffices(params),
      fromJson: carOfficesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
