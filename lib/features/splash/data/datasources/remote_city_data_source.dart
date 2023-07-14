import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/cities_response.dart';

class RemoteCityDataSource {
  Future<CitiesResponse> getCities() async {
    GetApi getApi = GetApi(
      uri: ApiVariables.getCities(),
      fromJson: citiesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }
}
