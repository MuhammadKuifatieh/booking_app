import 'dart:convert';

import '../../../splash/data/models/cities_response.dart';

ShowHotelResponse showHotelResponseFromJson(String str) =>
    ShowHotelResponse.fromJson(json.decode(str));

String showHotelResponseToJson(ShowHotelResponse data) =>
    json.encode(data.toJson());

class ShowHotelResponse {
  bool? success;
  String? message;
  Data? data;

  ShowHotelResponse({
    this.success,
    this.message,
    this.data,
  });

  ShowHotelResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ShowHotelResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ShowHotelResponse.fromJson(Map<String, dynamic> json) =>
      ShowHotelResponse(
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
  HotelModel? hotel;

  Data({
    this.hotel,
  });

  Data copyWith({
    HotelModel? hotel,
  }) =>
      Data(
        hotel: hotel ?? this.hotel,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hotel: json["hotel"] == null ? null : HotelModel.fromJson(json["hotel"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel": hotel?.toJson(),
      };
}

class HotelModel {
  int? id;
  String? name;
  String? about;
  CityModel? city;
  List<RoomTypeModel>? roomTypes;

  HotelModel({
    this.id,
    this.name,
    this.about,
    this.city,
    this.roomTypes,
  });

  HotelModel copyWith({
    int? id,
    String? name,
    String? about,
    CityModel? city,
    List<RoomTypeModel>? roomTypes,
  }) =>
      HotelModel(
        id: id ?? this.id,
        name: name ?? this.name,
        about: about ?? this.about,
        city: city ?? this.city,
        roomTypes: roomTypes ?? this.roomTypes,
      );

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
        roomTypes: json["room_types"] == null
            ? []
            : List<RoomTypeModel>.from(
                json["room_types"]!.map((x) => RoomTypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "city": city?.toJson(),
        "room_types": roomTypes == null
            ? []
            : List<dynamic>.from(roomTypes!.map((x) => x.toJson())),
      };
}

class RoomTypeModel {
  int? id;
  String? name;

  RoomTypeModel({
    this.id,
    this.name,
  });

  RoomTypeModel copyWith({
    int? id,
    String? name,
  }) =>
      RoomTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory RoomTypeModel.fromJson(Map<String, dynamic> json) => RoomTypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
