import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/hotel_booking_owner_response.dart';
import '../repositories/owner_booking_repository.dart';

class GetHotelOrders
    implements UseCase<HotelBookingOwnerResponse, GetHotelOrdersParams> {
  final OwnerBookingRepository ownerBookingRepository;

  GetHotelOrders(this.ownerBookingRepository);

  @override
  DataResponse<HotelBookingOwnerResponse> call(
      GetHotelOrdersParams params) async {
    return ownerBookingRepository.getHotelOrders(params.hotelId);
  }
}

class GetHotelOrdersParams with Params {
  final int hotelId;

  GetHotelOrdersParams({required this.hotelId});
}
