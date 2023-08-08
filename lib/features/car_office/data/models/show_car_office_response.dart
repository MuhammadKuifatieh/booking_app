import 'dart:convert';

import '../../../../core/models/car_office_model.dart';

ShowCarOfficeResponse showCarOfficeResponseFromJson(String str) =>
    ShowCarOfficeResponse.fromJson(json.decode(str));

String showCarOfficeResponseToJson(ShowCarOfficeResponse data) =>
    json.encode(data.toJson());

class ShowCarOfficeResponse {
  bool? success;
  String? message;
  Data? data;

  ShowCarOfficeResponse({
    this.success,
    this.message,
    this.data,
  });

  ShowCarOfficeResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ShowCarOfficeResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ShowCarOfficeResponse.fromJson(Map<String, dynamic> json) =>
      ShowCarOfficeResponse(
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
  CarOfficeModel? carOffice;

  Data({
    this.carOffice,
  });

  Data copyWith({
    CarOfficeModel? carOffice,
  }) =>
      Data(
        carOffice: carOffice ?? this.carOffice,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        carOffice: json["carOffice"] == null
            ? null
            : CarOfficeModel.fromJson(json["carOffice"]),
      );

  Map<String, dynamic> toJson() => {
        "carOffice": carOffice?.toJson(),
      };
}
