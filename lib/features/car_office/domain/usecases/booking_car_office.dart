import 'package:intl/intl.dart';

import '../../../../core/config/typedef.dart';
import '../../../../core/models/no_response_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/car_office_repository.dart';

class BookingCarOffice implements UseCase<NoResponse, BookingCarOfficeParams> {
  final CarOfficeRepository carOfficeRepository;

  BookingCarOffice(this.carOfficeRepository);

  @override
  DataResponse<NoResponse> call(BookingCarOfficeParams params) async {
    return carOfficeRepository.bookingCarOffice(params.getBody());
  }
}

class BookingCarOfficeParams with Params {
  final int carOfficeId;
  final int carTypeId;
  final String escortsNumber;
  final double latitudeFrom;
  final double longitudeFrom;
  final double latitudeTo;
  final double longitudeTo;

  BookingCarOfficeParams({
    required this.carOfficeId,
    required this.carTypeId,
    required this.escortsNumber,
    required this.latitudeFrom,
    required this.longitudeFrom,
    required this.latitudeTo,
    required this.longitudeTo,
  });
  @override
  BodyMap getBody() => {
        "booking_datetime": DateFormat("yyyy-MM-dd")
            .format(DateTime.now().add(const Duration(days: 1))),
        "address_details": "test",
        "car_office_id": carOfficeId,
        "car_type_id": carTypeId,
        "latitude_from": latitudeFrom,
        "longitude_from": longitudeFrom,
        "latitude_to": latitudeTo,
        "longitude_to": longitudeTo,
        "escorts_number": escortsNumber,
      };
}
