import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/car_office_booking_owner_response.dart';
import '../repositories/owner_booking_repository.dart';

class GetCarOfficeOrders
    implements UseCase<CarBookingOwnerResponse, GetCarOfficeOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  GetCarOfficeOrders(this.ownerBookingRepository);

  @override
  DataResponse<CarBookingOwnerResponse> call(
      GetCarOfficeOrdersParams params) async {
    return ownerBookingRepository.getCarOfficeOrders(params.carOfficeId);
  }
}

class GetCarOfficeOrdersParams with Params {
  final int carOfficeId;

  GetCarOfficeOrdersParams({required this.carOfficeId});
}
