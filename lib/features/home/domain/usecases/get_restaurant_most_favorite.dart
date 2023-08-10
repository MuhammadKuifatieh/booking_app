import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../resturant/data/models/restaurant_response.dart';
import '../repositories/home_respository.dart';

class GetRestaurantsMostFavorite
    implements UseCase<RestaurantsResponse, GetRestaurantsMostFavoriteParams> {
  final HomeRepository homeRepository;

  GetRestaurantsMostFavorite(this.homeRepository);
  @override
  DataResponse<RestaurantsResponse> call(
      GetRestaurantsMostFavoriteParams params) async {
    return homeRepository.getRestaurantsMostFavorite(params.getParams());
  }
}

class GetRestaurantsMostFavoriteParams with Params {
  final int page;
  final int perPage;

  GetRestaurantsMostFavoriteParams({
    required this.page,
    required this.perPage,
  });
  @override
  QueryParams getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
