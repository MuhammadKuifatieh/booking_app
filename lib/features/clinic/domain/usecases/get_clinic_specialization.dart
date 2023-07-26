import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/clinic_specialization_response.dart';
import '../repositories/clinic_repository.dart';

class GetClinicSpecialization
    implements UseCase<ClinicSpecializationResponse, NoParams> {
  final ClinicRepository clinicRepository;

  GetClinicSpecialization(this.clinicRepository);
  @override
  DataResponse<ClinicSpecializationResponse> call(NoParams params) async {
    return clinicRepository.getClinicSpecialization();
  }
}
