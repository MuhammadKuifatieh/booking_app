import 'package:booking_app/features/customer_booking/data/models/clinic_booking_customer_response.dart';
import 'package:booking_app/features/customer_booking/data/models/hotel_booking_customer_response.dart';
import 'package:booking_app/features/customer_booking/data/models/restaurant_booking_customer_response.dart';

import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/car_office_booking_customer_response.dart';

class RemoteCustomerBookingDataSource {
  Future<CarBookingCustomerResponse> getCustomerCarOfficesBooking() async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.customerCarOfficeBooking(),
      fromJson: carBookingCustomerFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<RestaurantBookingCustomerResponse>
      getCustomerRestaurantBooking() async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.customerRestaurantBooking(),
      fromJson: restaurantBookingCustomerFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<HotelBookingCustomerResponse> getCustomerHotelBooking() async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.customerHotelBooking(),
      fromJson: hotelBookingCustomerFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<ClinicBookingCustomerResponse> getCustomerClinicsBooking() async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.customerClinicBooking(),
      fromJson: clinicBookingCustomerFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
