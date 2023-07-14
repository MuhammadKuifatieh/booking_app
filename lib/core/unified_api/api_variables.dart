import 'dart:developer';

import 'package:booking_app/core/config/typedef.dart';

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
        path: 'mobile/$path',
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
}
