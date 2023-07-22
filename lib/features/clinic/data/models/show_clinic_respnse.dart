// To parse this JSON data, do
//
//     final clinicsResponse = clinicsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:booking_app/features/clinic/data/models/clinic_specialization_response.dart';
import 'package:booking_app/features/splash/data/models/cities_response.dart';

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
  Clinic? clinic;

  Data({
    this.clinic,
  });

  Data copyWith({
    Clinic? clinic,
  }) =>
      Data(
        clinic: clinic ?? this.clinic,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clinic: json["clinic"] == null ? null : Clinic.fromJson(json["clinic"]),
      );

  Map<String, dynamic> toJson() => {
        "clinic": clinic?.toJson(),
      };
}

class Clinic {
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
  List<ClinicSessionModel>? clinicSessions;

  Clinic({
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
    this.clinicSessions,
  });

  Clinic copyWith({
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
    List<ClinicSessionModel>? clinicSessions,
  }) =>
      Clinic(
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
        clinicSessions: clinicSessions ?? this.clinicSessions,
      );

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
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
        clinicSessions: json["clinic_sessions"] == null
            ? []
            : List<ClinicSessionModel>.from(
                json["clinic_sessions"]!.map((x) => ClinicSessionModel.fromJson(x))),
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
        "clinic_sessions": clinicSessions == null
            ? []
            : List<dynamic>.from(clinicSessions!.map((x) => x.toJson())),
      };
}

class ClinicSessionModel {
  int? id;
  int? slotOfDay;
  String? startTime;
  String? endTime;

  ClinicSessionModel({
    this.id,
    this.slotOfDay,
    this.startTime,
    this.endTime,
  });

  ClinicSessionModel copyWith({
    int? id,
    int? slotOfDay,
    String? startTime,
    String? endTime,
  }) =>
      ClinicSessionModel(
        id: id ?? this.id,
        slotOfDay: slotOfDay ?? this.slotOfDay,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  factory ClinicSessionModel.fromJson(Map<String, dynamic> json) => ClinicSessionModel(
        id: json["id"],
        slotOfDay: json["slot_of_day"],
        startTime: json["start_time"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slot_of_day": slotOfDay,
        "start_time": startTime,
        "end_time": endTime,
      };
}
