import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'core/config/app_them.dart';
import 'features/splash/presentation/pages/splash_screen.dart';
import 'injection.dart' as di;
import 'router/app_router.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      theme: AppTheme.getColor(),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
