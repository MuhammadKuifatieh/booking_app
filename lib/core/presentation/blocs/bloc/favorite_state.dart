part of 'favorite_bloc.dart';

enum FavoriteStatus { init, loading, succ, failed }

class FavoriteState {
  final Map<String, int> favoriteValues;
  final FavoriteStatus favoriteStatus;
  const FavoriteState({
    this.favoriteValues = const {},
    this.favoriteStatus = FavoriteStatus.init,
  });

  FavoriteState copyWith({
    Map<String, int>? favoriteValues,
    FavoriteStatus? favoriteStatus,
  }) {
    return FavoriteState(
      favoriteValues: favoriteValues ?? this.favoriteValues,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
    );
  }
}
