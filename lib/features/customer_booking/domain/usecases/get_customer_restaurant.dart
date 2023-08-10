import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/restaurant_booking_customer_response.dart';
import '../repositories/customer_booking_repository.dart';

class GetCustomerRestaurant
    implements UseCase<RestaurantBookingCustomerResponse, NoParams> {
  final CustomerBookingRepository customerBookingRepository;

  GetCustomerRestaurant(this.customerBookingRepository);
  @override
  DataResponse<RestaurantBookingCustomerResponse> call(NoParams params) async {
    return customerBookingRepository.getCustomerRestaurantBooking();
  }
}
