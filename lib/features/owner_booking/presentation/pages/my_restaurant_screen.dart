import 'package:booking_app/core/config/app_colors.dart';
import 'package:booking_app/core/presentation/widgets/main_error_widget.dart';
import 'package:booking_app/core/presentation/widgets/main_loading_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/toast.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../customer_booking/presentation/pages/customer_booking_screen.dart';
import '../bloc/restaurant_order/restaurant_order_bloc.dart';

class MyRestaurantScreen extends StatefulWidget {
  static const routeName = "my_restaurant";
  const MyRestaurantScreen({super.key, required this.arg});
  final MyRestaurantScreenParans arg;

  @override
  State<MyRestaurantScreen> createState() => _MyRestaurantScreenState();
}

class _MyRestaurantScreenState extends State<MyRestaurantScreen> {
  late Size size;
  late RestaurantOrderBloc restaurantOrderBloc;
  @override
  void initState() {
    restaurantOrderBloc = RestaurantOrderBloc()
      ..add(GetRestaurantOrdersEvent(restaurantId: widget.arg.restaurantId));
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
      create: (context) => restaurantOrderBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "My Restaurant Order",
        ),
        body: BlocConsumer<RestaurantOrderBloc, RestaurantOrderState>(
          listener: (context, state) {
            if (state.actionRestaurantOrdersStatus ==
                ActionRestaurantOrdersStatus.loading) {
              Toast.showLoading();
            } else if (state.actionRestaurantOrdersStatus ==
                ActionRestaurantOrdersStatus.failed) {
              Toast.closeAllLoading();
              Toast.showText(text: "Something wrong");
            } else if (state.actionRestaurantOrdersStatus ==
                ActionRestaurantOrdersStatus.succ) {
              Toast.closeAllLoading();
            }
          },
          builder: (context, state) {
            if (state.getRestaurantOrdersStatus ==
                    GetRestaurantOrdersStatus.loading ||
                state.getRestaurantOrdersStatus ==
                    GetRestaurantOrdersStatus.init) {
              return const MainLoadingWidget();
            } else if (state.getRestaurantOrdersStatus ==
                GetRestaurantOrdersStatus.failed) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  restaurantOrderBloc.add(GetRestaurantOrdersEvent(
                      restaurantId: widget.arg.restaurantId));
                },
              );
            }
            if (state.orderRestaurants.isEmpty) {
              return Center(
                child: Text(
                  "No BooKing",
                  style: AppTextStyles.styleWeight700(fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.orderRestaurants.length,
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
                                state.orderRestaurants[index].bookingDatetime!,
                              ),
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Seat Booking : ",
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                            Text(
                              state.orderRestaurants[index].escortsNumber
                                  .toString(),
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
                                  state.orderRestaurants[index].status!)!,
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                          ],
                        ),
                        if (StatusEnumExtention.getByStatus(
                                state.orderRestaurants[index].status!) ==
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
                                      restaurantOrderBloc.add(
                                        RejectRestaurantOrderEvent(
                                          restaurantId:
                                              state.orderRestaurants[index].id!,
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
                                      restaurantOrderBloc
                                          .add(AcceptRestaurantOrderEvent(
                                        restaurantId:
                                            state.orderRestaurants[index].id!,
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

class MyRestaurantScreenParans {
  final int restaurantId;

  MyRestaurantScreenParans({required this.restaurantId});
}
