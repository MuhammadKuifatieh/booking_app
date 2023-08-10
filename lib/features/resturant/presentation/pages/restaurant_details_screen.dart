import 'dart:developer';

import 'package:booking_app/core/config/toast.dart';
import 'package:booking_app/features/main/presentation/pages/main_screen.dart';

import '../../domain/usecases/booking_resturant.dart';
import 'resturant_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constant/svg_paths.dart';
import '../../../../core/enums/categories_enum.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/pages/paymant_screen.dart';
import '../../../../core/presentation/widgets/favorite_button.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../../../../core/presentation/widgets/map_card_widget.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../../../../core/presentation/widgets/place_info_widget.dart';
import '../bloc/restaurant_details/restaurant_details_bloc.dart';
import '../widgets/bookin_table_bottom_sheet.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  static const String routeName = "restaurant_details_screen";

  const RestaurantDetailsScreen({super.key, required this.arg});

  final RestaurantDetailsScreenParams arg;

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  late Size size;
  late final RestaurantDetailsBloc restaurantDetailsBloc;
  @override
  void initState() {
    restaurantDetailsBloc = RestaurantDetailsBloc()
      ..add(ShowRestaurantEvent(widget.arg.restaurantId));
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
      create: (context) => restaurantDetailsBloc,
      child: Scaffold(
        body: BlocConsumer<RestaurantDetailsBloc, RestaurantDetailsState>(
          listener: (context, state) {
            if (state.bookingRestaurantStatus ==
                BookingRestaurantStatus.loading) {
              Toast.showLoading();
            } else if (state.bookingRestaurantStatus ==
                BookingRestaurantStatus.failed) {
              Toast.closeAllLoading();
              Navigator.of(context).pop();
              Toast.showText(text: "something wrong");
            } else if (state.bookingRestaurantStatus ==
                BookingRestaurantStatus.succ) {
              Toast.closeAllLoading();
              Navigator.of(context).popUntil(
                (route) => (route.settings.name == ResturantScreen.routeName ||
                    route.settings.name == MainScreen.routeName),
              );
            }
          },
          builder: (context, state) {
            log(state.showRestaurantStatus.toString());
            if (state.showRestaurantStatus == ShowRestaurantStatus.loading ||
                state.showRestaurantStatus == ShowRestaurantStatus.init) {
              return const MainLoadingWidget();
            } else if (state.showRestaurantStatus ==
                ShowRestaurantStatus.failed) {
              return MainErrorWidget(
                  size: size,
                  onTap: () {
                    restaurantDetailsBloc
                        .add(ShowRestaurantEvent(widget.arg.restaurantId));
                  });
            }
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CacheImage(
                          width: size.width,
                          height: size.width * .6666,
                          imageUrl: state.restaurant!.image!.mediaUrl!,
                        ),
                        Container(
                          width: size.width,
                          height: size.width * .6666,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.orangeGradientStart.withOpacity(.15),
                                AppColors.orangeGradientEnd.withOpacity(.15),
                                Colors.transparent,
                              ],
                              stops: const [.1, .25, .4],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size.width * .05,
                              horizontal: size.width * .025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  radius: 17.5,
                                  backgroundColor: AppColors.grayLight,
                                  child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (bounds) =>
                                        AppColors.mainGradent.createShader(
                                      Rect.fromLTWH(
                                          0, 0, bounds.width, bounds.height),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        SvgPaths.back,
                                        width: size.width * .05,
                                        color: AppColors.offWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              FavoriteButton(
                                modelId: state.restaurant!.id!,
                                modelType: CategoriesEnum.restaurant,
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: size.width * .02,
                            left: size.width * .02,
                            child: Text(
                              state.restaurant!.name!,
                              style: AppTextStyles.styleWeight900(
                                fontSize: size.width * .065,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                    if (state.restaurant!.about != null)
                      Padding(
                        padding: EdgeInsets.symmetric(
                              horizontal: size.width * .05,
                            ) +
                            EdgeInsets.only(
                              top: size.width * .03,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About : ",
                              style: AppTextStyles.styleWeight900(fontSize: 20),
                            ).gradient(gradient: AppColors.secGradent),
                            const SizedBox(height: 10),
                            Text(state.restaurant!.about),
                          ],
                        ),
                      ),
                    SizedBox(height: size.width * .03),
                    PlaceInfoWidget(
                      size: size,
                      title: "Restaurant",
                      cityName: state.restaurant!.city!.name!,
                      placeContact: state.restaurant!.placeContact!,
                    ),
                    const SizedBox(height: 20),
                    MapCardWidget(
                      size: size,
                      title: state.restaurant!.name!,
                      latLng: LatLng(
                        double.parse(state.restaurant!.placeContact!.latitude!),
                        double.parse(
                            state.restaurant!.placeContact!.longitude!),
                      ),
                    ),
                    const SizedBox(height: 100)
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton:
            BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
          builder: (context, state) {
            if (state.showRestaurantStatus != ShowRestaurantStatus.succ) {
              return Container();
            }
            return MainButton(
              size: size,
              width: size.width * .8,
              height: size.width * .15,
              text: "Select Table Type",
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (_) => BookingTableBottomSheet(
                    size: size,
                    tableTypes: state.restaurant!.tableTypes!,
                    onTap: (tableId, days, date) {
                      Navigator.of(context).pushNamed(
                        PaymentScreen.routeName,
                        arguments: PaymentScreenParams(
                          onTapConfirm: () {
                            restaurantDetailsBloc.add(
                              BookingRestaurantEvent(
                                BookingRestaurantParams(
                                  restaurantId: state.restaurant!.id!,
                                  tableTypeId: tableId,
                                  date: date,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class RestaurantDetailsScreenParams {
  final int restaurantId;

  RestaurantDetailsScreenParams({required this.restaurantId});
}
