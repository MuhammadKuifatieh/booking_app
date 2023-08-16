// To parse this JSON data, do
//
//     final hotelBookingOwnerResponse = hotelBookingOwnerResponseFromJson(jsonString);

import 'dart:convert';

HotelBookingOwnerResponse hotelBookingOwnerResponseFromJson(String str) => HotelBookingOwnerResponse.fromJson(json.decode(str));

String hotelBookingOwnerResponseToJson(HotelBookingOwnerResponse data) => json.encode(data.toJson());

class HotelBookingOwnerResponse {
    bool? success;
    String? message;
    Data? data;

    HotelBookingOwnerResponse({
        this.success,
        this.message,
        this.data,
    });

    HotelBookingOwnerResponse copyWith({
        bool? success,
        String? message,
        Data? data,
    }) => 
        HotelBookingOwnerResponse(
            success: success ?? this.success,
            message: message ?? this.message,
            data: data ?? this.data,
        );

    factory HotelBookingOwnerResponse.fromJson(Map<String, dynamic> json) => HotelBookingOwnerResponse(
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
    List<HotelBookingOwnerModel>? hotelBookings;

    Data({
        this.hotelBookings,
    });

    Data copyWith({
        List<HotelBookingOwnerModel>? hotelBookings,
    }) => 
        Data(
            hotelBookings: hotelBookings ?? this.hotelBookings,
        );

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        hotelBookings: json["hotelBookings"] == null ? [] : List<HotelBookingOwnerModel>.from(json["hotelBookings"]!.map((x) => HotelBookingOwnerModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hotelBookings": hotelBookings == null ? [] : List<dynamic>.from(hotelBookings!.map((x) => x.toJson())),
    };
}

class HotelBookingOwnerModel {
    int? id;
    int? roomNumber;
    int? escortsNumber;
    String? description;
    DateTime? bookingDatetime;
    int? status;

    HotelBookingOwnerModel({
        this.id,
        this.roomNumber,
        this.escortsNumber,
        this.description,
        this.bookingDatetime,
        this.status,
    });

    HotelBookingOwnerModel copyWith({
        int? id,
        int? roomNumber,
        int? escortsNumber,
        String? description,
        DateTime? bookingDatetime,
        int? status,
    }) => 
        HotelBookingOwnerModel(
            id: id ?? this.id,
            roomNumber: roomNumber ?? this.roomNumber,
            escortsNumber: escortsNumber ?? this.escortsNumber,
            description: description ?? this.description,
            bookingDatetime: bookingDatetime ?? this.bookingDatetime,
            status: status ?? this.status,
        );

    factory HotelBookingOwnerModel.fromJson(Map<String, dynamic> json) => HotelBookingOwnerModel(
        id: json["id"],
        roomNumber: json["room_number"],
        escortsNumber: json["escorts_number"],
        description: json["description"],
        bookingDatetime: json["booking_datetime"] == null ? null : DateTime.parse(json["booking_datetime"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "room_number": roomNumber,
        "escorts_number": escortsNumber,
        "description": description,
        "booking_datetime": bookingDatetime?.toIso8601String(),
        "status": status,
    };
}
