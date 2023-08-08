import 'dart:convert';

import '../../../../core/models/restaurant_model.dart';

ShowRestaurantResponse showRestaurantResponseFromJson(String str) =>
    ShowRestaurantResponse.fromJson(json.decode(str));

String showRestaurantResponseToJson(ShowRestaurantResponse data) =>
    json.encode(data.toJson());

class ShowRestaurantResponse {
  bool? success;
  String? message;
  Data? data;

  ShowRestaurantResponse({
    this.success,
    this.message,
    this.data,
  });

  ShowRestaurantResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ShowRestaurantResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ShowRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      ShowRestaurantResponse(
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
  RestaurantModel? restaurant;

  Data({
    this.restaurant,
  });

  Data copyWith({
    RestaurantModel? restaurant,
  }) =>
      Data(
        restaurant: restaurant ?? this.restaurant,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        restaurant: json["restaurant"] == null
            ? null
            : RestaurantModel.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "restaurant": restaurant?.toJson(),
      };
}

class TableTypesModel {
  int? id;
  String? name;

  TableTypesModel({
    this.id,
    this.name,
  });

  TableTypesModel copyWith({
    int? id,
    String? name,
  }) =>
      TableTypesModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory TableTypesModel.fromJson(Map<String, dynamic> json) =>
      TableTypesModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
