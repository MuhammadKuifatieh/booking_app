import 'package:booking_app/core/presentation/pages/map_pick_location.dart';
import 'package:booking_app/features/car_office/presentation/pages/car_office_details_screen.dart';
import 'package:booking_app/features/customer_booking/presentation/pages/customer_booking_screen.dart';
import 'package:booking_app/features/favorites/presentation/pages/my_favorites_screen.dart';
import 'package:booking_app/features/owner_booking/presentation/pages/my_car_office_screen.dart';
import 'package:booking_app/features/owner_booking/presentation/pages/my_clinic_screen.dart';
import 'package:booking_app/features/owner_booking/presentation/pages/my_hotels_screen.dart';
import 'package:booking_app/features/owner_booking/presentation/pages/my_places_screen.dart';
import 'package:booking_app/features/owner_booking/presentation/pages/my_restaurant_screen.dart';
import 'package:booking_app/features/search/presentation/pages/show_location_screen.dart';
import 'package:booking_app/features/splash/presentation/pages/on_boarder_screen.dart';
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
import '../features/splash/presentation/pages/splash_screen.dart';
import '../features/car_office/presentation/pages/car_office_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case OnBoarderScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const OnBoarderScreen(),
        );
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: routeSettings,
        );
      case MapPickLocation.routeName:
        return MaterialPageRoute(
          builder: (_) => const MapPickLocation(),
          settings: routeSettings,
        );
      case ShowLocationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ShowLocationScreen(
            arg: routeSettings.arguments as ShowLocationScreenParams,
          ),
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
          builder: (_) => HotelDetailsScreen(
            arg: routeSettings.arguments as HotelDetailsScreenParams,
          ),
          settings: routeSettings,
        );
      case RoomScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => RoomScreen(
                  arg: routeSettings.arguments as RoomScreenParams,
                ),
            settings: routeSettings);
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
          builder: (_) => RestaurantDetailsScreen(
            arg: routeSettings.arguments as RestaurantDetailsScreenParams,
          ),
        );
      case ClinicDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ClinicDetailsScreen(
            arg: routeSettings.arguments as ClinicDetailsScreenParams,
          ),
          settings: routeSettings,
        );
      case CarOfficeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const CarOfficeScreen(),
          settings: routeSettings,
        );
      case CarOfficeDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => CarOfficeDetailsScreen(
            arg: routeSettings.arguments as CarOfficeDetailsScreenParams,
          ),
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
      case CustomerBookingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const CustomerBookingScreen(),
          settings: routeSettings,
        );
      case MyFavoritesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MyFavoritesScreen(),
          settings: routeSettings,
        );
      case MyPlacesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MyPlacesScreen(),
          settings: routeSettings,
        );
      case MyRestaurantScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MyRestaurantScreen(
            arg: routeSettings.arguments as MyRestaurantScreenParans,
          ),
          settings: routeSettings,
        );
      case MyCarOfficeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MyCarOfficeScreen(
            arg: routeSettings.arguments as MyCarOfficeScreenParams,
          ),
          settings: routeSettings,
        );
      case MyClinicScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MyClinicScreen(
            arg: routeSettings.arguments as MyClinicScreenParams,
          ),
          settings: routeSettings,
        );
      case MyHotelScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MyHotelScreen(
            arg: routeSettings.arguments as MyHotelScreenParams,
          ),
          settings: routeSettings,
        );
    }
    return null;
  }
}
