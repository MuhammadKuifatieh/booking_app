import 'dart:convert';

CarBookingCustomerResponse carBookingCustomerFromJson(String str) =>
    CarBookingCustomerResponse.fromJson(json.decode(str));

String carBookingCustomerToJson(CarBookingCustomerResponse data) =>
    json.encode(data.toJson());

class CarBookingCustomerResponse {
  bool? success;
  String? message;
  Data? data;

  CarBookingCustomerResponse({
    this.success,
    this.message,
    this.data,
  });

  CarBookingCustomerResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      CarBookingCustomerResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CarBookingCustomerResponse.fromJson(Map<String, dynamic> json) =>
      CarBookingCustomerResponse(
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
  List<CustomerCarBookingModel>? carBookings;

  Data({
    this.carBookings,
  });

  Data copyWith({
    List<CustomerCarBookingModel>? carBookings,
  }) =>
      Data(
        carBookings: carBookings ?? this.carBookings,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        carBookings: json["carBookings"] == null
            ? []
            : List<CustomerCarBookingModel>.from(
                json["carBookings"]!.map((x) => CustomerCarBookingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "carBookings": carBookings == null
            ? []
            : List<dynamic>.from(carBookings!.map((x) => x.toJson())),
      };
}

class CustomerCarBookingModel {
  int? id;
  dynamic carNumber;
  dynamic color;
  dynamic manufactureCompany;
  String? addressDetails;
  int? escortsNumber;
  String? latitudeFrom;
  String? longitudeFrom;
  String? latitudeTo;
  String? longitudeTo;
  DateTime? bookingDatetime;
  int? status;

  CustomerCarBookingModel({
    this.id,
    this.carNumber,
    this.color,
    this.manufactureCompany,
    this.addressDetails,
    this.escortsNumber,
    this.latitudeFrom,
    this.longitudeFrom,
    this.latitudeTo,
    this.longitudeTo,
    this.bookingDatetime,
    this.status,
  });

  CustomerCarBookingModel copyWith({
    int? id,
    dynamic carNumber,
    dynamic color,
    dynamic manufactureCompany,
    String? addressDetails,
    int? escortsNumber,
    String? latitudeFrom,
    String? longitudeFrom,
    String? latitudeTo,
    String? longitudeTo,
    DateTime? bookingDatetime,
    int? status,
  }) =>
      CustomerCarBookingModel(
        id: id ?? this.id,
        carNumber: carNumber ?? this.carNumber,
        color: color ?? this.color,
        manufactureCompany: manufactureCompany ?? this.manufactureCompany,
        addressDetails: addressDetails ?? this.addressDetails,
        escortsNumber: escortsNumber ?? this.escortsNumber,
        latitudeFrom: latitudeFrom ?? this.latitudeFrom,
        longitudeFrom: longitudeFrom ?? this.longitudeFrom,
        latitudeTo: latitudeTo ?? this.latitudeTo,
        longitudeTo: longitudeTo ?? this.longitudeTo,
        bookingDatetime: bookingDatetime ?? this.bookingDatetime,
        status: status ?? this.status,
      );

  factory CustomerCarBookingModel.fromJson(Map<String, dynamic> json) => CustomerCarBookingModel(
        id: json["id"],
        carNumber: json["car_number"],
        color: json["color"],
        manufactureCompany: json["manufacture_company"],
        addressDetails: json["address_details"],
        escortsNumber: json["escorts_number"],
        latitudeFrom: json["latitude_from"],
        longitudeFrom: json["longitude_from"],
        latitudeTo: json["latitude_to"],
        longitudeTo: json["longitude_to"],
        bookingDatetime: json["booking_datetime"] == null
            ? null
            : DateTime.parse(json["booking_datetime"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "car_number": carNumber,
        "color": color,
        "manufacture_company": manufactureCompany,
        "address_details": addressDetails,
        "escorts_number": escortsNumber,
        "latitude_from": latitudeFrom,
        "longitude_from": longitudeFrom,
        "latitude_to": latitudeTo,
        "longitude_to": longitudeTo,
        "booking_datetime": bookingDatetime?.toIso8601String(),
        "status": status,
      };
}
