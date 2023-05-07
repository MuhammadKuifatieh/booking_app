import 'package:booking_app/features/category/presentation/pages/category_screen.dart';
import 'package:booking_app/features/home/presentation/pages/home_screen.dart';
import 'package:booking_app/features/main/presentation/pages/main_screen.dart';
import 'package:booking_app/features/notifcation/presentation/pages/notificaton_screen.dart';
import 'package:booking_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:booking_app/features/search/presentation/pages/search_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/pages/login_screen.dart';
import '../features/auth/presentation/pages/register_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: routeSettings,
        );

      case RegisterScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
          settings: routeSettings,
        );

      case MainScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
          settings: routeSettings,
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: routeSettings,
        );
      case CategoryScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
          settings: routeSettings,
        );
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SearchScreen(),
          settings: routeSettings,
        );
      case NotificationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
          settings: routeSettings,
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: routeSettings,
        );
    }
    return null;
  }
}
