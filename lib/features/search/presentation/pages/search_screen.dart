import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constant/svg_paths.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/models/city_model.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';
import '../../../../injection.dart';
import '../../../favorites/presentation/pages/my_favorites_screen.dart';
import '../../../splash/presentation/bloc/splash_bloc.dart';
import '../bloc/bloc/search_bloc.dart';
import 'show_location_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search_screen";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late Size size;
  late TextEditingController searchContoller;
  late final TabController tabController;
  late SearchBloc searchBloc;

  @override
  void initState() {
    searchBloc = SearchBloc();
    searchContoller = TextEditingController();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => searchBloc,
        child: Scaffold(
          appBar: MainAppBar(
            size: size,
            hasPop: false,
            title: "search",
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
          body: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: size.width * .05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: MainTextFailed(
                      hint: "search",
                      icon: Icons.search,
                      controller: searchContoller,
                      onChanged: (name) {
                        searchBloc.add(SetTextFilterToSearchEvent(name: name));
                      },
                    ),
                  ),
                  SizedBox(height: size.width * .05),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Container(
                      color: AppColors.backgroundColor,
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      child: Padding(
                        padding: const EdgeInsets.all(12.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showBottomSheet(
                                  context: context,
                                  builder: (_) => NewWidget(
                                    size: size,
                                    searchBloc: searchBloc,
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    SvgPaths.filter,
                                    width: size.width * .055,
                                  ),
                                  const SizedBox(width: 7.5),
                                  Text(
                                    "Filter",
                                    style: AppTextStyles.styleWeight500(
                                      fontSize: size.width * .04,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // showBottomSheet(
                                //   context: context,
                                //   builder: (_) => ShowLocationScreen(
                                //     arg: ShowLocationScreenParams(
                                //       location: const LatLng(35, 38),
                                //     ),
                                //   ),
                                // );
                                Navigator.of(context).pushNamed(
                                  ShowLocationScreen.routeName,
                                  arguments: ShowLocationScreenParams(
                                    location: const LatLng(35, 38),
                                    locations: state.loctions,
                                  ),
                                );
                              },
                              child: Text(
                                "Map",
                                style: AppTextStyles.styleWeight500(
                                  fontSize: size.width * .05,
                                ),
                              ).gradient(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: tabController,
                    children: [
                      ListCardsCarOffice(
                        size: size,
                        carOffices: state.carOffices,
                        isLoading: state.getCarOfficesToSearchStatus ==
                            GetCarOfficesToSearchStatus.loading,
                        isFailed: state.getCarOfficesToSearchStatus ==
                            GetCarOfficesToSearchStatus.failed,
                        onTapRetry: () {
                          searchBloc.add(GetCarOfficesToSearchEvent());
                        },
                      ),
                      ListCardsClinic(
                        size: size,
                        clinics: state.clinics,
                        isLoading: state.getClinicsToSearchStatus ==
                            GetClinicsToSearchStatus.loading,
                        isFailed: state.getClinicsToSearchStatus ==
                            GetClinicsToSearchStatus.failed,
                        onTapRetry: () {
                          searchBloc.add(GetClinicsToSearchEvent());
                        },
                      ),
                      ListCardsHotel(
                        size: size,
                        hotels: state.hotels,
                        isLoading: state.getHotelsToSearchStatus ==
                            GetHotelsToSearchStatus.loading,
                        isFailed: state.getHotelsToSearchStatus ==
                            GetHotelsToSearchStatus.failed,
                        onTapRetry: () {
                          searchBloc.add(GetHotelsToSearchEvent());
                        },
                      ),
                      ListCardsResturant(
                        size: size,
                        restaurants: state.restaurants,
                        isLoading: state.getHotelsToSearchStatus ==
                            GetHotelsToSearchStatus.loading,
                        isFailed: state.getHotelsToSearchStatus ==
                            GetHotelsToSearchStatus.failed,
                        onTapRetry: () {
                          searchBloc.add(GetHotelsToSearchEvent());
                        },
                      ),
                    ],
                  )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({
    super.key,
    required this.size,
    required this.searchBloc,
  });
  final SearchBloc searchBloc;
  final Size size;
  final ValueNotifier<CityModel> selectedCity =
      ValueNotifier(CityModel(id: 0, name: "All"));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: size.width * .1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .025),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_outlined,
                        color: AppColors.blackText,
                        size: size.width * .075,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Filter",
                        style: AppTextStyles.styleWeight900(
                            fontSize: size.width * .045),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                NeumorphicButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: NeumorphicStyle(
                    color: AppColors.backgroundColor,
                    depth: 10,
                    shape: NeumorphicShape.flat,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
                  ),
                  child: Text(
                    "RESET",
                    style: AppTextStyles.styleWeight500(
                        fontSize: size.width * .04),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.width * .025),
          Container(
            height: 1,
            color: Colors.white,
          ),
          SizedBox(height: size.width * .02),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      Text(
                        "City : ",
                        style: AppTextStyles.styleWeight600(
                          fontSize: size.width * .04,
                        ),
                      ),
                      const SizedBox(width: 12),
                      ValueListenableBuilder<CityModel>(
                          valueListenable: selectedCity,
                          builder: (context, value, _) {
                            return DropdownButton<CityModel>(
                              value: value,
                              items: (List.of(
                                      serviceLocator<SplashBloc>().state.cities)
                                    ..insert(0, CityModel(id: 0, name: "All")))
                                  .map(
                                (e) {
                                  log(e.name!);
                                  return DropdownMenuItem<CityModel>(
                                    value: e,
                                    child: Text(e.name!),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) {
                                selectedCity.value = value!;
                                searchBloc.add(SetCityIdFilterToSearcEvent(
                                    cityId: value.id));
                              },
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          MainButton(
            size: size,
            text: "Apply",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(height: size.width * .05),
        ],
      ),
    );
  }
}
