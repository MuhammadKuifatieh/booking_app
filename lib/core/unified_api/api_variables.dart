import 'dart:developer';

import '../config/typedef.dart';

class ApiVariables {
  /////////////
  ///General///
  /////////////
  static const _scheme = 'https';
  static const _host = "booking.mohamad-rasoul.website";
  // final _host = '192.168.243.1';
  // final _port = 5000;

  static Uri _mainUri({
    required String path,
    QueryParams? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      // port: _port,
      path: 'api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString());
    return uri;
  }

  static Uri uploadMedia() => _mainUri(path: 'mediaUpload');

  static Uri _userUri({required String path, QueryParams? queryParameters}) =>
      _mainUri(
        path: 'user/$path',
        queryParameters: queryParameters,
      );

  ///Auth///
  static Uri _auth({required String path, QueryParams? params}) => _mainUri(
        path: "auth/user/$path",
        queryParameters: params,
      );

  static Uri login() => _auth(path: "login");

  static Uri register() => _auth(path: "register");

  static Uri logout() => _auth(path: "logout");

  ///city///

  static Uri getCities({QueryParams? params}) => _userUri(
        path: "city",
        queryParameters: params,
      );
  ///////////
  ///Hotel///
  ///////////

  static Uri _hotel({required String path, QueryParams? params}) => _userUri(
        path: "hotel/$path",
        queryParameters: params,
      );
  static Uri getHotels({QueryParams? params}) => _userUri(
        path: "hotel",
        queryParameters: params,
      );
  static Uri showHotel({required int hotelId}) => _hotel(
        path: "$hotelId",
      );
  static Uri bookingHotel() => _hotel(path: "booking/customer");
  ///////////
  ///clinc///
  //////////

  static Uri _clinc({required String path, QueryParams? params}) => _userUri(
        path: "clinic/$path",
        queryParameters: params,
      );
  static Uri getclinicSpecialization() => _clinc(path: "specialization");

  static Uri getClinics(QueryParams params) => _userUri(
        path: "clinic",
        queryParameters: params,
      );

  static Uri showClinic(int clinicId) => _clinc(path: "$clinicId");

  static Uri bookingClinic() => _clinc(path: 'booking/customer');
  ////////////////
  ///restaurant///
  ///////////////

  static Uri _restaurant({required String path, QueryParams? params}) =>
      _userUri(
        path: "restaurant/$path",
        queryParameters: params,
      );

  static Uri getRestaurants({QueryParams? params}) => _userUri(
        path: "restaurant",
        queryParameters: params,
      );

  static Uri showRestuarant({required int restaurantId}) => _restaurant(
        path: "$restaurantId",
      );

  static Uri bookingRestaurant() => _restaurant(path: "booking/customer");
  ////////////////
  ///carOffices///
  ///////////////
  static Uri _carOffice({required String path, QueryParams? params}) =>
      _userUri(
        path: "carOffice/$path",
        queryParameters: params,
      );
  static Uri getCarOffices(QueryParams? params) => _userUri(
        path: "carOffice",
        queryParameters: params,
      );
  static Uri showCarOffice(int carOfficeId) => _carOffice(
        path: "$carOfficeId",
      );
  static Uri bookingCarOffice() => _carOffice(path: "booking/customer");
  //////////////
  ///favorite///
  /////////////

  static Uri toggleFavorite(int modelId, int modelType) => _userUri(
        path: "favorite/$modelType/model/$modelId/modelNumber/assignFavorite",
      );
  static Uri _favorite({required String path, QueryParams? params}) => _userUri(
        path: "favorite/$path",
        queryParameters: params,
      );

  static Uri getFavoriteRestaurant(QueryParams? params) => _favorite(
        path: "getRestaurantFavorites",
        params: params,
      );

  static Uri getFavoriteHotels(QueryParams? params) => _favorite(
        path: "getHotelFavorites",
        params: params,
      );

  static Uri getFavoriteCarOffices(QueryParams? params) => _favorite(
        path: "getCarOfficeFavorites",
        params: params,
      );

  static Uri getFavoriteClinic(QueryParams? params) => _favorite(
        path: "getClinicFavorites",
        params: params,
      );

  //////////////////////
  ///Cutsomer Booking///
  /////////////////////
  static Uri _customerBooking(String path) => _userUri(
        path: "$path/booking/customer",
      );

  static Uri customerCarOfficeBooking() => _customerBooking("carOffice");

  static Uri customerRestaurantBooking() => _customerBooking("restaurant");

  static Uri customerHotelBooking() => _customerBooking("hotel");

  static Uri customerClinicBooking() => _customerBooking("clinic");

  ///////////////////
  ///Owner Booking///
  //////////////////

  static Uri _restuarantOwner({required String path, QueryParams? params}) =>
      _userUri(
        path: "restaurant/booking/owner/restaurantBooking/$path",
        queryParameters: params,
      );
  static Uri getOwnerRestaurantOrder(int restaurantId) =>
      _userUri(path: "restaurant/booking/owner/restaurant/$restaurantId/index");

  static Uri acceptOwnerRestaurantOrder(int restaurantId) =>
      _restuarantOwner(path: "$restaurantId/accept");

  static Uri rejectOwnerRestaurantOrder(int restaurantId) =>
      _restuarantOwner(path: "$restaurantId/reject");

  static Uri _hotelOwner({required String path, QueryParams? params}) =>
      _userUri(
        path: "hotel/booking/owner/hotelBooking/$path",
        queryParameters: params,
      );
  static Uri getOwnerHotelOrder(int hotelId) =>
      _userUri(path: "hotel/booking/owner/hotel/$hotelId/index");

  static Uri acceptOwnerHotelOrder(int hotelId) =>
      _hotelOwner(path: "$hotelId/accept");

  static Uri rejectOwnerHotelOrder(int hotelId) =>
      _hotelOwner(path: "$hotelId/reject");

  static Uri _carOfficeOwner({required String path, QueryParams? params}) =>
      _userUri(
        path: "carOffice/booking/owner/carBooking/$path",
        queryParameters: params,
      );
  static Uri getOwnerCarOfficeOrder(int carOfficeId) =>
      _userUri(path: "carOffice/booking/owner/carOffice/$carOfficeId/index");

  static Uri acceptOwnerCarOfficeOrder(int carOfficeId) =>
      _carOfficeOwner(path: "$carOfficeId/accept");

  static Uri rejectOwnerCarOfficeOrder(int carOfficeId) =>
      _carOfficeOwner(path: "$carOfficeId/reject");

  static Uri _clinicOwner({required String path, QueryParams? params}) =>
      _userUri(
        path: "clinic/booking/owner/clinicBooking/$path",
        queryParameters: params,
      );
  static Uri getOwnerClinicOrder(int clinicId) =>
      _userUri(path: "clinic/booking/owner/clinic/$clinicId/index");

  static Uri acceptOwnerClinicOrder(int clinicId) =>
      _clinicOwner(path: "$clinicId/accept");

  static Uri rejectOwnerClinicOrder(int clinicId) =>
      _clinicOwner(path: "$clinicId/reject");
}
