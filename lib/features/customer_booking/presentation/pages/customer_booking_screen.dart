import 'package:booking_app/features/customer_booking/presentation/widgets/clinic_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../customer_booking/customer_booking_bloc.dart';
import '../widgets/car_office_list_widget.dart';

class CustomerBookingScreen extends StatefulWidget {
  static const routeName = "customer_booking";
  const CustomerBookingScreen({super.key});

  @override
  State<CustomerBookingScreen> createState() => _CustomerBookingScreenState();
}

class _CustomerBookingScreenState extends State<CustomerBookingScreen>
    with SingleTickerProviderStateMixin {
  late final CustomerBookingBloc customerBookingBloc;
  late Size size;
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    customerBookingBloc = CustomerBookingBloc()
      ..add(GetCustomerCarOfficeEvent())
      ..add(GetCustomerClinicEvent())
      ..add(GetCustomerHotelEvent())
      ..add(GetCustomerRestaurantEvent());
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
      create: (context) => customerBookingBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          height: size.height * .125,
          title: "Customer Booking",
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
        body: BlocConsumer<CustomerBookingBloc, CustomerBookingState>(
          listener: (context, state) {},
          builder: (context, state) {
            return TabBarView(
              controller: tabController,
              children: [
                CarOfficeListWidget(
                    carOffices: state.carOffices,
                    isLoading: (state.getCustomerCarOfficeStatus ==
                            GetCustomerCarOfficeStatus.loading ||
                        state.getCustomerCarOfficeStatus ==
                            GetCustomerCarOfficeStatus.init),
                    isFailed: state.getCustomerCarOfficeStatus ==
                        GetCustomerCarOfficeStatus.faild,
                    onTapRetry: () {
                      customerBookingBloc.add(GetCustomerCarOfficeEvent());
                    }),
                ClinicListWidget(
                  clinicOffices: state.clinics,
                  isLoading: (state.getCustomerClinicStatus ==
                          GetCustomerClinicStatus.loading ||
                      state.getCustomerClinicStatus ==
                          GetCustomerClinicStatus.init),
                  isFailed: state.getCustomerClinicStatus ==
                      GetCustomerClinicStatus.faild,
                  onTapRetry: () {
                    customerBookingBloc.add(GetCustomerClinicEvent());
                  },
                ),
                Column(children: []),
                Column(children: []),
              ],
            );
          },
        ),
      ),
    );
  }
}

enum StatusEnum { pending, accept, reject }

extension StatusEnumExtention on StatusEnum {
  StatusValueClass? get status {
    if (this == StatusEnum.accept) {
      return StatusValueClass(
        status: 2,
        value: "Accept",
      );
    } else if (this == StatusEnum.pending) {
      return StatusValueClass(
        status: 1,
        value: "Pending",
      );
    } else if (this == StatusEnum.reject) {
      return StatusValueClass(
        status: 2,
        value: "Reject",
      );
    }
    return null;
  }

  static String? getByStatus(int value) {
    if (value == StatusEnum.reject.status!.status) {
      return StatusEnum.reject.status!.value;
    } else if (value == StatusEnum.pending.status!.status) {
      return StatusEnum.pending.status!.value;
    } else if (value == StatusEnum.accept.status!.status) {
      return StatusEnum.accept.status!.value;
    }
    return null;
  }
}

class StatusValueClass {
  final int status;
  final String value;

  StatusValueClass({
    required this.status,
    required this.value,
  });
}