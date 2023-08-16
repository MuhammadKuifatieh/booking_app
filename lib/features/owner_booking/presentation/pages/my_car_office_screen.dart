import 'package:booking_app/features/customer_booking/presentation/pages/customer_booking_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/toast.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../bloc/car_office_order/car_office_order_bloc.dart';

class MyCarOfficeScreen extends StatefulWidget {
  static const routeName = "my_CarOffice";
  const MyCarOfficeScreen({super.key, required this.arg});
  final MyCarOfficeScreenParams arg;

  @override
  State<MyCarOfficeScreen> createState() => _MyCarOfficeScreenState();
}

class _MyCarOfficeScreenState extends State<MyCarOfficeScreen> {
  late Size size;
  late CarOfficeOrderBloc carOfficeOrderBloc;
  @override
  void initState() {
    carOfficeOrderBloc = CarOfficeOrderBloc()
      ..add(GetCarOfficeOrdersEvent(carOfficeId: widget.arg.carOfficeId));
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
      create: (context) => carOfficeOrderBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "My CarOffice Order",
        ),
        body: BlocConsumer<CarOfficeOrderBloc, CarOfficeOrderState>(
          listener: (context, state) {
            if (state.actionCarOfficeOrdersStatus ==
                ActionCarOfficeOrdersStatus.loading) {
              Toast.showLoading();
            } else if (state.actionCarOfficeOrdersStatus ==
                ActionCarOfficeOrdersStatus.failed) {
              Toast.closeAllLoading();
              Toast.showText(text: "Something wrong");
            } else if (state.actionCarOfficeOrdersStatus ==
                ActionCarOfficeOrdersStatus.succ) {
              Toast.closeAllLoading();
            }
          },
          builder: (context, state) {
            if (state.getCarOfficeOrdersStatus ==
                    GetCarOfficeOrdersStatus.loading ||
                state.getCarOfficeOrdersStatus ==
                    GetCarOfficeOrdersStatus.init) {
              return const MainLoadingWidget();
            } else if (state.getCarOfficeOrdersStatus ==
                GetCarOfficeOrdersStatus.failed) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  carOfficeOrderBloc.add(GetCarOfficeOrdersEvent(
                      carOfficeId: widget.arg.carOfficeId));
                },
              );
            }
            if (state.orderCarOffices.isEmpty) {
              return Center(
                child: Text(
                  "No BooKing",
                  style: AppTextStyles.styleWeight700(fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.orderCarOffices.length,
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
                                state.orderCarOffices[index].bookingDatetime!,
                              ),
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Number Seat : ",
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                            Text(
                              state.orderCarOffices[index].escortsNumber
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
                                  state.orderCarOffices[index].status!)!,
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                          ],
                        ),
                        if (StatusEnumExtention.getByStatus(
                                state.orderCarOffices[index].status!) ==
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
                                      carOfficeOrderBloc.add(
                                        RejectCarOfficeOrderEvent(
                                          carOfficeId:
                                              state.orderCarOffices[index].id!,
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
                                      carOfficeOrderBloc
                                          .add(AcceptCarOfficeOrderEvent(
                                        carOfficeId:
                                            state.orderCarOffices[index].id!,
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

class MyCarOfficeScreenParams {
  final int carOfficeId;

  MyCarOfficeScreenParams({required this.carOfficeId});
}
