import '../../../../core/config/typedef.dart';
import '../../data/models/cities_response.dart';

abstract class CityRepository {
  DataResponse<CitiesResponse> getCities({QueryParams? params});
}
