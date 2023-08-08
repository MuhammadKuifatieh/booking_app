import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/show_car_office_response.dart';
import '../repositories/car_office_repository.dart';

class ShowCarOffice
    implements UseCase<ShowCarOfficeResponse, ShowCarOfficeParams> {
  final CarOfficeRepository carOfficeRepository;

  ShowCarOffice(this.carOfficeRepository);
  @override
  DataResponse<ShowCarOfficeResponse> call(ShowCarOfficeParams params) async {
    return carOfficeRepository.showCarOffice(params.carOfficeId);
  }
}

class ShowCarOfficeParams with Params {
  final int carOfficeId;

  ShowCarOfficeParams({required this.carOfficeId});
}
