import 'city_model.dart';
import 'image_model.dart';
import 'place_model.dart';
import 'user_model.dart';

class CarOfficeModel {
  int? id;
  String? name;
  int? favoriteCount;
  int? isFavorite;
  int? visitCount;
  ImageModel? image;
  PlaceContactModel? placeContact;
  UserModel? user;
  CityModel? city;
  List<CarTypeModel>? carTypes;

  CarOfficeModel({
    this.id,
    this.name,
    this.favoriteCount,
    this.isFavorite,
    this.visitCount,
    this.image,
    this.placeContact,
    this.user,
    this.city,
    this.carTypes,
  });

  CarOfficeModel copyWith({
    int? id,
    String? name,
    int? favoriteCount,
    int? isFavorite,
    int? visitCount,
    ImageModel? image,
    PlaceContactModel? placeContact,
    UserModel? user,
    CityModel? city,
    List<CarTypeModel>? carTypes,
  }) =>
      CarOfficeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        favoriteCount: favoriteCount ?? this.favoriteCount,
        isFavorite: isFavorite ?? this.isFavorite,
        visitCount: visitCount ?? this.visitCount,
        image: image ?? this.image,
        placeContact: placeContact ?? this.placeContact,
        user: user ?? this.user,
        city: city ?? this.city,
        carTypes: carTypes ?? this.carTypes,
      );

  factory CarOfficeModel.fromJson(Map<String, dynamic> json) => CarOfficeModel(
        id: json["id"],
        name: json["name"],
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
        carTypes: json["car_types"] == null
            ? []
            : List<CarTypeModel>.from(
                json["car_types"]!.map((x) => CarTypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "favorite_count": favoriteCount,
        "user_is_favorite": isFavorite,
        "visit_count_total": visitCount,
        "image": image?.toJson(),
        "place_contact": placeContact?.toJson(),
        "user": user?.toJson(),
        "city": city?.toJson(),
        "car_types": carTypes == null
            ? []
            : List<dynamic>.from(carTypes!.map((x) => x.toJson())),
      };
}

class CarTypeModel {
  int? id;
  String? name;

  CarTypeModel({
    this.id,
    this.name,
  });

  CarTypeModel copyWith({
    int? id,
    String? name,
  }) =>
      CarTypeModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory CarTypeModel.fromJson(Map<String, dynamic> json) => CarTypeModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
