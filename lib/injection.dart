import 'package:get_it/get_it.dart';

import 'features/splash/presentation/bloc/splash_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async => _appDependencies();

Future<void> _appDependencies() async {
  serviceLocator.registerLazySingleton<SplashBloc>(() => SplashBloc());
}
