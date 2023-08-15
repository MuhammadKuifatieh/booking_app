import 'package:booking_app/core/config/typedef.dart';
import 'package:booking_app/features/car_office/data/models/car_offices_response.dart';
import 'package:booking_app/features/clinic/data/models/clinics_response.dart';
import 'package:booking_app/features/hotel/data/models/hotels_response.dart';
import 'package:booking_app/features/resturant/data/models/restaurant_response.dart';

abstract class GetFavoriteRepository {
  DataResponse<RestaurantsResponse> getRestaurants(QueryParams params);

  DataResponse<HotelsResponse> getHotels(QueryParams params);

  DataResponse<ClinicsResponse> getClinics(QueryParams params);

  DataResponse<CarOfficesResponse> getCarOffices(QueryParams params);
}
