import 'package:booking_app/features/owner_booking/presentation/pages/my_car_office_screen.dart';
import 'package:booking_app/features/owner_booking/presentation/pages/my_clinic_screen.dart';
import 'package:booking_app/features/owner_booking/presentation/pages/my_hotels_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../favorites/presentation/pages/my_favorites_screen.dart';
import '../bloc/owner_booking/owner_booking_bloc.dart';
import 'my_restaurant_screen.dart';

class MyPlacesScreen extends StatefulWidget {
  static const routeName = "";
  const MyPlacesScreen({super.key});

  @override
  State<MyPlacesScreen> createState() => _MyPlacesScreenState();
}

class _MyPlacesScreenState extends State<MyPlacesScreen>
    with SingleTickerProviderStateMixin {
  late Size size;
  late final TabController tabController;
  late final OwnerBookingBloc ownerBookingBloc;
  @override
  void initState() {
    ownerBookingBloc = OwnerBookingBloc()
      ..add(GetOwnerCarOfficesEvent())
      ..add(GetOwnerClinicsEvent())
      ..add(GetOwnerHotelsEvent())
      ..add(GetOwnerRestaurantsEvent());
    tabController = TabController(length: 4, vsync: this);
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
      create: (context) => ownerBookingBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "My Places",
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
        body: BlocConsumer<OwnerBookingBloc, OwnerBookingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return TabBarView(
              controller: tabController,
              children: [
                ListCardsCarOffice(
                  size: size,
                  carOffices: state.carOffices,
                  isLoading: state.getOwnerCarOfficesStatus ==
                          GetOwnerCarOfficesStatus.init ||
                      state.getOwnerCarOfficesStatus ==
                          GetOwnerCarOfficesStatus.loading,
                  isFailed: state.getOwnerCarOfficesStatus ==
                      GetOwnerCarOfficesStatus.failed,
                  onTapRetry: () {
                    ownerBookingBloc.add(GetOwnerCarOfficesEvent());
                  },
                  onTapCard: (carOfficeId) {
                    Navigator.of(context).pushNamed(
                      MyCarOfficeScreen.routeName,
                      arguments: MyCarOfficeScreenParams(
                        carOfficeId: carOfficeId,
                      ),
                    );
                  },
                ),
                ListCardsClinic(
                  size: size,
                  clinics: state.clinics,
                  isLoading: state.getOwnerClinicsStatus ==
                          GetOwnerClinicsStatus.init ||
                      state.getOwnerClinicsStatus ==
                          GetOwnerClinicsStatus.loading,
                  isFailed: state.getOwnerClinicsStatus ==
                      GetOwnerClinicsStatus.failed,
                  onTapRetry: () {
                    ownerBookingBloc.add(GetOwnerClinicsEvent());
                  },
                  onTapCard: (clinicId) {
                    Navigator.of(context).pushNamed(
                      MyClinicScreen.routeName,
                      arguments: MyClinicScreenParams(
                        clinicId: clinicId,
                      ),
                    );
                  },
                ),
                ListCardsHotel(
                  size: size,
                  hotels: state.hotels,
                  isLoading:
                      state.getOwnerHotelsStatus == GetOwnerHotelsStatus.init ||
                          state.getOwnerHotelsStatus ==
                              GetOwnerHotelsStatus.loading,
                  isFailed:
                      state.getOwnerHotelsStatus == GetOwnerHotelsStatus.failed,
                  onTapRetry: () {
                    ownerBookingBloc.add(GetOwnerHotelsEvent());
                  },
                  onTapCard: (hotelId) {
                    Navigator.of(context).pushNamed(
                      MyHotelScreen.routeName,
                      arguments: MyHotelScreenParams(
                        hotelId: hotelId,
                      ),
                    );
                  },
                ),
                ListCardsResturant(
                  size: size,
                  restaurants: state.restaurants,
                  isLoading: state.getOwnerRestaurantsStatus ==
                          GetOwnerRestaurantsStatus.init ||
                      state.getOwnerRestaurantsStatus ==
                          GetOwnerRestaurantsStatus.loading,
                  isFailed: state.getOwnerRestaurantsStatus ==
                      GetOwnerRestaurantsStatus.failed,
                  onTapRetry: () {
                    ownerBookingBloc.add(GetOwnerRestaurantsEvent());
                  },
                  onTapCard: (restaurantId) {
                    Navigator.of(context).pushNamed(
                      MyRestaurantScreen.routeName,
                      arguments: MyRestaurantScreenParans(
                        restaurantId: restaurantId,
                      ),
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
