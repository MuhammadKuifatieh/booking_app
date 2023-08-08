import '../../models/no_response_model.dart';
import '../../unified_api/api_variables.dart';
import '../../unified_api/post_api.dart';

class RemoteFavoriteDataSource {
  Future<NoResponse> toggleFavorite(int modelType, int modelId) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.toggleFavorite(modelId, modelType),
      body: {},
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
