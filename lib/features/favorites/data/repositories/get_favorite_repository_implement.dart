import '../../../../core/config/typedef.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../../car_office/data/models/car_offices_response.dart';
import '../../../clinic/data/models/clinics_response.dart';
import '../../../hotel/data/models/hotels_response.dart';
import '../../../resturant/data/models/restaurant_response.dart';
import '../../domain/repositories/get_favorite_repository.dart';
import '../datasources/remote_get_favorite_data_source.dart';

class GetFavoriteRepositoryImplemnts
    with HandlingExceptionManager
    implements GetFavoriteRepository {
  final RemoteGetFavoriteDataSource _getFavoriteDataSource =
      RemoteGetFavoriteDataSource();

  @override
  DataResponse<CarOfficesResponse> getCarOffices(QueryParams params) async {
    return wrapHandling(
      tryCall: () async {
        final result = await _getFavoriteDataSource.getCarOffices(params);
        return result;
      },
    );
  }

  @override
  DataResponse<ClinicsResponse> getClinics(QueryParams params) async {
    return wrapHandling(
      tryCall: () async {
        final result = await _getFavoriteDataSource.getClinics(params);
        return result;
      },
    );
  }

  @override
  DataResponse<HotelsResponse> getHotels(QueryParams params) async {
    return wrapHandling(
      tryCall: () async {
        final result = await _getFavoriteDataSource.getHotels(params);
        return result;
      },
    );
  }

  @override
  DataResponse<RestaurantsResponse> getRestaurants(QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _getFavoriteDataSource.getRestaurants(params);
      return result;
    });
  }
}
