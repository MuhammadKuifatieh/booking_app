import 'package:booking_app/core/config/toast.dart';
import 'package:booking_app/features/car_office/domain/usecases/booking_car_office.dart';
import 'package:booking_app/features/car_office/presentation/pages/car_office_screen.dart';
import 'package:booking_app/features/main/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/pages/paymant_screen.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../../../../core/presentation/widgets/map_card_widget.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../../../../core/presentation/widgets/place_info_widget.dart';
import '../bloc/car_office_details/car_office_details_bloc.dart';
import '../widgets/booking_cart_office_bottom_sheet.dart';

class CarOfficeDetailsScreen extends StatefulWidget {
  static const routeName = "car_office_details";
  const CarOfficeDetailsScreen({
    super.key,
    required this.arg,
  });

  final CarOfficeDetailsScreenParams arg;

  @override
  State<CarOfficeDetailsScreen> createState() => _CarOfficeDetailsScreenState();
}

class _CarOfficeDetailsScreenState extends State<CarOfficeDetailsScreen> {
  late Size size;
  late final CarOfficeDetailsBloc carOfficeDetailsBloc;

  @override
  void initState() {
    carOfficeDetailsBloc = CarOfficeDetailsBloc()
      ..add(ShowCarOfficeDetailsEvent(carOfficeId: widget.arg.carOfficeId));
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
      create: (context) => carOfficeDetailsBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: widget.arg.carOfficeName,
          centerTitle: false,
        ),
        body: BlocConsumer<CarOfficeDetailsBloc, CarOfficeDetailsState>(
          listener: (context, state) {
            if (state.bookingCarOfficeStatus ==
                BookingCarOfficeStatus.loading) {
              Toast.showLoading();
            } else if (state.bookingCarOfficeStatus ==
                BookingCarOfficeStatus.failed) {
              Toast.closeAllLoading();
              Toast.showText(text: "something wrong");
              Navigator.of(context).pop();
            } else if (state.bookingCarOfficeStatus ==
                BookingCarOfficeStatus.succ) {
              Toast.closeAllLoading();
              Navigator.of(context).popUntil(
                (route) => (route.settings.name == CarOfficeScreen.routeName ||
                    MainScreen.routeName == route.settings.name),
              );
            }
          },
          builder: (context, state) {
            if (state.showCarOfficeStatus == ShowCarOfficeStatus.loading ||
                state.showCarOfficeStatus == ShowCarOfficeStatus.init) {
              return const MainLoadingWidget();
            } else if (state.showCarOfficeStatus ==
                ShowCarOfficeStatus.failed) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  carOfficeDetailsBloc.add(ShowCarOfficeDetailsEvent(
                    carOfficeId: widget.arg.carOfficeId,
                  ));
                },
              );
            } else {
              return Column(
                children: [
                  CacheImage(
                    width: size.width,
                    height: size.width * .75,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.orangeGradientEnd,
                        offset: Offset(0, 5),
                        blurRadius: 15,
                      ),
                    ],
                    imageUrl: state.carOffice!.image!.mediaUrl!,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: PlaceInfoWidget(
                      size: size,
                      title: "Car Office",
                      cityName: state.carOffice!.city!.name!,
                      placeContact: state.carOffice!.placeContact!,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MapCardWidget(
                      size: size,
                      title: state.carOffice!.name!,
                      latLng: LatLng(
                        double.parse(state.carOffice!.placeContact!.latitude!),
                        double.parse(state.carOffice!.placeContact!.longitude!),
                      ),
                    ),
                  ),
                  MainButton(
                    size: size,
                    text: "Bookin Car",
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) => BookingCarOfficeBottomSheet(
                          size: size,
                          carTypes: state.carOffice!.carTypes!,
                          onTap:
                              (carTypeId, carSeat, fromLocation, toLocation) {
                            Navigator.of(context).pushNamed(
                              PaymentScreen.routeName,
                              arguments: PaymentScreenParams(
                                onTapConfirm: () {
                                  carOfficeDetailsBloc.add(
                                    BookingCarOfficeEvent(
                                      BookingCarOfficeParams(
                                        carOfficeId: state.carOffice!.id!,
                                        carTypeId: carTypeId,
                                        escortsNumber: carSeat,
                                        latitudeFrom: fromLocation.latitude,
                                        longitudeFrom: fromLocation.longitude,
                                        latitudeTo: toLocation.latitude,
                                        longitudeTo: toLocation.longitude,
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
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class CarOfficeDetailsScreenParams {
  final int carOfficeId;
  final String carOfficeName;

  CarOfficeDetailsScreenParams({
    required this.carOfficeId,
    required this.carOfficeName,
  });
}
