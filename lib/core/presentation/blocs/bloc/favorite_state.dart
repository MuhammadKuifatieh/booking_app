part of 'favorite_bloc.dart';

enum FavoriteStatus { init, loading, succ, failed }

class FavoriteState {
  final List<FavoriteObject> favoriteList;
  final FavoriteStatus favoriteStatus;
  const FavoriteState({
    this.favoriteList = const [],
    this.favoriteStatus = FavoriteStatus.init,
  });

  FavoriteState copyWith({
    List<FavoriteObject>? favoriteList,
    FavoriteStatus? favoriteStatus,
  }) {
    return FavoriteState(
      favoriteList: favoriteList ?? this.favoriteList,
      favoriteStatus: favoriteStatus ?? this.favoriteStatus,
    );
  }
}
