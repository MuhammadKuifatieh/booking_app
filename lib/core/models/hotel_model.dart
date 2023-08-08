// To parse this JSON data, do
//
//     final hotelModel = hotelModelFromJson(jsonString);

import 'dart:convert';

import 'package:booking_app/core/models/image_model.dart';
import 'package:booking_app/core/models/place_model.dart';
import 'package:booking_app/core/models/user_model.dart';

import 'city_model.dart';

HotelModel hotelModelFromJson(String str) =>
    HotelModel.fromJson(json.decode(str));

String hotelModelToJson(HotelModel data) => json.encode(data.toJson());

class HotelModel {
  int? id;
  String? name;
  dynamic about;
  int? favoriteCount;
  int? isFavorite;
  int? visitCount;
  ImageModel? image;
  PlaceContactModel? placeContact;
  UserModel? user;
  CityModel? city;
  List<RoomTypeModel>? roomTypes;

  HotelModel({
    this.id,
    this.name,
    this.about,
    this.isFavorite,
    this.favoriteCount,
    this.visitCount,
    this.image,
    this.placeContact,
    this.user,
    this.city,
    this.roomTypes,
  });

  HotelModel copyWith({
    int? id,
    String? name,
    dynamic about,
    int? favoriteCount,
    int? isFavorite,
    int? visitCount,
    ImageModel? image,
    PlaceContactModel? placeContact,
    UserModel? user,
    CityModel? city,
    List<RoomTypeModel>? roomTypes,
  }) =>
      HotelModel(
        id: id ?? this.id,
        name: name ?? this.name,
        about: about ?? this.about,
        favoriteCount: favoriteCount ?? this.favoriteCount,
        isFavorite: isFavorite ?? this.isFavorite,
        visitCount: visitCount ?? this.visitCount,
        image: image ?? this.image,
        placeContact: placeContact ?? this.placeContact,
        user: user ?? this.user,
        city: city ?? this.city,
        roomTypes: roomTypes ?? this.roomTypes,
      );

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        favoriteCount: json["favorite_count"],
        isFavorite: json["user_is_favorite"],
        visitCount: json["visit_count_total"],
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        placeContact: json["place_contact"] == null
            ? null
            : PlaceContactModel.fromJson(json["place_contact"]),
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
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
        "favorite_count": favoriteCount,
        "user_is_favorite": isFavorite,
        "visit_count_total": visitCount,
        "image": image?.toJson(),
        "place_contact": placeContact?.toJson(),
        "user": user?.toJson(),
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
