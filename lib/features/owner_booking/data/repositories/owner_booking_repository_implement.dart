import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domain/repositories/owner_booking_repository.dart';
import '../datasources/remote_owner_booking_data_source.dart';
import '../models/car_office_booking_owner_response.dart';
import '../models/clinic_booking_owner_response.dart';
import '../models/hotel_booking_owner_response.dart';
import '../models/restaurant_booking_owner_response.dart';

class OwnerBookingRepositoryImplements
    with HandlingExceptionManager
    implements OwnerBookingRepository {
  final _ownerBooking = RemoteOwnerBookingDataSource();
  @override
  DataResponse<NoResponse> acceptOwnerCarOfficeOrder(int carOfficeId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.acceptOwnerCarOfficeOrder(carOfficeId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> acceptOwnerClinicOrder(int clinicId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.acceptOwnerClinicOrder(clinicId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> acceptOwnerHotelOrder(int hotelId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.acceptOwnerHotelOrder(hotelId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> acceptOwnerRestaurantOrder(int restaurantId) async {
    return wrapHandling(tryCall: () async {
      final result =
          await _ownerBooking.acceptOwnerRestaurantOrder(restaurantId);
      return result;
    });
  }

  @override
  DataResponse<CarBookingOwnerResponse> getCarOfficeOrders(
      int carOfficeId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.getCarOfficeOrders(carOfficeId);
      return result;
    });
  }

  @override
  DataResponse<ClinicBookingOwnerResponse> getClinicsOrders(
      int clinicId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.getClinicsOrders(clinicId);
      return result;
    });
  }

  @override
  DataResponse<HotelBookingOwnerResponse> getHotelOrders(int hotelId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.getHotelOrders(hotelId);
      return result;
    });
  }

  @override
  DataResponse<RestauratBookingOwnerResponse> getRestaurantOrders(
      int restaurantId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.getRestaurantOrders(restaurantId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> rejectOwnerCarOfficeOrder(int carOfficeId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.rejectOwnerCarOfficeOrder(carOfficeId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> rejectOwnerClinicOrder(int clinicId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.rejectOwnerClinicOrder(clinicId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> rejectOwnerHotelOrder(int hotelId) async {
    return wrapHandling(tryCall: () async {
      final result = await _ownerBooking.rejectOwnerHotelOrder(hotelId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> rejectOwnerRestaurantOrder(int restaurantId) async {
    return wrapHandling(tryCall: () async {
      final result =
          await _ownerBooking.rejectOwnerRestaurantOrder(restaurantId);
      return result;
    });
  }
}
