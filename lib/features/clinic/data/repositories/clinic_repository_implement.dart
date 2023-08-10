import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/unified_api/handling_exception_manager.dart';
import '../../domain/repositories/clinic_repository.dart';
import '../datasources/remote_clinic_data_source.dart';
import '../models/clinic_specialization_response.dart';
import '../models/clinics_response.dart';
import '../models/show_clinic_respnse.dart';

class ClinicRepositoryImplement
    with HandlingExceptionManager
    implements ClinicRepository {
  final _remoteClinic = RemoteClinicDataSource();
  @override
  DataResponse<ClinicSpecializationResponse> getClinicSpecialization() async {
    return wrapHandling(
      tryCall: () async {
        final result = await _remoteClinic.getclinicSpecialization();
        return result;
      },
    );
  }

  @override
  DataResponse<ClinicsResponse> getClinics(QueryParams params) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteClinic.getClinics(params);
      return result;
    });
  }

  @override
  DataResponse<ShowClinicsResponse> showClinic(int clinicId) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteClinic.showClinic(clinicId);
      return result;
    });
  }

  @override
  DataResponse<NoResponse> bookingClinic(BodyMap body) async {
    return wrapHandling(tryCall: () async {
      final result = await _remoteClinic.bookingClinic(body);
      return result;
    });
  }
}
