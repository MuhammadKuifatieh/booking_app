import 'dart:convert';

import 'package:booking_app/core/models/hotel_model.dart';

HotelsResponse hotelsResponseFromJson(String str) =>
    HotelsResponse.fromJson(json.decode(str));

String hotelsResponseToJson(HotelsResponse data) => json.encode(data.toJson());

class HotelsResponse {
  bool? success;
  String? message;
  Data? data;

  HotelsResponse({
    this.success,
    this.message,
    this.data,
  });

  HotelsResponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      HotelsResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory HotelsResponse.fromJson(Map<String, dynamic> json) => HotelsResponse(
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
  List<HotelModel>? hotels;

  Data({
    this.hotels,
  });

  Data copyWith({
    List<HotelModel>? hotels,
  }) =>
      Data(
        hotels: hotels ?? this.hotels,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hotels: json["hotels"] == null
            ? []
            : List<HotelModel>.from(
                json["hotels"]!.map((x) => HotelModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hotels": hotels == null
            ? []
            : List<dynamic>.from(hotels!.map((x) => x.toJson())),
      };
}
