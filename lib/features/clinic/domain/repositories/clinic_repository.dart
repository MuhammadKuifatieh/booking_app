import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../data/models/clinic_specialization_response.dart';
import '../../data/models/clinics_response.dart';
import '../../data/models/show_clinic_respnse.dart';

abstract class ClinicRepository {
  DataResponse<ClinicSpecializationResponse> getClinicSpecialization();

  DataResponse<ClinicsResponse> getClinics(QueryParams params);

  DataResponse<ShowClinicsResponse> showClinic(int clinicId);

  DataResponse<NoResponse> bookingClinic(BodyMap body);
}
