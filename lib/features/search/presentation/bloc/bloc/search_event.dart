part of 'search_bloc.dart';

sealed class SearchEvent {
  const SearchEvent();
}

class GetCarOfficesToSearchEvent extends SearchEvent with EventWithReload {
  @override
  final bool isReload;
  GetCarOfficesToSearchEvent({this.isReload = false});
}

class GetClinicsToSearchEvent extends SearchEvent with EventWithReload {
  @override
  final bool isReload;

  GetClinicsToSearchEvent({this.isReload = false});
}

class GetRestaurantsToSearchEvent extends SearchEvent with EventWithReload {
  @override
  final bool isReload;

  GetRestaurantsToSearchEvent({this.isReload = false});
}

class GetHotelsToSearchEvent extends SearchEvent with EventWithReload {
  @override
  final bool isReload;

  GetHotelsToSearchEvent({this.isReload = false});
}

class SetTextFilterToSearchEvent extends SearchEvent {
  final String name;

  SetTextFilterToSearchEvent({required this.name});
}

class SetCityIdFilterToSearcEvent extends SearchEvent {
  final int? cityId;
  SetCityIdFilterToSearcEvent({required this.cityId});
}
