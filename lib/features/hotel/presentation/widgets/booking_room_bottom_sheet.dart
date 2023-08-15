import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_button_with_border.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';

class BookingRoomBottomSheet extends StatelessWidget {
  BookingRoomBottomSheet({
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final ValueNotifier<DateTime> selectedDate =
      ValueNotifier(DateTime.now().add(const Duration(days: 1)));
  final ValueNotifier<int> bookingDays = ValueNotifier(1);
  final void Function(int, String) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Booking Details",
            style: AppTextStyles.styleWeight900(
              fontSize: size.width * .06,
            ),
          ).gradient(),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Select Booking Date : ",
                style: AppTextStyles.styleWeight500(
                  fontSize: size.width * .04,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: selectedDate.value,
                      firstDate: DateTime.now().add(const Duration(days: 1)),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                    ).then(
                      (value) {
                        if (value != null) {
                          return selectedDate.value = value;
                        }
                      },
                    );
                  },
                  child: ValueListenableBuilder<DateTime>(
                      valueListenable: selectedDate,
                      builder: (context, value, _) {
                        return MainTextFailed(
                          controller: TextEditingController()
                            ..text = value.toIso8601String().substring(0, 10),
                          enabled: false,
                        );
                      }),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Booking Days : ",
                style: AppTextStyles.styleWeight500(
                  fontSize: size.width * .04,
                ),
              ),
              Row(
                children: [
                  MainButtonWithBorder(
                    size: size,
                    text: "-",
                    onPressed: () {
                      if (bookingDays.value > 1) bookingDays.value--;
                    },
                    width: size.width * .1,
                    height: size.width * .1,
                  ),
                  const SizedBox(width: 12),
                  ValueListenableBuilder<int>(
                    valueListenable: bookingDays,
                    builder: (context, value, _) {
                      return Container(
                        width: size.width * .2,
                        height: size.width * .12,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.5),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            "$value",
                          ),
                        ),
                      ).gradient();
                    },
                  ),
                  const SizedBox(width: 12),
                  MainButtonWithBorder(
                    size: size,
                    text: "+",
                    onPressed: () {
                      bookingDays.value++;
                    },
                    width: size.width * .1,
                    height: size.width * .1,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 40),
          MainButton(
            size: size,
            width: size.width * .8,
            height: size.width * .15,
            text: "Booking",
            onPressed: () {
              final String date =
                  intl.DateFormat("yyyy-MM-dd").format(selectedDate.value);
              onTap(bookingDays.value, date);
            },
          ),
        ],
      ),
    );
  }
}
