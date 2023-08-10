import 'dart:convert';

RestaurantBookingCustomerResponse restaurantBookingCustomerFromJson(String str) =>
    RestaurantBookingCustomerResponse.fromJson(json.decode(str));

String restaurantBookingCustomerToJson(RestaurantBookingCustomerResponse data) =>
    json.encode(data.toJson());

class RestaurantBookingCustomerResponse {
  bool? success;
  String? message;
  Data? data;

  RestaurantBookingCustomerResponse({
    this.success,
    this.message,
    this.data,
  });

  RestaurantBookingCustomerResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      RestaurantBookingCustomerResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory RestaurantBookingCustomerResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantBookingCustomerResponse(
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
  List<CustomerRestaurantBookingModel>? restaurantBookings;

  Data({
    this.restaurantBookings,
  });

  Data copyWith({
    List<CustomerRestaurantBookingModel>? restaurantBookings,
  }) =>
      Data(
        restaurantBookings: restaurantBookings ?? this.restaurantBookings,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        restaurantBookings: json["restaurantBookings"] == null
            ? []
            : List<CustomerRestaurantBookingModel>.from(json["restaurantBookings"]!
                .map((x) => CustomerRestaurantBookingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "restaurantBookings": restaurantBookings == null
            ? []
            : List<dynamic>.from(restaurantBookings!.map((x) => x.toJson())),
      };
}

class CustomerRestaurantBookingModel {
  int? id;
  dynamic tableNumber;
  int? escortsNumber;
  dynamic description;
  DateTime? bookingDatetime;
  int? status;

  CustomerRestaurantBookingModel({
    this.id,
    this.tableNumber,
    this.escortsNumber,
    this.description,
    this.bookingDatetime,
    this.status,
  });

  CustomerRestaurantBookingModel copyWith({
    int? id,
    dynamic tableNumber,
    int? escortsNumber,
    dynamic description,
    DateTime? bookingDatetime,
    int? status,
  }) =>
      CustomerRestaurantBookingModel(
        id: id ?? this.id,
        tableNumber: tableNumber ?? this.tableNumber,
        escortsNumber: escortsNumber ?? this.escortsNumber,
        description: description ?? this.description,
        bookingDatetime: bookingDatetime ?? this.bookingDatetime,
        status: status ?? this.status,
      );

  factory CustomerRestaurantBookingModel.fromJson(Map<String, dynamic> json) =>
      CustomerRestaurantBookingModel(
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
