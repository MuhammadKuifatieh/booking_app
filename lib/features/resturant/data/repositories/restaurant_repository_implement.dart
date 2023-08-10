import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domain/repositories/restaurant_repository.dart';
import '../datasources/remote_resturant_data_source.dart';
import '../models/restaurant_response.dart';
import '../models/show_restaurant_response.dart';

class RestaurantRepositoryImplement
    with HandlingExceptionManager
    implements RestaurantRepository {
  final _remoteRestaurant = RemoteRestaurantDataSource();
  @override
  DataResponse<RestaurantsResponse> getRestaurants(QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteRestaurant.getRestaurants(params);
      return result;
    });
  }

  @override
  DataResponse<ShowRestaurantResponse> showRestaurant(int restaurantId) {
    return wrapHandling(tryCall: () async {
      final result = await _remoteRestaurant.showRestaurant(restaurantId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> bookingHotel(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteRestaurant.bookingRestaurant(body);
      return result;
    });
  }
}
