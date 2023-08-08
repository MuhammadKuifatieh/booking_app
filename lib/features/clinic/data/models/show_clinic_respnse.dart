import 'dart:convert';

import '../../../../core/models/clinic_model.dart';

ShowClinicsResponse showClinicsResponseFromJson(String str) =>
    ShowClinicsResponse.fromJson(json.decode(str));

String showClinicsResponseToJson(ShowClinicsResponse data) =>
    json.encode(data.toJson());

class ShowClinicsResponse {
  bool? success;
  String? message;
  Data? data;

  ShowClinicsResponse({
    this.success,
    this.message,
    this.data,
  });

  ShowClinicsResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ShowClinicsResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ShowClinicsResponse.fromJson(Map<String, dynamic> json) =>
      ShowClinicsResponse(
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
  ClinicModel? clinic;

  Data({
    this.clinic,
  });

  Data copyWith({
    ClinicModel? clinic,
  }) =>
      Data(
        clinic: clinic ?? this.clinic,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clinic: json["clinic"] == null
            ? null
            : ClinicModel.fromJson(json["clinic"]),
      );

  Map<String, dynamic> toJson() => {
        "clinic": clinic?.toJson(),
      };
}
