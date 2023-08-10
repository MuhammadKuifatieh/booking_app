import '../../../../core/config/typedef.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domain/repositories/customer_booking_repository.dart';
import '../datasources/remote_customer_booking.dart';
import '../models/car_office_booking_customer_response.dart';
import '../models/clinic_booking_customer_response.dart';
import '../models/hotel_booking_customer_response.dart';
import '../models/restaurant_booking_customer_response.dart';

class CustomerBookingRepositoryImplment
    with HandlingExceptionManager
    implements CustomerBookingRepository {
  final _remoteCutsomerBooking = RemoteCustomerBookingDataSource();
  @override
  DataResponse<CarBookingCustomerResponse>
      getCustomerCarOfficesBooking() async {
    return wrapHandling(tryCall: () async {
      final result =
          await _remoteCutsomerBooking.getCustomerCarOfficesBooking();
      return result;
    });
  }

  @override
  DataResponse<ClinicBookingCustomerResponse> getCustomerClinicBooking() async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteCutsomerBooking.getCustomerClinicsBooking();
      return result;
    });
  }

  @override
  DataResponse<HotelBookingCustomerResponse> getCustomerHotelBooking() {
    return wrapHandling(tryCall: () async {
      final result = await _remoteCutsomerBooking.getCustomerHotelBooking();
      return result;
    });
  }

  @override
  DataResponse<RestaurantBookingCustomerResponse>
      getCustomerRestaurantBooking() async {
    return wrapHandling(tryCall: () async {
      final result =
          await _remoteCutsomerBooking.getCustomerRestaurantBooking();
      return result;
    });
  }
}
