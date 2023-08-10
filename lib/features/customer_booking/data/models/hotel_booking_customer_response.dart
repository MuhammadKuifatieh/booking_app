import 'dart:convert';

HotelBookingCustomerResponse hotelBookingCustomerFromJson(String str) =>
    HotelBookingCustomerResponse.fromJson(json.decode(str));

String hotelBookingCustomerToJson(HotelBookingCustomerResponse data) =>
    json.encode(data.toJson());

class HotelBookingCustomerResponse {
  bool? success;
  String? message;
  Data? data;

  HotelBookingCustomerResponse({
    this.success,
    this.message,
    this.data,
  });

  HotelBookingCustomerResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      HotelBookingCustomerResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory HotelBookingCustomerResponse.fromJson(Map<String, dynamic> json) =>
      HotelBookingCustomerResponse(
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
  List<CustomerHotelBookingModel>? hotelBookings;

  Data({
    this.hotelBookings,
  });

  Data copyWith({
    List<CustomerHotelBookingModel>? hotelBookings,
  }) =>
      Data(
        hotelBookings: hotelBookings ?? this.hotelBookings,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hotelBookings: json["hotelBookings"] == null
            ? []
            : List<CustomerHotelBookingModel>.from(
                json["hotelBookings"]!.map((x) => CustomerHotelBookingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hotelBookings": hotelBookings == null
            ? []
            : List<dynamic>.from(hotelBookings!.map((x) => x.toJson())),
      };
}

class CustomerHotelBookingModel {
  int? id;
  dynamic roomNumber;
  int? escortsNumber;
  dynamic description;
  DateTime? bookingDatetime;
  int? status;

  CustomerHotelBookingModel({
    this.id,
    this.roomNumber,
    this.escortsNumber,
    this.description,
    this.bookingDatetime,
    this.status,
  });

  CustomerHotelBookingModel copyWith({
    int? id,
    dynamic roomNumber,
    int? escortsNumber,
    dynamic description,
    DateTime? bookingDatetime,
    int? status,
  }) =>
      CustomerHotelBookingModel(
        id: id ?? this.id,
        roomNumber: roomNumber ?? this.roomNumber,
        escortsNumber: escortsNumber ?? this.escortsNumber,
        description: description ?? this.description,
        bookingDatetime: bookingDatetime ?? this.bookingDatetime,
        status: status ?? this.status,
      );

  factory CustomerHotelBookingModel.fromJson(Map<String, dynamic> json) => CustomerHotelBookingModel(
        id: json["id"],
        roomNumber: json["room_number"],
        escortsNumber: json["escorts_number"],
        description: json["description"],
        bookingDatetime: json["booking_datetime"] == null
            ? null
            : DateTime.parse(json["booking_datetime"]),
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
