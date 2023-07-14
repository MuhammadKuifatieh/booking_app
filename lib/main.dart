import 'package:booking_app/core/config/app_them.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'features/auth/presentation/pages/login_screen.dart';
import 'router/app_router.dart';

void main() {
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
      home: const LoginScreen(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
