import 'dart:convert';

RestauratBookingOwnerResponse restauratBookingOwnerResponseFromJson(
        String str) =>
    RestauratBookingOwnerResponse.fromJson(json.decode(str));

String restauratBookingOwnerResponseToJson(
        RestauratBookingOwnerResponse data) =>
    json.encode(data.toJson());

class RestauratBookingOwnerResponse {
  bool? success;
  String? message;
  Data? data;

  RestauratBookingOwnerResponse({
    this.success,
    this.message,
    this.data,
  });

  RestauratBookingOwnerResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      RestauratBookingOwnerResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RestauratBookingOwnerResponse.fromJson(Map<String, dynamic> json) =>
      RestauratBookingOwnerResponse(
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
  List<RestaurantBookingOwnerModel>? restaurantBookings;

  Data({
    this.restaurantBookings,
  });

  Data copyWith({
    List<RestaurantBookingOwnerModel>? restaurantBookings,
  }) =>
      Data(
        restaurantBookings: restaurantBookings ?? this.restaurantBookings,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        restaurantBookings: json["restaurantBookings"] == null
            ? []
            : List<RestaurantBookingOwnerModel>.from(json["restaurantBookings"]!
                .map((x) => RestaurantBookingOwnerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurantBookings": restaurantBookings == null
            ? []
            : List<dynamic>.from(restaurantBookings!.map((x) => x.toJson())),
      };
}

class RestaurantBookingOwnerModel {
  int? id;
  int? tableNumber;
  int? escortsNumber;
  String? description;
  DateTime? bookingDatetime;
  int? status;

  RestaurantBookingOwnerModel({
    this.id,
    this.tableNumber,
    this.escortsNumber,
    this.description,
    this.bookingDatetime,
    this.status,
  });

  RestaurantBookingOwnerModel copyWith({
    int? id,
    int? tableNumber,
    int? escortsNumber,
    String? description,
    DateTime? bookingDatetime,
    int? status,
  }) =>
      RestaurantBookingOwnerModel(
        id: id ?? this.id,
        tableNumber: tableNumber ?? this.tableNumber,
        escortsNumber: escortsNumber ?? this.escortsNumber,
        description: description ?? this.description,
        bookingDatetime: bookingDatetime ?? this.bookingDatetime,
        status: status ?? this.status,
      );

  factory RestaurantBookingOwnerModel.fromJson(Map<String, dynamic> json) =>
      RestaurantBookingOwnerModel(
        id: json["id"],
        tableNumber: json["table_number"],
        escortsNumber: json["escorts_number"],
        description: json["description"],
        bookingDatetime: json["booking_datetime"] == null
            ? null
            : DateTime.parse(json["booking_datetime"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "table_number": tableNumber,
        "escorts_number": escortsNumber,
        "description": description,
        "booking_datetime": bookingDatetime?.toIso8601String(),
        "status": status,
      };
}
