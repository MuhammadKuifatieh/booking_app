import '../../../../core/config/typedef.dart';
import '../../../../core/usecase/use_case.dart';
import '../../data/models/car_offices_response.dart';
import '../repositories/car_office_repository.dart';

class GetCarOffices
    implements UseCase<CarOfficesResponse, GetCarOfficesParams> {
  final CarOfficeRepository carOfficeRepository;

  GetCarOffices(this.carOfficeRepository);
  @override
  DataResponse<CarOfficesResponse> call(GetCarOfficesParams params) async {
    return carOfficeRepository.getCarOffices(params.getParams());
  }
}

class GetCarOfficesParams with Params {
  final int page;
  final int perPage;
  final int? cityId;
  final String? name;

  GetCarOfficesParams({
    required this.page,
    required this.perPage,
    this.cityId,
    this.name,
  });

  @override
  QueryParams getParams() => {
        "page": page.toString(),
        "perPage": perPage.toString(),
        if (cityId != null) "filter[cityId]": cityId.toString(),
        if (name != null && name!.isNotEmpty) "filter[name]": name!,
      };
}
