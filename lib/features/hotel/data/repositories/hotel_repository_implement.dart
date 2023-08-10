import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domain/repositories/hotel_repository.dart';
import '../datasources/remote_hotel_data_source.dart';
import '../models/hotels_response.dart';
import '../models/show_hotel_response.dart';

class HotelRepositoryImplement
    with HandlingExceptionManager
    implements HotelRepository {
  final _remoteHotel = RemoteHotelDataSource();
  @override
  DataResponse<HotelsResponse> getHotels(QueryParams params) async {
    return wrapHandling(
      tryCall: () async {
        final result = await _remoteHotel.getHotels(params);
        return result;
      },
    );
  }

  @override
  DataResponse<ShowHotelResponse> showHotel(int hotelId) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteHotel.showHotel(hotelId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> bookingHotel(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteHotel.bookingHotel(body);
      return result;
    });
  }
}
