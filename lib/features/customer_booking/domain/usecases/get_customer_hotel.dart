import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/hotel_booking_customer_response.dart';
import '../repositories/customer_booking_repository.dart';

class GetCustomerHotel
    implements UseCase<HotelBookingCustomerResponse, NoParams> {
  final CustomerBookingRepository customerBookingRepository;

  GetCustomerHotel(this.customerBookingRepository);
  @override
  DataResponse<HotelBookingCustomerResponse> call(NoParams params) async {
    return customerBookingRepository.getCustomerHotelBooking();
  }
}
