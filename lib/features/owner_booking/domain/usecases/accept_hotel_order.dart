import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/owner_booking_repository.dart';
import 'get_hotel_orders.dart';

class AcceptHotelOrder
    implements UseCase<NoResponse, GetHotelOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  AcceptHotelOrder(this.ownerBookingRepository);

  @override
  DataResponse<NoResponse> call(GetHotelOrdersParams params) async {
    return ownerBookingRepository.acceptOwnerHotelOrder(params.hotelId);
  }
}
