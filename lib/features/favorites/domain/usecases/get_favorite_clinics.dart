import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../clinic/data/models/clinics_response.dart';
import '../repositories/get_favorite_repository.dart';

class GetFavoriteClinic implements UseCase<ClinicsResponse, NoParams> {
  final GetFavoriteRepository getFavoriteRepository;

  GetFavoriteClinic(this.getFavoriteRepository);
  @override
  DataResponse<ClinicsResponse> call(NoParams params) async {
    return getFavoriteRepository.getClinics(params.getParams());
  }
}
