import 'dart:convert';

import 'show_restaurant_response.dart';

RestaurantsResponse resturantsResponseFromJson(String str) =>
    RestaurantsResponse.fromJson(json.decode(str));

String resturantsResponseToJson(RestaurantsResponse data) =>
    json.encode(data.toJson());

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

  factory RestaurantsResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantsResponse(
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

// class RestaurantModel {
//   int? id;
//   String? name;
//   String? about;
//   CityModel? city;

//   RestaurantModel({
//     this.id,
//     this.name,
//     this.about,
//     this.city,
//   });

//   RestaurantModel copyWith({
//     int? id,
//     String? name,
//     String? about,
//     CityModel? city,
//   }) =>
//       RestaurantModel(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         about: about ?? this.about,
//         city: city ?? this.city,
//       );

//   factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
//       RestaurantModel(
//         id: json["id"],
//         name: json["name"],
//         about: json["about"],
//         city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "about": about,
//         "city": city?.toJson(),
//       };
// }
