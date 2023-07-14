import 'package:flutter/material.dart';

import '../core/presentation/pages/paymant_screen.dart';
import '../features/auth/presentation/pages/login_screen.dart';
import '../features/auth/presentation/pages/register_screen.dart';
import '../features/category/presentation/pages/category_screen.dart';
import '../features/clinic/presentation/pages/clicnic_detailes_screen.dart';
import '../features/clinic/presentation/pages/clinic_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/hotel/presentation/pages/hotel_details_screen.dart';
import '../features/hotel/presentation/pages/hotel_screen.dart';
import '../features/hotel/presentation/pages/room_screen.dart';
import '../features/main/presentation/pages/main_screen.dart';
import '../features/notifcation/presentation/pages/notificaton_screen.dart';
import '../features/profile/presentation/pages/profile_screen.dart';
import '../features/resturant/presentation/pages/restaurant_details_screen.dart';
import '../features/resturant/presentation/pages/resturant_screen.dart';
import '../features/search/presentation/pages/search_screen.dart';
import '../features/trip/presentation/pages/trip_screen.dart';

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
      case PaymentScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(
            arg: routeSettings.arguments as PaymentScreenParams,
          ),
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
      case HotelScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HotelScreen(),
          settings: routeSettings,
        );
      case HotelDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HotelDetailsScreen(),
          settings: routeSettings,
        );
      case RoomScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const RoomScreen(), settings: routeSettings);
      case ClinicScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ClinicScreen(),
          settings: routeSettings,
        );
      case ResturantScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ResturantScreen(),
          settings: routeSettings,
        );
      case RestaurantDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RestaurantDetailsScreen(),
        );
      case TripScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const TripScreen(),
          settings: routeSettings,
        );
      case ClinicDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ClinicDetailsScreen(),
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
