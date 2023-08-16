import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/toast.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../../../customer_booking/presentation/pages/customer_booking_screen.dart';
import '../bloc/hotel_order/hotel_order_bloc.dart';

class MyHotelScreen extends StatefulWidget {
  static const routeName = "my_Hotel";
  const MyHotelScreen({super.key, required this.arg});
  final MyHotelScreenParams arg;

  @override
  State<MyHotelScreen> createState() => _MyHotelScreenState();
}

class _MyHotelScreenState extends State<MyHotelScreen> {
  late Size size;
  late HotelOrderBloc hotelOrderBloc;
  @override
  void initState() {
    hotelOrderBloc = HotelOrderBloc()
      ..add(GetHotelOrdersEvent(hotelId: widget.arg.hotelId));
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
      create: (context) => hotelOrderBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "My Hotel Order",
        ),
        body: BlocConsumer<HotelOrderBloc, HotelOrderState>(
          listener: (context, state) {
            if (state.actionHotelOrdersStatus ==
                ActionHotelOrdersStatus.loading) {
              Toast.showLoading();
            } else if (state.actionHotelOrdersStatus ==
                ActionHotelOrdersStatus.failed) {
              Toast.closeAllLoading();
              Toast.showText(text: "Something wrong");
            } else if (state.actionHotelOrdersStatus ==
                ActionHotelOrdersStatus.succ) {
              Toast.closeAllLoading();
            }
          },
          builder: (context, state) {
            if (state.getHotelOrdersStatus == GetHotelOrdersStatus.loading ||
                state.getHotelOrdersStatus == GetHotelOrdersStatus.init) {
              return const MainLoadingWidget();
            } else if (state.getHotelOrdersStatus ==
                GetHotelOrdersStatus.failed) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  hotelOrderBloc
                      .add(GetHotelOrdersEvent(hotelId: widget.arg.hotelId));
                },
              );
            }
            if (state.orderHotels.isEmpty) {
              return Center(
                child: Text(
                  "No BooKing",
                  style: AppTextStyles.styleWeight700(fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.orderHotels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Neumorphic(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Date : ",
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                            Text(
                              DateFormat("yyyy/MM/dd").format(
                                state.orderHotels[index].bookingDatetime!,
                              ),
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Booking duration : ",
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                            Text(
                              state.orderHotels[index].escortsNumber.toString(),
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Booking Status : ",
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                            Text(
                              StatusEnumExtention.getByStatus(
                                  state.orderHotels[index].status!)!,
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                          ],
                        ),
                        if (StatusEnumExtention.getByStatus(
                                state.orderHotels[index].status!) ==
                            StatusEnum.pending.status!.value)
                          Column(
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      hotelOrderBloc.add(
                                        RejectHotelOrderEvent(
                                          hotelId: state.orderHotels[index].id!,
                                        ),
                                      );
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor:
                                          AppColors.orangeGradientStart,
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      hotelOrderBloc.add(AcceptHotelOrderEvent(
                                        hotelId: state.orderHotels[index].id!,
                                      ));
                                    },
                                    child: const CircleAvatar(
                                      backgroundColor:
                                          AppColors.orangeGradientStart,
                                      child: Icon(Icons.check),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MyHotelScreenParams {
  final int hotelId;

  MyHotelScreenParams({required this.hotelId});
}
