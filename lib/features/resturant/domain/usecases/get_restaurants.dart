import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/restaurant_response.dart';
import '../repositories/restaurant_repository.dart';

class GetRestaurants
    implements UseCase<RestaurantsResponse, GetRestaurantsParams> {
  final RestaurantRepository restaurantRepository;

  GetRestaurants(this.restaurantRepository);
   @override
  DataResponse<RestaurantsResponse> call(GetRestaurantsParams params) async {
    return restaurantRepository.getRestaurants(params.getParams());
  }
 
}

class GetRestaurantsParams with Params {
  final int? page;
  final int? perPage;
  final String? name;
  final int? cityId;

  GetRestaurantsParams({
    this.page,
    this.perPage,
    this.name,
    this.cityId,
  });
  @override
  QueryParams getParams() => {
        if (page != null) "page": page.toString(),
        if (perPage != null) "perPage": perPage.toString(),
        if (cityId != null) "filter[city_id]": cityId.toString(),
        if (name != null) "filter[name]": name.toString(),
      };
}
