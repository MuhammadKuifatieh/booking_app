import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../../data/models/favorite_object.dart';
import '../../../data/repositories/favorite_repository_implement.dart';
import '../../../domain/usecase/toggle_favorite.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final _toggeleFavorite = ToggleFavorite(FavoriteRepositoryImplement());
  FavoriteBloc() : super(const FavoriteState()) {
    on<ToggleFavoriteEvent>(_mapToggleFavorite);
    on<AddItemToFavoriteEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            favoriteList: List.of(state.favoriteList)
              ..addAllFavorite(
                [event.item],
                event.modelType,
              ),
          ),
        );
      },
    );
    on<AddItemsToFavoriteEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            favoriteList: List.of(state.favoriteList)
              ..addAllFavorite(
                event.items,
                event.modelType,
              ),
          ),
        );
      },
    );
  }
  FutureOr<void> _mapToggleFavorite(
      ToggleFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(favoriteStatus: FavoriteStatus.loading));
    FavoriteObject object =
        state.favoriteList.getObject(event.modelId, event.modelType)!;
    log(object.toString());
    object = object.copyWith(isFavorite: !object.isFavorite);
    log(object.toString());

    emit(
        state.copyWith(favoriteList: List.of(state.favoriteList)..addFavorite(object)));
    
    final result = await _toggeleFavorite(ToggleFavoriteParams(
        modelId: event.modelId, modelType: event.modelType));
    result.fold(
      (l) => emit(state.copyWith(
        favoriteStatus: FavoriteStatus.failed,
        favoriteList: List.of(state.favoriteList)
          ..add(object.copyWith(isFavorite: !object.isFavorite)),
      )),
      (r) => emit(state.copyWith(favoriteStatus: FavoriteStatus.succ)),
    );
  }
}
