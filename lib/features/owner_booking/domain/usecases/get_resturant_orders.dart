import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/restaurant_booking_owner_response.dart';
import '../repositories/owner_booking_repository.dart';

class GetRestaurantOrders
    implements
        UseCase<RestauratBookingOwnerResponse, GetRestaurantOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  GetRestaurantOrders(this.ownerBookingRepository);

  @override
  DataResponse<RestauratBookingOwnerResponse> call(
      GetRestaurantOrdersParams params) async {
    return ownerBookingRepository.getRestaurantOrders(params.restaurantId);
  }
}

class GetRestaurantOrdersParams with Params {
  final int restaurantId;

  GetRestaurantOrdersParams({required this.restaurantId});
}
