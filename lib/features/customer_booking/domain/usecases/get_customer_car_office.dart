import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/car_office_booking_customer_response.dart';
import '../repositories/customer_booking_repository.dart';

class GetCustomerCarOffice
    implements UseCase<CarBookingCustomerResponse, NoParams> {
  final CustomerBookingRepository customerBookingRepository;

  GetCustomerCarOffice(this.customerBookingRepository);
  @override
  DataResponse<CarBookingCustomerResponse> call(NoParams params) async {
    return customerBookingRepository.getCustomerCarOfficesBooking();
  }
}
