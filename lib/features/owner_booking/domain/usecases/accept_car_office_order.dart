import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/owner_booking_repository.dart';
import 'get_car_office_orders.dart';

class AcceptCarOfficeOrder
    implements UseCase<NoResponse, GetCarOfficeOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  AcceptCarOfficeOrder(this.ownerBookingRepository);

  @override
  DataResponse<NoResponse> call(GetCarOfficeOrdersParams params) async {
    return ownerBookingRepository.acceptOwnerCarOfficeOrder(params.carOfficeId);
  }
}
