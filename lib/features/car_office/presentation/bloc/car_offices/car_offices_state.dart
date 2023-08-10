// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'car_offices_bloc.dart';

enum GetCarOfficesStatus { init, loading, failed, succ }

class CarOfficesState {
  final bool isEndPage;
  final List<CarOfficeModel> carOffices;
  final GetCarOfficesStatus getCarOfficesStatus;
  const CarOfficesState({
    this.isEndPage = false,
    this.carOffices = const [],
    this.getCarOfficesStatus = GetCarOfficesStatus.init,
  });

  CarOfficesState copyWith({
    bool? isEndPage,
    List<CarOfficeModel>? carOffices,
    GetCarOfficesStatus? getCarOfficesStatus,
  }) {
    return CarOfficesState(
      isEndPage: isEndPage ?? this.isEndPage,
      carOffices: carOffices ?? this.carOffices,
      getCarOfficesStatus: getCarOfficesStatus ?? this.getCarOfficesStatus,
    );
  }
}
