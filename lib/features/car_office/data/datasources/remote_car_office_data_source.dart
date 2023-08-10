import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../../../../core/unified_api/post_api.dart';
import '../models/car_offices_response.dart';
import '../models/show_car_office_response.dart';

class RemoteCarOfficeDataSource {
  Future<CarOfficesResponse> getCarOffices(QueryParams params) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getCarOffices(params),
      fromJson: carOfficesResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<ShowCarOfficeResponse> showCarOffice(int carOfficeId) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.showCarOffice(carOfficeId),
      fromJson: showCarOfficeResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<NoResponse> bookingCarOffice(BodyMap body) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.bookingCarOffice(),
      body: body,
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
