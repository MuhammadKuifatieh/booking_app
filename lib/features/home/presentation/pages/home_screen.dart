import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../../../clinic/presentation/widgets/clinic_card.dart';
import '../../../hotel/presentation/widgets/hotel_card.dart';
import '../../../resturant/presentation/widgets/resturant_card.dart';
import '../bloc/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  late final HomeBloc homeBloc;
  @override
  void initState() {
    homeBloc = HomeBloc()
      ..add(GetClinicsMostVisitEvent())
      ..add(GetHotelLastAddEvent())
      ..add(GetHotelMostPopularEvent())
      ..add(GetRestaurantsMostFavoriteEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.sizeOf(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "Booking App",
          hasPop: false,
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            if ((state.getClinicsMostVisitStatus ==
                        GetClinicsMostVisitStatus.loading ||
                    state.getHotelLastAddStatus ==
                        GetHotelLastAddStatus.loading ||
                    state.getHotelMostPopularStatus ==
                        GetHotelMostPopularStatus.loading ||
                    state.getRestaurantsMostFavoriteStatus ==
                        GetRestaurantsMostFavoriteStatus.loading) ||
                (state.getClinicsMostVisitStatus ==
                        GetClinicsMostVisitStatus.init ||
                    state.getHotelLastAddStatus == GetHotelLastAddStatus.init ||
                    state.getHotelMostPopularStatus ==
                        GetHotelMostPopularStatus.init ||
                    state.getRestaurantsMostFavoriteStatus ==
                        GetRestaurantsMostFavoriteStatus.init)) {
              return const MainLoadingWidget();
            } else if ((state.getClinicsMostVisitStatus ==
                    GetClinicsMostVisitStatus.faild ||
                state.getHotelLastAddStatus == GetHotelLastAddStatus.faild ||
                state.getHotelMostPopularStatus ==
                    GetHotelMostPopularStatus.faild ||
                state.getRestaurantsMostFavoriteStatus ==
                    GetRestaurantsMostFavoriteStatus.faild)) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  if (state.getClinicsMostVisitStatus ==
                      GetClinicsMostVisitStatus.faild) {
                    homeBloc.add(GetClinicsMostVisitEvent());
                  }
                  if (state.getHotelLastAddStatus ==
                      GetHotelLastAddStatus.loading) {
                    homeBloc.add(GetHotelLastAddEvent());
                  }
                  if (state.getHotelMostPopularStatus ==
                      GetHotelMostPopularStatus.faild) {
                    homeBloc.add(GetHotelMostPopularEvent());
                  }
                  if (state.getRestaurantsMostFavoriteStatus ==
                      GetRestaurantsMostFavoriteStatus.faild) {
                    homeBloc.add(GetRestaurantsMostFavoriteEvent());
                  }
                },
              );
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Hotel Most Popular :",
                        style: AppTextStyles.styleWeight900(fontSize: 22),
                      ),
                    ).gradient(gradient: AppColors.secGradent),
                    SizedBox(
                      height: size.width * .7,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(15),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.hotelsMostPopular.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: HotelCard(
                              size: size,
                              inHome: true,
                              hotel: state.hotelsMostPopular[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Clinic Most Visit :",
                        style: AppTextStyles.styleWeight900(fontSize: 22),
                      ),
                    ).gradient(gradient: AppColors.secGradent),
                    SizedBox(
                      height: size.width * .45,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(15),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.clinics.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: ClinicCard(
                              size: size,
                              inHome: true,
                              clinic: state.clinics[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Hotel Last Add :",
                        style: AppTextStyles.styleWeight900(fontSize: 22),
                      ),
                    ).gradient(gradient: AppColors.secGradent),
                    SizedBox(
                      height: size.width * .7,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(15),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.hotelsLastAdd.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: HotelCard(
                              size: size,
                              inHome: true,
                              hotel: state.hotelsLastAdd[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Restaurant Most Favorite :",
                        style: AppTextStyles.styleWeight900(fontSize: 22),
                      ),
                    ).gradient(gradient: AppColors.secGradent),
                    SizedBox(
                      height: size.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(15),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.restaurants.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: RestaurantCard(
                              size: size,
                              restaurant: state.restaurants[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
