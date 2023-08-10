import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domain/repositories/car_office_repository.dart';
import '../datasources/remote_car_office_data_source.dart';
import '../models/car_offices_response.dart';
import '../models/show_car_office_response.dart';

class CarOfficeRepositoryImplement
    with HandlingExceptionManager
    implements CarOfficeRepository {
  final _remoteCarOffice = RemoteCarOfficeDataSource();
  @override
  DataResponse<CarOfficesResponse> getCarOffices(QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteCarOffice.getCarOffices(params);
      return result;
    });
  }

  @override
  DataResponse<ShowCarOfficeResponse> showCarOffice(int carOfficeId) async {
    return wrapHandling(
      tryCall: () async {
        final result = await _remoteCarOffice.showCarOffice(carOfficeId);
        return result;
      },
    );
  }

  @override
  DataResponse<NoResponse> bookingCarOffice(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteCarOffice.bookingCarOffice(body);
      return result;
    });
  }
}
