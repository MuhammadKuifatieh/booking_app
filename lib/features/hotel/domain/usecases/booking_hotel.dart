import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/hotel_repository.dart';

class BookingHotel implements UseCase<NoResponse, BookingHotelParams> {
  final HotelRepository hotelRepository;

  BookingHotel(this.hotelRepository);
  @override
  DataResponse<NoResponse> call(BookingHotelParams params) async {
    return hotelRepository.bookingHotel(params.getBody());
  }
}

class BookingHotelParams with Params {
  final int hotelId;
  final int roomTypeId;
  final String bookingDate;
  final String bookingDaysCount;

  BookingHotelParams({
    required this.hotelId,
    required this.roomTypeId,
    required this.bookingDate,
    required this.bookingDaysCount,
  });

  @override
  BodyMap getBody() => {
        "hotel_id": hotelId,
        "room_type_id": roomTypeId,
        "escorts_number": bookingDaysCount,
        "booking_datetime": bookingDate,
      };
}
