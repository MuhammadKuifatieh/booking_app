import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/show_clinic_respnse.dart';
import '../repositories/clinic_repository.dart';

class ShowClinic implements UseCase<ShowClinicsResponse, ShowClinicParams> {
  final ClinicRepository clinicsRepository;

  ShowClinic(this.clinicsRepository);
  @override
  DataResponse<ShowClinicsResponse> call(ShowClinicParams params) async {
    return clinicsRepository.showClinic(params.clinicId);
  }
}

class ShowClinicParams with Params {
  final int clinicId;

  ShowClinicParams({required this.clinicId});
}
