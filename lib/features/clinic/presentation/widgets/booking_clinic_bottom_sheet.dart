import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/models/clinic_model.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_button_with_border.dart';
import 'calender.dart';
import 'package:intl/intl.dart' as intl;

class BookingClinicBottomSheet extends StatelessWidget {
  BookingClinicBottomSheet({
    super.key,
    required this.size,
    required this.onTap,
    required this.clinicSessions,
  });
  final Size size;
  final void Function(int, String) onTap;
  final List<ClinicSessionModel> clinicSessions;
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);
  final ValueNotifier<DateTime> dateValue = ValueNotifier(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.backgroundColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CalendarWidget(
              dateValue: dateValue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Sessions",
                    style: AppTextStyles.styleWeight900(
                      fontSize: size.width * .065,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      MainButtonWithBorder(
                        size: size,
                        width: size.width * .1,
                        height: size.width * .1,
                        text: "<",
                        onPressed: () {
                          if (selectedIndex.value - 1 >= 0) {
                            selectedIndex.value--;
                          } else {
                            selectedIndex.value = clinicSessions.length - 1;
                          }
                        },
                      ),
                      const SizedBox(width: 15),
                      ValueListenableBuilder<int>(
                        valueListenable: selectedIndex,
                        builder: (context, value, _) {
                          return Column(
                            children: [
                              Text(
                                "Start : ${clinicSessions[value].startTime!.hour.toString().padLeft(2, "0")} : ${clinicSessions[value].startTime!.minute.toString().padLeft(2, "0")}",
                                style: AppTextStyles.styleWeight900(
                                    fontSize: size.width * .05),
                              ),
                              Text(
                                "End : ${clinicSessions[value].endTime!.hour.toString().padLeft(2, "0")} : ${clinicSessions[value].endTime!.minute.toString().padLeft(2, "0")}",
                                style: AppTextStyles.styleWeight900(
                                    fontSize: size.width * .05),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      MainButtonWithBorder(
                        size: size,
                        width: size.width * .1,
                        height: size.width * .1,
                        text: ">",
                        onPressed: () {
                          if (selectedIndex.value + 1 < clinicSessions.length) {
                            selectedIndex.value += 1;
                          } else {
                            selectedIndex.value = 0;
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 20),
            ],
          ),
          const Spacer(),
          MainButton(
            size: size,
            width: size.width * .8,
            height: size.width * .15,
            text: "Confirm Booking",
            onPressed: () {
              final date =
                  intl.DateFormat("yyyy-MM-dd").format(dateValue.value);
              onTap(clinicSessions[selectedIndex.value].id!, date);
            },
          ),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
