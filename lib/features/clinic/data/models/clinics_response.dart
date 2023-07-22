import 'dart:convert';

import '../../../splash/data/models/cities_response.dart';
import 'clinic_specialization_response.dart';

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

class ClinicModel {
  int? id;
  String? name;
  String? about;
  int? experienceYears;
  int? daySlotNumber;
  String? openAt;
  String? closeAt;
  String? openDays;
  CityModel? city;
  ClinicSpecializationModel? clinicSpecialization;

  ClinicModel({
    this.id,
    this.name,
    this.about,
    this.experienceYears,
    this.daySlotNumber,
    this.openAt,
    this.closeAt,
    this.openDays,
    this.city,
    this.clinicSpecialization,
  });

  ClinicModel copyWith({
    int? id,
    String? name,
    String? about,
    int? experienceYears,
    int? daySlotNumber,
    String? openAt,
    String? closeAt,
    String? openDays,
    CityModel? city,
    ClinicSpecializationModel? clinicSpecialization,
  }) =>
      ClinicModel(
        id: id ?? this.id,
        name: name ?? this.name,
        about: about ?? this.about,
        experienceYears: experienceYears ?? this.experienceYears,
        daySlotNumber: daySlotNumber ?? this.daySlotNumber,
        openAt: openAt ?? this.openAt,
        closeAt: closeAt ?? this.closeAt,
        openDays: openDays ?? this.openDays,
        city: city ?? this.city,
        clinicSpecialization: clinicSpecialization ?? this.clinicSpecialization,
      );

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        experienceYears: json["experience_years"],
        daySlotNumber: json["day_slot_number"],
        openAt: json["open_at"],
        closeAt: json["close_at"],
        openDays: json["open_days"],
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
        clinicSpecialization: json["clinic_specialization"] == null
            ? null
            : ClinicSpecializationModel.fromJson(json["clinic_specialization"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "experience_years": experienceYears,
        "day_slot_number": daySlotNumber,
        "open_at": openAt,
        "close_at": closeAt,
        "open_days": openDays,
        "city": city?.toJson(),
        "clinic_specialization": clinicSpecialization?.toJson(),
      };
}
