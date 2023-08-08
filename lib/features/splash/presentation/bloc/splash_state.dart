part of 'splash_bloc.dart';

enum GetCitiesStatus { init, loading, succ, failed }

enum AuthStatus { init, auth, unAuth, isFirstOpen }

class SplashState {
  final List<CityModel> cities;
  final AuthStatus authStatus;
  final GetCitiesStatus getCitiesStatus;
  const SplashState({
    this.cities = const [],
    this.authStatus = AuthStatus.init,
    this.getCitiesStatus = GetCitiesStatus.init,
  });

  SplashState copyWith({
    List<CityModel>? cities,
    AuthStatus? authStatus,
    GetCitiesStatus? getCitiesStatus,
  }) {
    return SplashState(
      cities: cities ?? this.cities,
      authStatus: authStatus ?? this.authStatus,
      getCitiesStatus: getCitiesStatus ?? this.getCitiesStatus,
    );
  }
}
