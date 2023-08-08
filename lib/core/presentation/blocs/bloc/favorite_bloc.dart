import 'dart:async';

import 'package:bloc/bloc.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<ToggleFavoriteEvent>(_mapToggleFavorite);
  }
  FutureOr<void> _mapToggleFavorite(
      ToggleFavoriteEvent event, Emitter<FavoriteState> emit) async {}
}
