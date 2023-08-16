import 'dart:convert';

ClinicBookingOwnerResponse clinicBookingOwnerResponseFromJson(String str) =>
    ClinicBookingOwnerResponse.fromJson(json.decode(str));

String clinicBookingOwnerResponseToJson(ClinicBookingOwnerResponse data) =>
    json.encode(data.toJson());

class ClinicBookingOwnerResponse {
  bool? success;
  String? message;
  Data? data;

  ClinicBookingOwnerResponse({
    this.success,
    this.message,
    this.data,
  });

  ClinicBookingOwnerResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      ClinicBookingOwnerResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ClinicBookingOwnerResponse.fromJson(Map<String, dynamic> json) =>
      ClinicBookingOwnerResponse(
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
  List<ClinicBookingOwnerModel>? clinicBookings;

  Data({
    this.clinicBookings,
  });

  Data copyWith({
    List<ClinicBookingOwnerModel>? clinicBookings,
  }) =>
      Data(
        clinicBookings: clinicBookings ?? this.clinicBookings,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        clinicBookings: json["clinicBookings"] == null
            ? []
            : List<ClinicBookingOwnerModel>.from(json["clinicBookings"]!
                .map((x) => ClinicBookingOwnerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "clinicBookings": clinicBookings == null
            ? []
            : List<dynamic>.from(clinicBookings!.map((x) => x.toJson())),
      };
}

class ClinicBookingOwnerModel {
  int? id;
  int? clinicVisitType;
  String? caseDescription;
  DateTime? bookingDatetime;
  int? status;

  ClinicBookingOwnerModel({
    this.id,
    this.clinicVisitType,
    this.caseDescription,
    this.bookingDatetime,
    this.status,
  });

  ClinicBookingOwnerModel copyWith({
    int? id,
    int? clinicVisitType,
    String? caseDescription,
    DateTime? bookingDatetime,
    int? status,
  }) =>
      ClinicBookingOwnerModel(
        id: id ?? this.id,
        clinicVisitType: clinicVisitType ?? this.clinicVisitType,
        caseDescription: caseDescription ?? this.caseDescription,
        bookingDatetime: bookingDatetime ?? this.bookingDatetime,
        status: status ?? this.status,
      );

  factory ClinicBookingOwnerModel.fromJson(Map<String, dynamic> json) =>
      ClinicBookingOwnerModel(
        id: json["id"],
        clinicVisitType: json["clinic_visit_type"],
        caseDescription: json["case_description"],
        bookingDatetime: json["booking_datetime"] == null
            ? null
            : DateTime.parse(json["booking_datetime"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clinic_visit_type": clinicVisitType,
        "case_description": caseDescription,
        "booking_datetime":
            "${bookingDatetime!.year.toString().padLeft(4, '0')}-${bookingDatetime!.month.toString().padLeft(2, '0')}-${bookingDatetime!.day.toString().padLeft(2, '0')}",
        "status": status,
      };
}
