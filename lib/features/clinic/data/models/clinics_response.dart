import 'dart:convert';

import '../../../../core/models/clinic_model.dart';

ClinicsResponse clinicsResponseFromJson(String str) =>
    ClinicsResponse.fromJson(json.decode(str));

String clinicsResponseToJson(ClinicsResponse data) =>
    json.encode(data.toJson());

class ClinicsResponse {
  bool? success;
  String? message;
  Data? data;

  ClinicsResponse({
    this.success,
    this.message,
    this.data,
  });

  ClinicsResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ClinicsResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ClinicsResponse.fromJson(Map<String, dynamic> json) =>
      ClinicsResponse(
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
  List<ClinicModel>? clinics;

  Data({
    this.clinics,
  });

  Data copyWith({
    List<ClinicModel>? clinics,
  }) =>
      Data(
        clinics: clinics ?? this.clinics,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clinics: json["clinics"] == null
            ? []
            : List<ClinicModel>.from(
                json["clinics"]!.map((x) => ClinicModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clinics": clinics == null
            ? []
            : List<dynamic>.from(clinics!.map((x) => x.toJson())),
      };
}
