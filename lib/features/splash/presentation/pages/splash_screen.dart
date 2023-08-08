import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../injection.dart';
import '../../../auth/presentation/pages/login_screen.dart';
import '../../../main/presentation/pages/main_screen.dart';
import '../bloc/splash_bloc.dart';
import 'on_boarder_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc splashBloc;
  @override
  void initState() {
    splashBloc = serviceLocator<SplashBloc>()..add(const CheckAuthEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: splashBloc,
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.isFirstOpen) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              OnBoarderScreen.routeName,
              (route) => false,
            );
          } else if (state.authStatus == AuthStatus.unAuth) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              LoginScreen.routeName,
              (route) => false,
            );
          } else if (state.authStatus == AuthStatus.auth) {
            if (state.getCitiesStatus == GetCitiesStatus.succ) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                MainScreen.routeName,
                (route) => false,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Booking App",
                    style: AppTextStyles.styleWeight900(fontSize: 36),
                  ).gradient(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
