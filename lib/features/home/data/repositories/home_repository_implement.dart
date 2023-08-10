import 'package:booking_app/features/home/data/datasources/remote_home_datasource.dart';

import '../../../../core/config/typedef.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../../clinic/data/models/clinics_response.dart';
import '../../../hotel/data/models/hotels_response.dart';
import '../../../resturant/data/models/restaurant_response.dart';
import '../../domain/repositories/home_respository.dart';

class HomeRepositoryImplement
    with HandlingExceptionManager
    implements HomeRepository {
  final _remoteHome = RemoteHomeDataSource();
  @override
  DataResponse<ClinicsResponse> getClinicsMostVisit(QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteHome.getClinicsMostVisit(params);
      return result;
    });
  }

  @override
  DataResponse<HotelsResponse> getHotelLastAdd(QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteHome.getHotelLastAdd(params);
      return result;
    });
  }

  @override
  DataResponse<HotelsResponse> getHotelMostPopular(QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteHome.getHotelMostPopular(params);
      return result;
    });
  }

  @override
  DataResponse<RestaurantsResponse> getRestaurantsMostFavorite(
      QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteHome.getRestaurantsMostFavorite(params);
      return result;
    });
  }
}
