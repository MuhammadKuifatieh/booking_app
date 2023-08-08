// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClinicSpecializationModel {
  int? id;
  String? name;

  ClinicSpecializationModel({
    this.id,
    this.name,
  });

  ClinicSpecializationModel copyWith({
    int? id,
    String? name,
  }) =>
      ClinicSpecializationModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory ClinicSpecializationModel.fromJson(Map<String, dynamic> json) =>
      ClinicSpecializationModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  bool operator ==(covariant ClinicSpecializationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
