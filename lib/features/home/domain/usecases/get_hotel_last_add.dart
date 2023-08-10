import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../hotel/data/models/hotels_response.dart';
import '../repositories/home_respository.dart';

class GetHotelLastAdd
    implements UseCase<HotelsResponse, GetHotelLastAddParams> {
  final HomeRepository homeRepository;

  GetHotelLastAdd(this.homeRepository);
  @override
  DataResponse<HotelsResponse> call(GetHotelLastAddParams params) {
    return homeRepository.getHotelLastAdd(params.getParams());
  }
}

class GetHotelLastAddParams with Params {
  final int page;
  final int perPage;

  GetHotelLastAddParams({
    required this.page,
    required this.perPage,
  });
  @override
  QueryParams getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
