import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/post_api.dart';

import '../../../../core/config/typedef.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/get_api.dart';
import '../models/clinic_specialization_response.dart';
import '../models/clinics_response.dart';
import '../models/show_clinic_respnse.dart';

class RemoteClinicDataSource {
  Future<ClinicSpecializationResponse> getclinicSpecialization() async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getclinicSpecialization(),
      fromJson: clinicSpecializationResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<ClinicsResponse> getClinics(QueryParams params) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.getClinics(params),
      fromJson: clinicsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<ShowClinicsResponse> showClinic(int clinicId) async {
    final GetApi getApi = GetApi(
      uri: ApiVariables.showClinic(clinicId),
      fromJson: showClinicsResponseFromJson,
    );
    final result = await getApi.callRequest();
    return result;
  }

  Future<NoResponse> bookingClinic(BodyMap body) async {
    final PostApi postApi = PostApi(
      uri: ApiVariables.bookingClinic(),
      body: body,
      fromJson: noResponseFromJson,
    );
    final result = await postApi.callRequest();
    return result;
  }
}
