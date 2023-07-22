import 'package:booking_app/features/clinic/data/models/show_clinic_respnse.dart';

import '../../data/models/clinics_response.dart';

import '../../../../core/config/typedef.dart';
import '../../data/models/clinic_specialization_response.dart';

abstract class ClinicRepository {
  DataResponse<ClinicSpecializationResponse> getClinicSpecialization();

  DataResponse<ClinicsResponse> getClinics(QueryParams params);

  DataResponse<ShowClinicsResponse> showClinic(int clinicId);
}
