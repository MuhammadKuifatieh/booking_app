import 'dart:convert';

import '../../../../core/models/city_model.dart';

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
