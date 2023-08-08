import 'dart:convert';

import 'city_model.dart';
import 'image_model.dart';
import 'place_model.dart';
import 'user_model.dart';

RestaurantModel restaurantModelFromJson(String str) =>
    RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) =>
    json.encode(data.toJson());

class RestaurantModel {
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
  List<TableTypeModel>? tableTypes;

  RestaurantModel({
    this.id,
    this.name,
    this.about,
    this.favoriteCount,
    this.isFavorite,
    this.visitCount,
    this.image,
    this.placeContact,
    this.user,
    this.city,
    this.tableTypes,
  });

  RestaurantModel copyWith({
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
    List<TableTypeModel>? tableTypes,
  }) =>
      RestaurantModel(
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
        tableTypes: tableTypes ?? this.tableTypes,
      );

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
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
        tableTypes: json["table_types"] == null
            ? []
            : List<TableTypeModel>.from(
                json["table_types"]!.map((x) => TableTypeModel.fromJson(x))),
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
        "table_types": tableTypes == null
            ? []
            : List<dynamic>.from(tableTypes!.map((x) => x.toJson())),
      };
}

class TableTypeModel {
  int? id;
  String? name;

  TableTypeModel({
    this.id,
    this.name,
  });

  TableTypeModel copyWith({
    int? id,
    String? name,
  }) =>
      TableTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory TableTypeModel.fromJson(Map<String, dynamic> json) => TableTypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
