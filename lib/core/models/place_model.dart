class PlaceContactModel {
  int? id;
  String? address;
  String? phoneNumber;
  String? latitude;
  String? longitude;
  bool? isOpen;
  DateTime? openAt;
  DateTime? closeAt;
  List<int>? openDays;

  PlaceContactModel({
    this.id,
    this.address,
    this.phoneNumber,
    this.latitude,
    this.longitude,
    this.isOpen,
    this.openAt,
    this.closeAt,
    this.openDays,
  });

  PlaceContactModel copyWith({
    int? id,
    String? address,
    String? phoneNumber,
    String? latitude,
    String? longitude,
    bool? isOpen,
    DateTime? openAt,
    DateTime? closeAt,
    List<int>? openDays,
  }) =>
      PlaceContactModel(
        id: id ?? this.id,
        address: address ?? this.address,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        isOpen: isOpen ?? this.isOpen,
        openAt: openAt ?? this.openAt,
        closeAt: closeAt ?? this.closeAt,
        openDays: openDays ?? this.openDays,
      );

  factory PlaceContactModel.fromJson(Map<String, dynamic> json) => PlaceContactModel(
        id: json["id"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isOpen: json["is_open"],
        openAt:
            json["open_at"] == null ? null : DateTime.parse(json["open_at"]),
        closeAt:
            json["close_at"] == null ? null : DateTime.parse(json["close_at"]),
        openDays: json["open_days"] == null
            ? []
            : List<int>.from(json["open_days"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "phone_number": phoneNumber,
        "latitude": latitude,
        "longitude": longitude,
        "is_open": isOpen,
        "open_at": openAt?.toIso8601String(),
        "close_at": closeAt?.toIso8601String(),
        "open_days":
            openDays == null ? [] : List<dynamic>.from(openDays!.map((x) => x)),
      };
}
