import '../../../../core/config/typedef.dart';
import '../../data/models/car_office_booking_customer_response.dart';
import '../../data/models/clinic_booking_customer_response.dart';
import '../../data/models/hotel_booking_customer_response.dart';
import '../../data/models/restaurant_booking_customer_response.dart';

abstract class CustomerBookingRepository {
  DataResponse<CarBookingCustomerResponse> getCustomerCarOfficesBooking();

  DataResponse<RestaurantBookingCustomerResponse>
      getCustomerRestaurantBooking();

  DataResponse<HotelBookingCustomerResponse> getCustomerHotelBooking();

  DataResponse<ClinicBookingCustomerResponse> getCustomerClinicBooking();
}
