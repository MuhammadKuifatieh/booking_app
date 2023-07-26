import 'dart:convert';

import '../../../splash/data/models/cities_response.dart';

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

class RestaurantModel {
  int? id;
  String? name;
  String? about;
  Admin? admin;
  CityModel? city;
  List<TableTypesModel>? tableTypes;

  RestaurantModel({
    this.id,
    this.name,
    this.about,
    this.admin,
    this.city,
    this.tableTypes,
  });

  RestaurantModel copyWith({
    int? id,
    String? name,
    String? about,
    Admin? admin,
    CityModel? city,
    List<TableTypesModel>? tableTypes,
  }) =>
      RestaurantModel(
        id: id ?? this.id,
        name: name ?? this.name,
        about: about ?? this.about,
        admin: admin ?? this.admin,
        city: city ?? this.city,
        tableTypes: tableTypes ?? this.tableTypes,
      );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
        tableTypes: json["table_types"] == null
            ? []
            : List<TableTypesModel>.from(
                json["table_types"]!.map((x) => TableTypesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "admin": admin?.toJson(),
        "city": city?.toJson(),
        "table_types": tableTypes == null
            ? []
            : List<dynamic>.from(tableTypes!.map((x) => x.toJson())),
      };
}

class Admin {
  int? id;
  String? name;
  String? username;

  Admin({
    this.id,
    this.name,
    this.username,
  });

  Admin copyWith({
    int? id,
    String? name,
    String? username,
  }) =>
      Admin(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
      );

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json["id"],
        name: json["name"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
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
