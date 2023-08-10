import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../hotel/data/models/hotels_response.dart';
import '../repositories/home_respository.dart';

class GetHotelMostPopular
    implements UseCase<HotelsResponse, GetHotelMostPopularParams> {
  final HomeRepository homeRepository;

  GetHotelMostPopular(this.homeRepository);

  @override
  DataResponse<HotelsResponse> call(GetHotelMostPopularParams params) {
    return homeRepository.getHotelMostPopular(params.getParams());
  }
}

class GetHotelMostPopularParams with Params {
  final int page;
  final int perPage;

  GetHotelMostPopularParams({
    required this.page,
    required this.perPage,
  });

  @override
  QueryParams getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
