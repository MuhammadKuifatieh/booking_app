import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/clinic_booking_owner_response.dart';
import '../repositories/owner_booking_repository.dart';

class GetClinicOrders
    implements UseCase<ClinicBookingOwnerResponse, GetClinicOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  GetClinicOrders(this.ownerBookingRepository);

  @override
  DataResponse<ClinicBookingOwnerResponse> call(
      GetClinicOrdersParams params) async {
    return ownerBookingRepository.getClinicsOrders(params.clinicId);
  }
}

class GetClinicOrdersParams with Params {
  final int clinicId;

  GetClinicOrdersParams({required this.clinicId});
}
