import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../car_office/data/models/car_offices_response.dart';
import '../repositories/get_favorite_repository.dart';

class GetFavoriteCarOffices implements UseCase<CarOfficesResponse, NoParams> {
  final GetFavoriteRepository getFavoriteRepository;

  GetFavoriteCarOffices(this.getFavoriteRepository);
  @override
  DataResponse<CarOfficesResponse> call(NoParams params) async {
    return getFavoriteRepository.getCarOffices(params.getParams());
  }
}
