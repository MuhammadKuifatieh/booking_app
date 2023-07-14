import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/cities_response.dart';
import '../repositories/city_repository.dart';

class GetCities implements UseCase<CitiesResponse, NoParams> {
  final CityRepository cityRepository;

  GetCities(this.cityRepository);

  @override
  DataResponse<CitiesResponse> call(NoParams params) async {
    return cityRepository.getCities();
  }
}
