import 'dart:convert';

import '../../../../core/models/restaurant_model.dart';

RestaurantsResponse restaurantsResponseFromJson(String str) =>
    RestaurantsResponse.fromJson(json.decode(str));

String restaurantsResponseToJson(RestaurantsResponse data) => json.encode(data.toJson());

class RestaurantsResponse {
  bool? success;
  String? message;
  Data? data;

  RestaurantsResponse({
    this.success,
    this.message,
    this.data,
  });

  RestaurantsResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      RestaurantsResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RestaurantsResponse.fromJson(Map<String, dynamic> json) => RestaurantsResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<RestaurantModel>? restaurants;

  Data({
    this.restaurants,
  });

  Data copyWith({
    List<RestaurantModel>? restaurants,
  }) =>
      Data(
        restaurants: restaurants ?? this.restaurants,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        restaurants: json["restaurants"] == null
            ? []
            : List<RestaurantModel>.from(
                json["restaurants"]!.map((x) => RestaurantModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurants": restaurants == null
            ? []
            : List<dynamic>.from(restaurants!.map((x) => x.toJson())),
      };
}
