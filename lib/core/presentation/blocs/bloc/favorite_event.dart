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
