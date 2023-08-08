class ImageModel {
  int? id;
  String? mediaUrl;
  dynamic mediaType;
  String? hash;
  int? order;

  ImageModel({
    this.id,
    this.mediaUrl,
    this.mediaType,
    this.hash,
    this.order,
  });

  ImageModel copyWith({
    int? id,
    String? mediaUrl,
    dynamic mediaType,
    String? hash,
    int? order,
  }) =>
      ImageModel(
        id: id ?? this.id,
        mediaUrl: mediaUrl ?? this.mediaUrl,
        mediaType: mediaType ?? this.mediaType,
        hash: hash ?? this.hash,
        order: order ?? this.order,
      );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        mediaUrl: json["media_url"],
        mediaType: json["media_type"],
        hash: json["hash"],
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "media_url": mediaUrl,
        "media_type": mediaType,
        "hash": hash,
        "order": order,
      };
}
