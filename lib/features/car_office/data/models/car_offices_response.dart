import 'dart:convert';

import '../../../../core/models/car_office_model.dart';

CarOfficesResponse carOfficesResponseFromJson(String str) =>
    CarOfficesResponse.fromJson(json.decode(str));

String carOfficesResponseToJson(CarOfficesResponse data) =>
    json.encode(data.toJson());

class CarOfficesResponse {
  bool? success;
  String? message;
  Data? data;

  CarOfficesResponse({
    this.success,
    this.message,
    this.data,
  });

  CarOfficesResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      CarOfficesResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CarOfficesResponse.fromJson(Map<String, dynamic> json) =>
      CarOfficesResponse(
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
  List<CarOfficeModel>? carOffices;

  Data({
    this.carOffices,
  });

  Data copyWith({
    List<CarOfficeModel>? carOffices,
  }) =>
      Data(
        carOffices: carOffices ?? this.carOffices,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        carOffices: json["carOffices"] == null
            ? []
            : List<CarOfficeModel>.from(
                json["carOffices"]!.map((x) => CarOfficeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "carOffices": carOffices == null
            ? []
            : List<dynamic>.from(carOffices!.map((x) => x.toJson())),
      };
}
