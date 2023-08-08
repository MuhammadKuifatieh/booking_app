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
