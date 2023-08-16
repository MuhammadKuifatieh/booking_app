import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/owner_booking_repository.dart';
import 'get_hotel_orders.dart';

class RejectHotelOrder implements UseCase<NoResponse, GetHotelOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  RejectHotelOrder(this.ownerBookingRepository);

  @override
  DataResponse<NoResponse> call(GetHotelOrdersParams params) async {
    return ownerBookingRepository.rejectOwnerHotelOrder(params.hotelId);
  }
}
