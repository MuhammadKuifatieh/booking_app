import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/clinic_repository.dart';

class BookingClinic implements UseCase<NoResponse, BookingClinicParams> {
  final ClinicRepository clinicRepository;

  BookingClinic(this.clinicRepository);
  @override
  DataResponse<NoResponse> call(BookingClinicParams params) async {
    return clinicRepository.bookingClinic(params.getBody());
  }
}

class BookingClinicParams with Params {
  final String date;
  final int clinicSessionId;

  BookingClinicParams({
    required this.date,
    required this.clinicSessionId,
  });

  @override
  BodyMap getBody() => {
        "clinic_visit_type": 1,
        "booking_datetime": date,
        "clinic_session_id": clinicSessionId,
        "case_description": "test",
      };
}
