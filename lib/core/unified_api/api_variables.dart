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
}
