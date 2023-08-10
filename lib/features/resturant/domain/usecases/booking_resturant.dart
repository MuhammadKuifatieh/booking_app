import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/restaurant_repository.dart';

class BookingRestaurant
    implements UseCase<NoResponse, BookingRestaurantParams> {
  final RestaurantRepository restaurantRepository;

  BookingRestaurant(this.restaurantRepository);
  @override
  DataResponse<NoResponse> call(BookingRestaurantParams params) async {
    return restaurantRepository.bookingHotel(params.getBody());
  }
}

class BookingRestaurantParams with Params {
  final int restaurantId;
  final int tableTypeId;
  final String date;

  BookingRestaurantParams({
    required this.restaurantId,
    required this.tableTypeId,
    required this.date,
  });
  @override
  BodyMap getBody() => {
        "restaurant_id": restaurantId,
        "table_type_id": tableTypeId,
        "booking_datetime": date,
      };
}
