import '../../../../core/config/typedef.dart';
import '../../data/models/restaurant_response.dart';
import '../../data/models/show_restaurant_response.dart';

abstract class RestaurantRepository {
  DataResponse<RestaurantsResponse> getRestaurants(QueryParams params);

  DataResponse<ShowRestaurantResponse> showRestaurant(int restaurantId);
}
