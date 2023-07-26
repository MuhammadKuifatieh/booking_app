import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/hotels_response.dart';
import '../repositories/hotel_repository.dart';

class GetHotels implements UseCase<HotelsResponse, GetHotelsParams> {
  final HotelRepository hotelRepository;

  GetHotels(this.hotelRepository);

  @override
  DataResponse<HotelsResponse> call(GetHotelsParams params) async {
    return hotelRepository.getHotels(params.getParams());
  }
}

class GetHotelsParams with Params {
  final int page;
  final int perPage;
  final String? name;
  final int? cityId;

  GetHotelsParams({
    required this.page,
    required this.perPage,
    this.name,
    this.cityId,
  });

  @override
  QueryParams getParams() {
    return {
      "page": page.toString(),
      "perPage": perPage.toString(),
      if (name != null && name!.isNotEmpty) "filter[name]": name!,
      if (cityId != null) "filter[city_id]": cityId.toString(),
    };
  }
}
