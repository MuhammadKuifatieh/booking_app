// To parse this JSON data, do
//
//     final clinicBookingCustomer = clinicBookingCustomerFromJson(jsonString);

import 'dart:convert';

ClinicBookingCustomerResponse clinicBookingCustomerFromJson(String str) => ClinicBookingCustomerResponse.fromJson(json.decode(str));

String clinicBookingCustomerToJson(ClinicBookingCustomerResponse data) => json.encode(data.toJson());

class ClinicBookingCustomerResponse {
    bool? success;
    String? message;
    Data? data;

    ClinicBookingCustomerResponse({
        this.success,
        this.message,
        this.data,
    });

    ClinicBookingCustomerResponse copyWith({
        bool? success,
        String? message,
        Data? data,
    }) => 
        ClinicBookingCustomerResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory ClinicBookingCustomerResponse.fromJson(Map<String, dynamic> json) => ClinicBookingCustomerResponse(
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
    List<CusomerClinicBookingModel>? clinicBookings;

    Data({
        this.clinicBookings,
    });

    Data copyWith({
        List<CusomerClinicBookingModel>? clinicBookings,
    }) => 
        Data(
            clinicBookings: clinicBookings ?? this.clinicBookings,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        clinicBookings: json["clinicBookings"] == null ? [] : List<CusomerClinicBookingModel>.from(json["clinicBookings"]!.map((x) => CusomerClinicBookingModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "clinicBookings": clinicBookings == null ? [] : List<dynamic>.from(clinicBookings!.map((x) => x.toJson())),
    };
}

class CusomerClinicBookingModel {
    int? id;
    int? clinicVisitType;
    String? caseDescription;
    DateTime? bookingDatetime;
    int? status;

    CusomerClinicBookingModel({
        this.id,
        this.clinicVisitType,
        this.caseDescription,
        this.bookingDatetime,
        this.status,
    });

    CusomerClinicBookingModel copyWith({
        int? id,
        int? clinicVisitType,
        String? caseDescription,
        DateTime? bookingDatetime,
        int? status,
    }) => 
        CusomerClinicBookingModel(
            id: id ?? this.id,
            clinicVisitType: clinicVisitType ?? this.clinicVisitType,
            caseDescription: caseDescription ?? this.caseDescription,
            bookingDatetime: bookingDatetime ?? this.bookingDatetime,
            status: status ?? this.status,
        );

    factory CusomerClinicBookingModel.fromJson(Map<String, dynamic> json) => CusomerClinicBookingModel(
        id: json["id"],
        clinicVisitType: json["clinic_visit_type"],
        caseDescription: json["case_description"],
        bookingDatetime: json["booking_datetime"] == null ? null : DateTime.parse(json["booking_datetime"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "clinic_visit_type": clinicVisitType,
        "case_description": caseDescription,
        "booking_datetime": "${bookingDatetime!.year.toString().padLeft(4, '0')}-${bookingDatetime!.month.toString().padLeft(2, '0')}-${bookingDatetime!.day.toString().padLeft(2, '0')}",
        "status": status,
    };
}
