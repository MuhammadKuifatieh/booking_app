import 'dart:convert';

import 'city_model.dart';
import 'clinic_specialization_response.dart';
import 'image_model.dart';
import 'place_model.dart';
import 'user_model.dart';

ClinicModel clinicModelFromJson(String str) =>
    ClinicModel.fromJson(json.decode(str));

String clinicModelToJson(ClinicModel data) => json.encode(data.toJson());

class ClinicModel {
  int? id;
  String? name;
  dynamic about;
  int? favoriteCount;
  int? isFavorite;
  int? visitCount;
  int? experienceYears;
  int? sessionDuration;
  ImageModel? image;
  PlaceContactModel? placeContact;
  UserModel? user;
  CityModel? city;
  ClinicSpecializationModel? clinicSpecialization;
  List<ClinicSessionModel>? clinicSessions;

  ClinicModel({
    this.id,
    this.name,
    this.about,
    this.favoriteCount,
    this.isFavorite,
    this.visitCount,
    this.experienceYears,
    this.sessionDuration,
    this.image,
    this.placeContact,
    this.user,
    this.city,
    this.clinicSpecialization,
    this.clinicSessions,
  });

  ClinicModel copyWith({
    int? id,
    String? name,
    dynamic about,
    int? favoriteCount,
    int? isFavorite,
    int? visitCount,
    int? experienceYears,
    int? sessionDuration,
    ImageModel? image,
    PlaceContactModel? placeContact,
    UserModel? user,
    CityModel? city,
    ClinicSpecializationModel? clinicSpecialization,
    List<ClinicSessionModel>? clinicSessions,
  }) =>
      ClinicModel(
        id: id ?? this.id,
        name: name ?? this.name,
        about: about ?? this.about,
        favoriteCount: favoriteCount ?? this.favoriteCount,
        isFavorite: isFavorite ?? this.isFavorite,
        visitCount: visitCount ?? this.visitCount,
        experienceYears: experienceYears ?? this.experienceYears,
        sessionDuration: sessionDuration ?? this.sessionDuration,
        image: image ?? this.image,
        placeContact: placeContact ?? this.placeContact,
        user: user ?? this.user,
        city: city ?? this.city,
        clinicSpecialization: clinicSpecialization ?? this.clinicSpecialization,
        clinicSessions: clinicSessions ?? this.clinicSessions,
      );

  factory ClinicModel.fromJson(Map<String, dynamic> json) => ClinicModel(
        id: json["id"],
        name: json["name"],
        about: json["about"],
        favoriteCount: json["favorite_count"],
        isFavorite: json["user_is_favorite"],
        visitCount: json["visit_count_total"],
        experienceYears: json["experience_years"],
        sessionDuration: json["session_duration"],
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        placeContact: json["place_contact"] == null
            ? null
            : PlaceContactModel.fromJson(json["place_contact"]),
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
        clinicSpecialization: json["clinic_specialization"] == null
            ? null
            : ClinicSpecializationModel.fromJson(json["clinic_specialization"]),
        clinicSessions: json["clinic_sessions"] == null
            ? []
            : List<ClinicSessionModel>.from(json["clinic_sessions"]!
                .map((x) => ClinicSessionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "about": about,
        "favorite_count": favoriteCount,
        "user_is_favorite": isFavorite,
        "visit_count_total": visitCount,
        "experience_years": experienceYears,
        "session_duration": sessionDuration,
        "image": image?.toJson(),
        "place_contact": placeContact?.toJson(),
        "user": user?.toJson(),
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

  factory ClinicSessionModel.fromJson(Map<String, dynamic> json) =>
      ClinicSessionModel(
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
