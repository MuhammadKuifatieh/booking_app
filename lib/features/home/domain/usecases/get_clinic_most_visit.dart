import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../clinic/data/models/clinics_response.dart';
import '../repositories/home_respository.dart';

class GetClinicsMostVisit
    implements UseCase<ClinicsResponse, GetClinicsMostVisitParams> {
  final HomeRepository homeRepository;

  GetClinicsMostVisit(this.homeRepository);

  @override
  DataResponse<ClinicsResponse> call(GetClinicsMostVisitParams params) {
    return homeRepository.getClinicsMostVisit(params.getParams());
  }
}

class GetClinicsMostVisitParams with Params {
  final int page;
  final int perPage;

  GetClinicsMostVisitParams({
    required this.page,
    required this.perPage,
  });
  @override
  QueryParams getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
      };
}
