import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  bool? success;
  String? message;
  AuthDataModel? data;

  AuthResponse({
    this.success,
    this.message,
    this.data,
  });

  AuthResponse copyWith({
    bool? success,
    String? message,
    AuthDataModel? data,
  }) =>
      AuthResponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        success: json["success"],
        message: json["message"],
        data:
            json["data"] == null ? null : AuthDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class AuthDataModel {
  String? token;
  UserModel? admin;

  AuthDataModel({
    this.token,
    this.admin,
  });

  AuthDataModel copyWith({
    String? token,
    UserModel? admin,
  }) =>
      AuthDataModel(
        token: token ?? this.token,
        admin: admin ?? this.admin,
      );

  factory AuthDataModel.fromJson(Map<String, dynamic> json) => AuthDataModel(
        token: json["token"],
        admin: json["admin"] == null ? null : UserModel.fromJson(json["admin"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "admin": admin?.toJson(),
      };
}

class UserModel {
  int? id;
  String? name;
  String? username;
  String? address;
  String? phoneNumber;
  String? longitude;
  String? latitude;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.address,
    this.phoneNumber,
    this.longitude,
    this.latitude,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? address,
    String? phoneNumber,
    String? longitude,
    String? latitude,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        longitude: longitude ?? this.longitude,
        latitude: latitude ?? this.latitude,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "address": address,
        "phone_number": phoneNumber,
        "longitude": longitude,
        "latitude": latitude,
      };
}
