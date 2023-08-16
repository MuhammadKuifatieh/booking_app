import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../data/models/car_office_booking_owner_response.dart';
import '../../data/models/clinic_booking_owner_response.dart';
import '../../data/models/hotel_booking_owner_response.dart';
import '../../data/models/restaurant_booking_owner_response.dart';

abstract class OwnerBookingRepository {
  DataResponse<CarBookingOwnerResponse> getCarOfficeOrders(int carOfficeId);

  DataResponse<NoResponse> rejectOwnerCarOfficeOrder(int carOfficeId);

  DataResponse<NoResponse> acceptOwnerCarOfficeOrder(int carOfficeId);

  DataResponse<ClinicBookingOwnerResponse> getClinicsOrders(int clinicId);

  DataResponse<NoResponse> rejectOwnerClinicOrder(int clinicId);

  DataResponse<NoResponse> acceptOwnerClinicOrder(int clinicId);

  DataResponse<HotelBookingOwnerResponse> getHotelOrders(int hotelId);

  DataResponse<NoResponse> rejectOwnerHotelOrder(int hotelId);

  DataResponse<NoResponse> acceptOwnerHotelOrder(int hotelId);

  DataResponse<RestauratBookingOwnerResponse> getRestaurantOrders(
      int restaurantId);

  DataResponse<NoResponse> rejectOwnerRestaurantOrder(int restaurantId);

  DataResponse<NoResponse> acceptOwnerRestaurantOrder(int restaurantId);
}
