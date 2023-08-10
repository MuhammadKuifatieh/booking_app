import 'package:booking_app/core/models/no_response_model.dart';

import '../../../../core/config/typedef.dart';
import '../../data/models/restaurant_response.dart';
import '../../data/models/show_restaurant_response.dart';

abstract class RestaurantRepository {
  DataResponse<RestaurantsResponse> getRestaurants(QueryParams params);

  DataResponse<ShowRestaurantResponse> showRestaurant(int restaurantId);

  DataResponse<NoResponse> bookingHotel(BodyMap body);
}
