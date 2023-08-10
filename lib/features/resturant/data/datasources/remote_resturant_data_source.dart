import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../../../../core/unified_api/post_api.dart';
import '../models/restaurant_response.dart';
import '../models/show_restaurant_response.dart';

class RemoteRestaurantDataSource {
  Future<RestaurantsResponse> getRestaurants(QueryParams params) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getRestaurants(params: params),
      fromJson: restaurantsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<ShowRestaurantResponse> showRestaurant(int restaurantId) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.showRestuarant(restaurantId: restaurantId),
      fromJson: showRestaurantResponseFromJson,
    );
    final restult = await getApi.callRequest();
    return restult;
  }

  Future<NoResponse> bookingRestaurant(BodyMap body) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.bookingRestaurant(),
      body: body,
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
