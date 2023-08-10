import '../../config/typedef.dart';
import '../../models/no_response_model.dart';
import '../../usecase/use_case.dart';
import '../repositories/favorite_repositories.dart';

class ToggleFavorite implements UseCase<NoResponse, ToggleFavoriteParams> {
  final FavoriteRepository favoriteRepository;

  ToggleFavorite(this.favoriteRepository);
  @override
  DataResponse<NoResponse> call(ToggleFavoriteParams params) async {
    return favoriteRepository.toggleFavorite(params.modelId, params.modelType);
  }
}

class ToggleFavoriteParams with Params {
  final int modelId;
  final int modelType;

  ToggleFavoriteParams({
    required this.modelId,
    required this.modelType,
  });
}
