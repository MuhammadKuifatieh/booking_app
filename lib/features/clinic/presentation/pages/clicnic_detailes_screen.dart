import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/presentation/pages/paymant_screen.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_button_with_border.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../../../../core/presentation/widgets/map_card_widget.dart';
import '../../../../core/presentation/widgets/network_image.dart';
import '../../../../core/presentation/widgets/place_info_widget.dart';
import '../bloc/clinic_details/clinic_details_bloc.dart';
import '../widgets/calender.dart';
import 'clinic_screen.dart';

class ClinicDetailsScreen extends StatefulWidget {
  static const String routeName = "clinic_details";
  const ClinicDetailsScreen({
    super.key,
    required this.arg,
  });
  final ClinicDetailsScreenParams arg;

  @override
  State<ClinicDetailsScreen> createState() => _ClinicDetailsScreenState();
}

class _ClinicDetailsScreenState extends State<ClinicDetailsScreen> {
  late Size size;
  late final ClinicDetailsBloc clinicDetailsBloc;
  @override
  void initState() {
    clinicDetailsBloc = ClinicDetailsBloc()
      ..add(ShowClinicDetailsEvent(clinicId: widget.arg.clinicId));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  List<String> allOpenDays = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
  List<String> openDays = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => clinicDetailsBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          centerTitle: false,
          titleWidgte: Text(
            "Appointment",
            style: AppTextStyles.styleWeight700(
              fontSize: size.width * .06,
            ),
          ),
        ),
        body: BlocConsumer<ClinicDetailsBloc, ClinicDetailsState>(
          listener: (context, state) {
            if (state.showClinicDetailsStatus == ShowClinicDetailsStatus.succ) {
              for (var index in state.clinic!.placeContact!.openDays!) {
                openDays.add(allOpenDays[index]);
              }
            }
          },
          builder: (context, state) {
            if (state.showClinicDetailsStatus ==
                    ShowClinicDetailsStatus.loading ||
                state.showClinicDetailsStatus == ShowClinicDetailsStatus.init) {
              return const MainLoadingWidget();
            }
            if (state.showClinicDetailsStatus ==
                ShowClinicDetailsStatus.failed) {
              MainErrorWidget(
                size: size,
                onTap: () {
                  clinicDetailsBloc.add(ShowClinicDetailsEvent(
                    clinicId: widget.arg.clinicId,
                  ));
                },
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: size.width * .9,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.offWhite,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.clinic!.name!,
                                    style: AppTextStyles.styleWeight900(
                                      fontSize: size.width * .045,
                                    ),
                                  ),
                                  Text(
                                    "${state.clinic!.clinicSpecialization!.name}, ${state.clinic!.city!.name}",
                                    style: AppTextStyles.styleWeight500(
                                      fontSize: size.width * .035,
                                    ),
                                  )
                                ],
                              ),
                              CacheImage(
                                width: size.width * .2,
                                height: size.width * .2,
                                shape: BoxShape.circle,
                                imageUrl: state.clinic!.image!.mediaUrl!,
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: size.width * .35,
                                height: size.width * .35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.orangeDarkGradientStart,
                                      AppColors.orangeDarkGradientEnd,
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Experience",
                                        style: AppTextStyles.styleWeight700(
                                          color: AppColors.offWhite,
                                          fontSize: size.width * .045,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "${state.clinic!.experienceYears}yrs",
                                        style: AppTextStyles.styleWeight700(
                                          color: AppColors.offWhite,
                                          fontSize: size.width * .075,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * .35,
                                height: size.width * .35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  gradient: const LinearGradient(
                                    colors: [
                                      AppColors.orangeGradientStart,
                                      AppColors.orangeGradientEnd,
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Patients",
                                        style: AppTextStyles.styleWeight700(
                                          color: AppColors.offWhite,
                                          fontSize: size.width * .045,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        state.clinic!.visitCount.toString(),
                                        style: AppTextStyles.styleWeight700(
                                          color: AppColors.offWhite,
                                          fontSize: size.width * .075,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: size.width * .9,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.offWhite,
                    ),
                    child: Column(
                      children: [
                        PlaceInfoWidget(
                          size: size,
                          title: "Clinic",
                          cityName: state.clinic!.city!.name!,
                          placeContact: state.clinic!.placeContact!,
                        ),
                        const SizedBox(height: 20),
                        MapCardWidget(
                          size: size,
                          title: state.clinic!.name!,
                          latLng: LatLng(
                            double.parse(state.clinic!.placeContact!.latitude!),
                            double.parse(
                                state.clinic!.placeContact!.longitude!),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: size.width * .9,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.offWhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.clinic!.about != null) ...[
                          Text(
                            "About Doctor",
                            style: AppTextStyles.styleWeight900(
                              fontSize: size.width * .045,
                            ),
                          ).gradient(gradient: AppColors.secGradent),
                          Text(
                            state.clinic!.about,
                            style: AppTextStyles.styleWeight500(
                              fontSize: size.width * .04,
                            ),
                          ),
                        ],
                        const SizedBox(height: 10),
                        Text(
                          "OpenDays",
                          style: AppTextStyles.styleWeight900(
                            fontSize: size.width * .045,
                          ),
                        ).gradient(gradient: AppColors.secGradent),
                        const SizedBox(height: 5),
                        Wrap(
                          children: openDays
                              .map(
                                (day) => Container(
                                  margin: const EdgeInsets.only(
                                      right: 5, bottom: 5),
                                  width: size.width * .11,
                                  height: size.width * .11,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: AppColors.mainGradent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      day,
                                      style: AppTextStyles.styleWeight900(
                                        color: AppColors.offWhite,
                                        fontSize: size.width * .035,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 25),
                        MainButton(
                          size: size,
                          height: size.width * .125,
                          width: size.width * .75,
                          text: "Booking",
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              constraints:
                                  BoxConstraints(maxHeight: size.height * .8),
                              builder: (_) => NewWidget(
                                size: size,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({
    super.key,
    required this.size,
  });
  final Size size;
  final ValueNotifier<int> hours = ValueNotifier(10);
  final ValueNotifier<int> minute = ValueNotifier(00);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.backgroundColor,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: CalendarWidget(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Hours",
                    style: AppTextStyles.styleWeight900(
                      fontSize: size.width * .05,
                    ),
                  ),
                  MainButtonWithBorder(
                    size: size,
                    width: size.width * .1,
                    height: size.width * .1,
                    text: "+",
                    onPressed: () {
                      if (hours.value < 23) {
                        hours.value += 30;
                      } else {
                        hours.value = 0;
                      }
                    },
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: hours,
                    builder: (context, value, _) {
                      return Text(
                        "$value".padLeft(2, "0"),
                        style: AppTextStyles.styleWeight900(
                            fontSize: size.width * .06),
                      );
                    },
                  ),
                  MainButtonWithBorder(
                    size: size,
                    width: size.width * .1,
                    height: size.width * .1,
                    text: "-",
                    onPressed: () {
                      if (hours.value > 0) {
                        hours.value--;
                      } else {
                        hours.value = 23;
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    "Minutes",
                    style: AppTextStyles.styleWeight900(
                      fontSize: size.width * .05,
                    ),
                  ),
                  MainButtonWithBorder(
                    size: size,
                    width: size.width * .1,
                    height: size.width * .1,
                    text: "+",
                    onPressed: () {
                      if (minute.value < 45) {
                        minute.value += 15;
                      } else {
                        minute.value = 0;
                      }
                    },
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: minute,
                    builder: (context, value, _) {
                      return Text(
                        "$value".padLeft(2, "0"),
                        style: AppTextStyles.styleWeight900(
                            fontSize: size.width * .06),
                      );
                    },
                  ),
                  MainButtonWithBorder(
                    size: size,
                    width: size.width * .1,
                    height: size.width * .1,
                    text: "-",
                    onPressed: () {
                      if (minute.value > 0) {
                        minute.value -= 15;
                      } else {
                        minute.value = 45;
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          MainButton(
            size: size,
            width: size.width * .8,
            height: size.width * .15,
            text: "Confirm Booking",
            onPressed: () {
              Navigator.of(context).pushNamed(PaymentScreen.routeName,
                  arguments: PaymentScreenParams(
                onTapConfirm: () {
                  Navigator.of(context).popUntil(
                    (route) => route.settings.name == ClinicScreen.routeName,
                  );
                },
              ));
            },
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}

class ClinicDetailsScreenParams {
  final int clinicId;

  ClinicDetailsScreenParams({required this.clinicId});
}
