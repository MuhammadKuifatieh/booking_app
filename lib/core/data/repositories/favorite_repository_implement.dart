import '../../config/typedef.dart';
import '../../domain/repositories/favorite_repositories.dart';
import '../../models/no_response_model.dart';
import '../../unified_api/handling_exception_manager.dart';
import '../datasources/remote_favorite_data_source.dart';

class FavoriteRepositoryImplement
    with HandlingExceptionManager
    implements FavoriteRepository {
  final _remoteFavorite = RemoteFavoriteDataSource();
  @override
  DataResponse<NoResponse> toggleFavorite(int modelId, int modelType) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteFavorite.toggleFavorite(modelType, modelId);
      return result;
    });
  }
}
