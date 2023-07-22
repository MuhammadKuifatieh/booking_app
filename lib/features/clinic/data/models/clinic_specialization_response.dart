import 'dart:convert';

ClinicSpecializationResponse clinicSpecializationResponseFromJson(String str) =>
    ClinicSpecializationResponse.fromJson(json.decode(str));

String clinicSpecializationResponseToJson(ClinicSpecializationResponse data) =>
    json.encode(data.toJson());

class ClinicSpecializationResponse {
  bool? success;
  String? message;
  Data? data;

  ClinicSpecializationResponse({
    this.success,
    this.message,
    this.data,
  });

  ClinicSpecializationResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ClinicSpecializationResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ClinicSpecializationResponse.fromJson(Map<String, dynamic> json) =>
      ClinicSpecializationResponse(
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
  List<ClinicSpecializationModel>? clinicSpecializations;

  Data({
    this.clinicSpecializations,
  });

  Data copyWith({
    List<ClinicSpecializationModel>? clinicSpecializations,
  }) =>
      Data(
        clinicSpecializations:
            clinicSpecializations ?? this.clinicSpecializations,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clinicSpecializations: json["clinicSpecializations"] == null
            ? []
            : List<ClinicSpecializationModel>.from(json["clinicSpecializations"]!
                .map((x) => ClinicSpecializationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clinicSpecializations": clinicSpecializations == null
            ? []
            : List<dynamic>.from(clinicSpecializations!.map((x) => x.toJson())),
      };
}

class ClinicSpecializationModel {
  int? id;
  String? name;

  ClinicSpecializationModel({
    this.id,
    this.name,
  });

  ClinicSpecializationModel copyWith({
    int? id,
    String? name,
  }) =>
      ClinicSpecializationModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory ClinicSpecializationModel.fromJson(Map<String, dynamic> json) =>
      ClinicSpecializationModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
