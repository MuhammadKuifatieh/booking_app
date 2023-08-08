import '../../config/typedef.dart';
import '../../models/no_response_model.dart';

abstract class FavoriteRepository {
  DataResponse<NoResponse> toggleFavorite(int modelId, int modelType);
}
