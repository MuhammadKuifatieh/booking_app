import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/clinics_response.dart';
import '../repositories/clinic_repository.dart';

class GetClinics implements UseCase<ClinicsResponse, GetClinicsParams> {
  final ClinicRepository clinicRepository;

  GetClinics(this.clinicRepository);
  @override
  DataResponse<ClinicsResponse> call(GetClinicsParams params) async {
    return clinicRepository.getClinics(params.getParams());
  }
}

class GetClinicsParams with Params {
  final int page;
  final int perPage;
  final int? cityId;
  final bool? isOpen;
  final int? clinicSpecializationId;

  GetClinicsParams({
    required this.page,
    required this.perPage,
    this.cityId,
    this.isOpen,
    this.clinicSpecializationId,
  });
  @override
  QueryParams getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
        if (cityId != null) "filter[city_id]": cityId.toString(),
        if (isOpen != null) "filter[is_open]": isOpen.toString(),
        if (clinicSpecializationId != null)
          "filter[clinic_specialization_id]": clinicSpecializationId.toString(),
      };
}
