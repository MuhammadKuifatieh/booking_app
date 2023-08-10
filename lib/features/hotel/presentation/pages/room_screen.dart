import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/toast.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/presentation/pages/paymant_screen.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../main/presentation/pages/main_screen.dart';
import '../../domain/usecases/booking_hotel.dart';
import '../bloc/hotel_details/hotel_details_bloc.dart';
import '../widgets/booking_room_bottom_sheet.dart';
import '../widgets/room_card.dart';
import 'hotel_screen.dart';

class RoomScreen extends StatefulWidget {
  static const routeName = "room_screen";
  const RoomScreen({super.key, required this.arg});
  final RoomScreenParams arg;

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.arg.hotelBloc,
      child: BlocConsumer<HotelBloc, HotelState>(
        listener: (context, state) {
          if (state.bookingHotelStatus == BookingHotelStatus.loadnig) {
            Toast.showLoading();
          } else if (state.bookingHotelStatus == BookingHotelStatus.failed) {
            Toast.closeAllLoading();
            Toast.showText(text: "something wrong");
            Navigator.of(context).pop();
          } else if (state.bookingHotelStatus == BookingHotelStatus.succ) {
            Toast.closeAllLoading();

            Navigator.of(context).popUntil(
              (route) {
                log(route.settings.name.toString());
                return (route.settings.name == HotelScreen.routeName ||
                    route.settings.name == MainScreen.routeName);
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: MainAppBar(
              size: size,
              centerTitle: false,
              titleWidgte: Text(
                "Hotel Dence Royal",
                style: AppTextStyles.styleWeight700(
                  fontSize: size.width * .05,
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                    },
                    child: ListView.builder(
                      itemCount: widget.arg.roomTypes.length,
                      padding: const EdgeInsets.only(top: 15),
                      itemBuilder: (context, index) {
                        return RoomCard(
                          size: size,
                          roomType: widget.arg.roomTypes[index],
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (_) => BookingRoomBottomSheet(
                                size: size,
                                onTap: (days, date) {
                                  Navigator.of(context).pushNamed(
                                    PaymentScreen.routeName,
                                    arguments: PaymentScreenParams(
                                      onTapConfirm: () {
                                        widget.arg.hotelBloc.add(
                                          BookingHotelEvent(
                                            BookingHotelParams(
                                              hotelId: widget.arg.hotelId,
                                              roomTypeId: widget
                                                  .arg.roomTypes[index].id!,
                                              bookingDate: date,
                                              bookingDaysCount: days.toString(),
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class RoomScreenParams {
  final int hotelId;
  final HotelBloc hotelBloc;
  final List<RoomTypeModel> roomTypes;

  RoomScreenParams({
    required this.hotelBloc,
    required this.hotelId,
    required this.roomTypes,
  });
}
