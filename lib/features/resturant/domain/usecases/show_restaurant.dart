import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/show_restaurant_response.dart';
import '../repositories/restaurant_repository.dart';

class ShowRestaurant
    implements UseCase<ShowRestaurantResponse, ShowRestaurantParams> {
  final RestaurantRepository restaurantRepository;

  ShowRestaurant(this.restaurantRepository);
  @override
  DataResponse<ShowRestaurantResponse> call(ShowRestaurantParams params) async {
    return restaurantRepository.showRestaurant(params.restaurantId);
  }
}

class ShowRestaurantParams with Params {
  final int restaurantId;

  ShowRestaurantParams({required this.restaurantId});
}
