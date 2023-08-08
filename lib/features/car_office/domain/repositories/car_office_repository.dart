import '../../../../core/config/typedef.dart';
import '../../data/models/car_offices_response.dart';
import '../../data/models/show_car_office_response.dart';

abstract class CarOfficeRepository {
  DataResponse<CarOfficesResponse> getCarOffices(QueryParams params);

  DataResponse<ShowCarOfficeResponse> showCarOffice(int carOfficeId);
}
