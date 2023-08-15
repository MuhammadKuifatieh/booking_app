import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../resturant/data/models/restaurant_response.dart';
import '../repositories/get_favorite_repository.dart';

class GetFavoriteRestaurants implements UseCase<RestaurantsResponse, NoParams> {
  final GetFavoriteRepository getFavoriteRepository;

  GetFavoriteRestaurants(this.getFavoriteRepository);

  @override
  DataResponse<RestaurantsResponse> call(NoParams params) async {
    return getFavoriteRepository.getRestaurants(params.getParams());
  }
}
