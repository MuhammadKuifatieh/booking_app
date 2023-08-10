import '../../../../core/config/typedef.dart';
import '../../../clinic/data/models/clinics_response.dart';
import '../../../hotel/data/models/hotels_response.dart';
import '../../../resturant/data/models/restaurant_response.dart';

abstract class HomeRepository {
  DataResponse<ClinicsResponse> getClinicsMostVisit(QueryParams params);

  DataResponse<HotelsResponse> getHotelMostPopular(QueryParams params);

  DataResponse<HotelsResponse> getHotelLastAdd(QueryParams params);

  DataResponse<RestaurantsResponse> getRestaurantsMostFavorite(
      QueryParams params);
}
