import 'dart:developer';

import 'package:intl/intl.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../../data/models/hotel_booking_customer_response.dart';
import '../pages/customer_booking_screen.dart';

class HotelCustomerBookingListWidget extends StatelessWidget {
  const HotelCustomerBookingListWidget({
    super.key,
    required this.hotel,
    required this.isLoading,
    required this.isFailed,
    required this.onTapRetry,
  });
  final List<CustomerHotelBookingModel> hotel;
  final bool isLoading;
  final bool isFailed;
  final VoidCallback onTapRetry;
  @override
  Widget build(BuildContext context) {
    log(isFailed.toString());
    return isLoading
        ? const MainLoadingWidget()
        : isFailed
            ? MainErrorWidget(
                size: MediaQuery.sizeOf(context),
                onTap: onTapRetry,
              )
            : hotel.isEmpty
                ? Center(
                    child: Text(
                      "No BooKing",
                      style: AppTextStyles.styleWeight700(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: hotel.length,
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
                                    style: AppTextStyles.styleWeight500(
                                        fontSize: 16),
                                  ),
                                  Text(
                                    DateFormat("yyyy/MM/dd").format(
                                      hotel[index].bookingDatetime!,
                                    ),
                                    style: AppTextStyles.styleWeight500(
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Booking duration : ",
                                    style: AppTextStyles.styleWeight500(
                                        fontSize: 16),
                                  ),
                                  Text(
                                    hotel[index].escortsNumber.toString(),
                                    style: AppTextStyles.styleWeight500(
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Booking Status : ",
                                    style: AppTextStyles.styleWeight500(
                                        fontSize: 16),
                                  ),
                                  Text(
                                    StatusEnumExtention.getByStatus(
                                        hotel[index].status!)!,
                                    style: AppTextStyles.styleWeight500(
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
  }
}
