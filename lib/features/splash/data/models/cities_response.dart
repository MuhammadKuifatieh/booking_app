import 'dart:convert';

CitiesResponse citiesResponseFromJson(String str) =>
    CitiesResponse.fromJson(json.decode(str));

String citiesResponseToJson(CitiesResponse data) => json.encode(data.toJson());

class CitiesResponse {
  bool? success;
  String? message;
  Data? data;

  CitiesResponse({
    this.success,
    this.message,
    this.data,
  });

  CitiesResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      CitiesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
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
  List<CityModel>? cities;

  Data({
    this.cities,
  });

  Data copyWith({
    List<CityModel>? cities,
  }) =>
      Data(
        cities: cities ?? this.cities,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cities: json["cities"] == null
            ? []
            : List<CityModel>.from(json["cities"]!.map((x) => CityModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": cities == null
            ? []
            : List<dynamic>.from(cities!.map((x) => x.toJson())),
      };
}

class CityModel {
  int? id;
  String? name;

  CityModel({
    this.id,
    this.name,
  });

  CityModel copyWith({
    int? id,
    String? name,
  }) =>
      CityModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
