import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../../../../core/unified_api/post_api.dart';
import '../models/car_office_booking_owner_response.dart';
import '../models/clinic_booking_owner_response.dart';
import '../models/hotel_booking_owner_response.dart';
import '../models/restaurant_booking_owner_response.dart';

class RemoteOwnerBookingDataSource {
  Future<CarBookingOwnerResponse> getCarOfficeOrders(int carOfficeId) async {
    final GetApi getApi = GetApi(
        uri: ApiVariables.getOwnerCarOfficeOrder(carOfficeId),
        fromJson: carBookingOwnerResponseFromJson);
    final result = await getApi.callRequest();
    return result;
  }

  Future<NoResponse> rejectOwnerCarOfficeOrder(int carOfficeId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.rejectOwnerCarOfficeOrder(carOfficeId),
      body: {},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<NoResponse> acceptOwnerCarOfficeOrder(int carOfficeId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.acceptOwnerCarOfficeOrder(carOfficeId),
      body: {
        "car_number": "test",
        "color": "test",
        "manufacture_company": "test",
      },
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<ClinicBookingOwnerResponse> getClinicsOrders(int clinicId) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getOwnerClinicOrder(clinicId),
      fromJson: clinicBookingOwnerResponseFromJson,
    );
    final resutl = await getApi.callRequest();
    return resutl;
  }

  Future<NoResponse> rejectOwnerClinicOrder(int clinicId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.rejectOwnerClinicOrder(clinicId),
      body: {},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<NoResponse> acceptOwnerClinicOrder(int clinicId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.acceptOwnerClinicOrder(clinicId),
      body: {"clinic_visit_type": "3", "case_description": "test"},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<HotelBookingOwnerResponse> getHotelOrders(int hotelId) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getOwnerHotelOrder(hotelId),
      fromJson: hotelBookingOwnerResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<NoResponse> rejectOwnerHotelOrder(int hotelId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.rejectOwnerHotelOrder(hotelId),
      body: {},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<NoResponse> acceptOwnerHotelOrder(int hotelId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.acceptOwnerHotelOrder(hotelId),
      body: {"room_number": "1231"},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<RestauratBookingOwnerResponse> getRestaurantOrders(
      int restaurantId) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getOwnerRestaurantOrder(restaurantId),
      fromJson: restauratBookingOwnerResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<NoResponse> rejectOwnerRestaurantOrder(int restaurantId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.rejectOwnerRestaurantOrder(restaurantId),
      body: {},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }

  Future<NoResponse> acceptOwnerRestaurantOrder(int restaurantId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.acceptOwnerRestaurantOrder(restaurantId),
      body: {"table_number": "1"},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
