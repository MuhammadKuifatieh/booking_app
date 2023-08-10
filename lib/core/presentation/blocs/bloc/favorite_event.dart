part of 'favorite_bloc.dart';

sealed class FavoriteEvent {
  const FavoriteEvent();
}

class ToggleFavoriteEvent extends FavoriteEvent {
  final int modelId;
  final int modelType;

  ToggleFavoriteEvent({
    required this.modelId,
    required this.modelType,
  });
}

class AddItemsToFavoriteEvent extends FavoriteEvent {
  final List<Object> items;
  final int modelType;

  AddItemsToFavoriteEvent({
    required this.items,
    required this.modelType,
  });
}

class AddItemToFavoriteEvent extends FavoriteEvent {
  final Object item;
  final int modelType;

  AddItemToFavoriteEvent({
    required this.item,
    required this.modelType,
  });
}
