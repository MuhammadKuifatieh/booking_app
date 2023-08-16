import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/owner_booking_repository.dart';
import 'get_resturant_orders.dart';

class AcceptRestaurantOrder
    implements UseCase<NoResponse, GetRestaurantOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  AcceptRestaurantOrder(this.ownerBookingRepository);

  @override
  DataResponse<NoResponse> call(GetRestaurantOrdersParams params) async {
    return ownerBookingRepository.acceptOwnerRestaurantOrder(params.restaurantId);
  }
}
