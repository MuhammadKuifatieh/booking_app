import 'package:booking_app/core/models/hotel_model.dart';
import 'package:booking_app/core/models/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/models/car_office_model.dart';
import '../../../../core/models/clinic_model.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../../../car_office/presentation/widgets/car_office_card.dart';
import '../../../clinic/presentation/widgets/clinic_card.dart';
import '../../../hotel/presentation/widgets/hotel_card.dart';
import '../../../resturant/presentation/widgets/resturant_card.dart';
import '../bloc/favorites_bloc.dart';

class MyFavoritesScreen extends StatefulWidget {
  static const routeName = "my_favorites";
  const MyFavoritesScreen({super.key});

  @override
  State<MyFavoritesScreen> createState() => _MyFavoritesScreenState();
}

class _MyFavoritesScreenState extends State<MyFavoritesScreen>
    with SingleTickerProviderStateMixin {
  late Size size;
  late final TabController tabController;
  late final FavoritesBloc favoritesBloc;
  @override
  void initState() {
    favoritesBloc = FavoritesBloc()
      ..add(GetFavoriteCarOfficesEvent())
      ..add(GetFavoriteClinicEvent())
      ..add(GetFavoriteHotelsEvent())
      ..add(GetFavoriteRestaurantsEvent());
    tabController = TabController(
      length: 4,
      vsync: this,
    );
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
      create: (context) => favoritesBloc,
      child: Scaffold(
        appBar: MainAppBar(
          title: "My Favorites",
          size: size,
          height: size.height * .125,
          bottom: TabBar(
            controller: tabController,
            isScrollable: true,
            labelStyle: AppTextStyles.styleWeight700(
              fontSize: 18,
            ),
            labelColor: AppColors.orangeGradientEnd,
            unselectedLabelColor: AppColors.orangeDarkGradientStart,
            unselectedLabelStyle: AppTextStyles.styleWeight400(
                fontSize: 16, color: AppColors.orangeGradientStart),
            tabs: const [
              Tab(
                text: "Car Office",
              ),
              Tab(
                text: "Clinic",
              ),
              Tab(
                text: "Hotel",
              ),
              Tab(
                text: "Restaurant",
              ),
            ],
          ),
        ),
        body: BlocConsumer<FavoritesBloc, FavoritesState>(
          listener: (context, state) {},
          builder: (context, state) {
            return TabBarView(
              controller: tabController,
              children: [
                ListCardsCarOffice(
                  size: size,
                  isLoading: state.getFavoriteCarOfficesStatus ==
                          GetFavoriteCarOfficesStatus.loading ||
                      state.getFavoriteCarOfficesStatus ==
                          GetFavoriteCarOfficesStatus.init,
                  isFailed: state.getFavoriteCarOfficesStatus ==
                      GetFavoriteCarOfficesStatus.failed,
                  onTapRetry: () {
                    favoritesBloc.add(GetFavoriteCarOfficesEvent());
                  },
                  carOffices: state.carOffices,
                ),
                ListCardsClinic(
                  clinics: state.clinics,
                  isLoading: (state.getFavoriteClinicStatus ==
                          GetFavoriteClinicStatus.init ||
                      state.getFavoriteClinicStatus ==
                          GetFavoriteClinicStatus.loading),
                  isFailed: state.getFavoriteClinicStatus ==
                      GetFavoriteClinicStatus.failed,
                  onTapRetry: () {
                    favoritesBloc.add(GetFavoriteClinicEvent());
                  },
                  size: size,
                ),
                ListCardsHotel(
                  size: size,
                  hotels: state.hotels,
                  isLoading: state.getFavoriteHotelsStatus ==
                          GetFavoriteHotelsStatus.init ||
                      state.getFavoriteHotelsStatus ==
                          GetFavoriteHotelsStatus.loading,
                  isFailed: state.getFavoriteHotelsStatus ==
                      GetFavoriteHotelsStatus.failed,
                  onTapRetry: () {
                    favoritesBloc.add(GetFavoriteHotelsEvent());
                  },
                ),
                ListCardsResturant(
                  size: size,
                  restaurants: state.restaurants,
                  isLoading: state.getFavoriteRestaurantsStatus ==
                          GetFavoriteRestaurantsStatus.init ||
                      state.getFavoriteRestaurantsStatus ==
                          GetFavoriteRestaurantsStatus.loading,
                  isFailed: state.getFavoriteRestaurantsStatus ==
                      GetFavoriteRestaurantsStatus.failed,
                  onTapRetry: () {
                    favoritesBloc.add(GetFavoriteRestaurantsEvent());
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ListCardsCarOffice extends StatelessWidget {
  const ListCardsCarOffice({
    super.key,
    required this.size,
    required this.carOffices,
    required this.isLoading,
    required this.isFailed,
    required this.onTapRetry,
    this.onTapCard,
  });

  final Size size;
  final List<CarOfficeModel> carOffices;
  final bool isLoading;
  final bool isFailed;
  final VoidCallback onTapRetry;
  final void Function(int)? onTapCard;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const MainLoadingWidget();
    } else if (isFailed) {
      return MainErrorWidget(size: size, onTap: onTapRetry);
    } else if (carOffices.isEmpty) {
      return Center(
        child: Text(
          "No Car Office to show",
          style: AppTextStyles.styleWeight700(fontSize: 20),
        ).gradient(),
      );
    }
    return ListView.builder(
      itemCount: carOffices.length,
      itemBuilder: (context, index) {
        return CarOfficeCard(
          size: size,
          carOffice: carOffices[index],
          onTap: onTapCard != null
              ? () {
                  onTapCard!(carOffices[index].id!);
                }
              : null,
        );
      },
    );
  }
}

class ListCardsClinic extends StatelessWidget {
  const ListCardsClinic({
    super.key,
    required this.size,
    required this.clinics,
    required this.isLoading,
    required this.isFailed,
    required this.onTapRetry,
    this.onTapCard,
  });

  final Size size;
  final List<ClinicModel> clinics;
  final bool isLoading;
  final bool isFailed;
  final VoidCallback onTapRetry;
  final void Function(int)? onTapCard;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const MainLoadingWidget();
    } else if (isFailed) {
      return MainErrorWidget(size: size, onTap: onTapRetry);
    } else if (clinics.isEmpty) {
      return Center(
        child: Text(
          "No Clinic to show",
          style: AppTextStyles.styleWeight700(fontSize: 20),
        ).gradient(),
      );
    }
    return ListView.builder(
      itemCount: clinics.length,
      itemBuilder: (context, index) {
        return ClinicCard(
          size: size,
          clinic: clinics[index],
          onTap: onTapCard != null
              ? () {
                  onTapCard!(clinics[index].id!);
                }
              : null,
        );
      },
    );
  }
}

class ListCardsHotel extends StatelessWidget {
  const ListCardsHotel({
    super.key,
    required this.size,
    required this.hotels,
    required this.isLoading,
    required this.isFailed,
    required this.onTapRetry,
    this.onTapCard,
  });

  final Size size;
  final List<HotelModel> hotels;
  final bool isLoading;
  final bool isFailed;
  final VoidCallback onTapRetry;
  final void Function(int)? onTapCard;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const MainLoadingWidget();
    } else if (isFailed) {
      return MainErrorWidget(size: size, onTap: onTapRetry);
    } else if (hotels.isEmpty) {
      return Center(
        child: Text(
          "No Hotels to show",
          style: AppTextStyles.styleWeight700(fontSize: 20),
        ).gradient(),
      );
    }
    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        return HotelCard(
          size: size,
          hotel: hotels[index],
          onTap: onTapCard != null
              ? () {
                  onTapCard!(hotels[index].id!);
                }
              : null,
        );
      },
    );
  }
}

class ListCardsResturant extends StatelessWidget {
  const ListCardsResturant({
    super.key,
    required this.size,
    required this.restaurants,
    required this.isLoading,
    required this.isFailed,
    required this.onTapRetry,
    this.onTapCard,
  });

  final Size size;
  final List<RestaurantModel> restaurants;
  final bool isLoading;
  final bool isFailed;
  final VoidCallback onTapRetry;
  final void Function(int)? onTapCard;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const MainLoadingWidget();
    } else if (isFailed) {
      return MainErrorWidget(size: size, onTap: onTapRetry);
    } else if (restaurants.isEmpty) {
      return Center(
        child: Text(
          "No Restaurants to show",
          style: AppTextStyles.styleWeight700(fontSize: 20),
        ).gradient(),
      );
    }
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        return RestaurantCard(
          size: size,
          restaurant: restaurants[index],
          onTap: onTapCard != null
              ? () {
                  onTapCard!(restaurants[index].id!);
                }
              : null,
        );
      },
    );
  }
}
