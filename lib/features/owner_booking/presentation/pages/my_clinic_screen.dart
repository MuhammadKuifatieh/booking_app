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
import '../bloc/clinic_order/clinic_order_bloc.dart';

class MyClinicScreen extends StatefulWidget {
  static const routeName = "my_Clinic";
  const MyClinicScreen({super.key, required this.arg});
  final MyClinicScreenParams arg;

  @override
  State<MyClinicScreen> createState() => _MyClinicScreenState();
}

class _MyClinicScreenState extends State<MyClinicScreen> {
  late Size size;
  late ClinicOrderBloc clinicOrderBloc;
  @override
  void initState() {
    clinicOrderBloc = ClinicOrderBloc()
      ..add(GetClinicOrdersEvent(clinicId: widget.arg.clinicId));
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
      create: (context) => clinicOrderBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "My Clinic Order",
        ),
        body: BlocConsumer<ClinicOrderBloc, ClinicOrderState>(
          listener: (context, state) {
            if (state.actionClinicOrdersStatus ==
                ActionClinicOrdersStatus.loading) {
              Toast.showLoading();
            } else if (state.actionClinicOrdersStatus ==
                ActionClinicOrdersStatus.failed) {
              Toast.closeAllLoading();
              Toast.showText(text: "Something wrong");
            } else if (state.actionClinicOrdersStatus ==
                ActionClinicOrdersStatus.succ) {
              Toast.closeAllLoading();
            }
          },
          builder: (context, state) {
            if (state.getClinicOrdersStatus == GetClinicOrdersStatus.loading ||
                state.getClinicOrdersStatus == GetClinicOrdersStatus.init) {
              return const MainLoadingWidget();
            } else if (state.getClinicOrdersStatus ==
                GetClinicOrdersStatus.failed) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  clinicOrderBloc
                      .add(GetClinicOrdersEvent(clinicId: widget.arg.clinicId));
                },
              );
            }
            if (state.orderClinics.isEmpty) {
              return Center(
                child: Text(
                  "No BooKing",
                  style: AppTextStyles.styleWeight700(fontSize: 18),
                ),
              );
            }
            return ListView.builder(
              itemCount: state.orderClinics.length,
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
                                state.orderClinics[index].bookingDatetime!,
                              ),
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
                                  state.orderClinics[index].status!)!,
                              style: AppTextStyles.styleWeight500(fontSize: 16),
                            ),
                          ],
                        ),
                        if (StatusEnumExtention.getByStatus(
                                state.orderClinics[index].status!) ==
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
                                      clinicOrderBloc.add(
                                        RejectClinicOrderEvent(
                                          clinicId:
                                              state.orderClinics[index].id!,
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
                                      clinicOrderBloc
                                          .add(AcceptClinicOrderEvent(
                                        clinicId: state.orderClinics[index].id!,
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

class MyClinicScreenParams {
  final int clinicId;

  MyClinicScreenParams({required this.clinicId});
}
