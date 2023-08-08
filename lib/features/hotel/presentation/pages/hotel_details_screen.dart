import 'package:booking_app/core/extensions/gradian.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/constant/svg_paths.dart';
import '../../../../core/presentation/widgets/favorite_button.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../../../../core/presentation/widgets/map_card_widget.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../../../../core/presentation/widgets/place_info_widget.dart';
import '../bloc/hotel_details/hotel_details_bloc.dart';
import 'room_screen.dart';

class HotelDetailsScreen extends StatefulWidget {
  static const routeName = "hotel_details_screen";
  const HotelDetailsScreen({super.key, required this.arg});
  final HotelDetailsScreenParams arg;

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  late Size size;
  late HotelBloc hotelBloc;
  @override
  void initState() {
    hotelBloc = HotelBloc()..add(ShowHotelEvent(hotelId: widget.arg.hotelId));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => hotelBloc,
      child: Scaffold(
        body: BlocConsumer<HotelBloc, HotelState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.showHotelStatus == ShowHotelStatus.loading ||
                state.showHotelStatus == ShowHotelStatus.init) {
              return const MainLoadingWidget();
            } else if (state.showHotelStatus == ShowHotelStatus.faild) {
              return MainErrorWidget(
                  size: size,
                  onTap: () {
                    hotelBloc.add(ShowHotelEvent(hotelId: widget.arg.hotelId));
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
                          imageUrl: state.hotel!.image!.mediaUrl!,
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
                              vertical: size.width * .025,
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
                                onTap: () {},
                                isFavorite: state.hotel!.isFavorite!,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: size.width * .02,
                            left: size.width * .02,
                            child: Text(
                              state.hotel!.name!,
                              style: AppTextStyles.styleWeight900(
                                fontSize: size.width * .065,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                    if (state.hotel!.about != null)
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
                            Text(state.hotel!.about ?? ("data " * 25)),
                          ],
                        ),
                      ),
                    SizedBox(height: size.width * .03),
                    PlaceInfoWidget(
                      size: size,
                      title: "Hotel",
                      cityName: state.hotel!.city!.name!,
                      placeContact: state.hotel!.placeContact!,
                    ),
                    const SizedBox(height: 20),
                    MapCardWidget(
                      size: size,
                      title: state.hotel!.name!,
                      latLng: LatLng(
                        double.parse(state.hotel!.placeContact!.latitude!),
                        double.parse(state.hotel!.placeContact!.longitude!),
                      ),
                    ),
                    const SizedBox(height: 100)
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: BlocBuilder<HotelBloc, HotelState>(
          builder: (context, state) {
            if (state.showHotelStatus != ShowHotelStatus.succ) {
              return Container();
            }
            return MainButton(
              size: size,
              width: size.width * .8,
              height: size.width * .15,
              text: "Select Room",
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RoomScreen.routeName,
                  arguments: RoomScreenParams(
                    hotelId: state.hotel!.id!,
                    roomTypes: state.hotel!.roomTypes!,
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

class HotelDetailsScreenParams {
  final int hotelId;

  HotelDetailsScreenParams({required this.hotelId});
}
