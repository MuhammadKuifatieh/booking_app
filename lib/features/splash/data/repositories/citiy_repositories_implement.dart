import 'package:booking_app/core/config/typedef.dart';
import 'package:booking_app/core/unified_api/handling_exception_manager.dart';
import 'package:booking_app/features/splash/data/datasources/remote_city_data_source.dart';
import 'package:booking_app/features/splash/data/models/cities_response.dart';
import 'package:booking_app/features/splash/domain/repositories/city_repository.dart';

class CityRepositoryImplement
    with HandlingExceptionManager
    implements CityRepository {
  final _remoteCity = RemoteCityDataSource();
  @override
  DataResponse<CitiesResponse> getCities({QueryParams? params}) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteCity.getCities();
      return result;
    });
  }
}
