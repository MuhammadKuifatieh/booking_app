import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/clinic_booking_customer_response.dart';
import '../repositories/customer_booking_repository.dart';

class GetCustomerClinic
    implements UseCase<ClinicBookingCustomerResponse, NoParams> {
  final CustomerBookingRepository customerBookingRepository;

  GetCustomerClinic(this.customerBookingRepository);
  @override
  DataResponse<ClinicBookingCustomerResponse> call(NoParams params) async {
    return customerBookingRepository.getCustomerClinicBooking();
  }
}
