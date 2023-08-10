import '../../extensions/int.dart';

class FavoriteObject {
  final int modelId;
  final int modelType;
  final bool isFavorite;

  FavoriteObject({
    required this.modelId,
    required this.modelType,
    required this.isFavorite,
  });

  FavoriteObject copyWith({
    int? modelId,
    int? modelType,
    bool? isFavorite,
  }) {
    return FavoriteObject(
      modelId: modelId ?? this.modelId,
      modelType: modelType ?? this.modelType,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(covariant FavoriteObject other) {
    if (identical(this, other)) return true;

    return other.modelId == modelId && other.modelType == modelType;
  }

  @override
  int get hashCode => modelId.hashCode ^ modelType.hashCode;

  @override
  String toString() =>
      'FavoriteObject(modelId: $modelId, modelType: $modelType, isFavorite: $isFavorite)';
}

extension ListOfFavoriteObject on List<FavoriteObject> {
  void addFavorite(FavoriteObject item) {
    if (contains(item)) {
      for (int i = 0; i < length; i++) {
        if (this[i] == item) {
          this[i] = this[i].copyWith(isFavorite: item.isFavorite);
        }
      }
    } else {
      add(item);
    }
  }

  void addAllFavorite(List list, int modelType) {
    for (var item in list) {
      addFavorite(FavoriteObject(
        modelId: item.id!,
        modelType: modelType,
        isFavorite: (item.isFavorite! as int).toBool(),
      ));
    }
  }

  FavoriteObject? getObject(
    int modelId,
    int modelType,
  ) {
    for (var item in this) {
      if (item.modelId == modelId && item.modelType == modelType) {
        return item;
      }
    }
    return null;
  }
}
