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
  final int? page;
  final int? perPage;
  final int? cityId;
  final int? userId;
  final String? name;

  GetCarOfficesParams({
    this.page,
    this.perPage,
    this.cityId,
    this.name,
    this.userId,
  });

  @override
  QueryParams getParams() => {
        if (page != null) "page": page.toString(),
        if (perPage != null) "perPage": perPage.toString(),
        if (cityId != null && cityId! > 0) "filter[city_id]": cityId.toString(),
        if (name != null && name!.isNotEmpty) "filter[name]": name!,
        if (userId != null) "filter[user_id]": userId.toString(),
      };
}
