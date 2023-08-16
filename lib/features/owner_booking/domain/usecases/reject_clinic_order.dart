import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/owner_booking_repository.dart';
import 'get_clinic_orders.dart';

class RejectClinicOrder
    implements UseCase<NoResponse, GetClinicOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  RejectClinicOrder(this.ownerBookingRepository);

  @override
  DataResponse<NoResponse> call(GetClinicOrdersParams params) async {
    return ownerBookingRepository.rejectOwnerClinicOrder(params.clinicId);
  }
}
