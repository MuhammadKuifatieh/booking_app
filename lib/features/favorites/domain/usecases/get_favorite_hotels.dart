import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../hotel/data/models/hotels_response.dart';
import '../repositories/get_favorite_repository.dart';

class GetFavoriteHotels implements UseCase<HotelsResponse, NoParams> {
  final GetFavoriteRepository getFavoriteRepository;

  GetFavoriteHotels(this.getFavoriteRepository);

  @override
  DataResponse<HotelsResponse> call(NoParams params) async {
    return getFavoriteRepository.getHotels(params.getParams());
  }
}
