import 'package:collection/collection.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/models/restaurant_model.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_button_with_border.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';

class BookingTableBottomSheet extends StatelessWidget {
  BookingTableBottomSheet({
    super.key,
    required this.size,
    required this.tableTypes,
    required this.onTap,
  });
  final void Function(int, int, String) onTap;
  final Size size;
  final List<TableTypeModel> tableTypes;
  final ValueNotifier<DateTime> selectedDate = ValueNotifier(DateTime.now());
  final ValueNotifier<int> bookingDays = ValueNotifier(1);

  final ValueNotifier<int> selectedIndex = ValueNotifier(0);
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
                      firstDate: DateTime.now(),
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
                "Person count : ",
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
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Table Type : ",
              style: AppTextStyles.styleWeight500(
                fontSize: size.width * .04,
              ),
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: selectedIndex,
            builder: (context, value, _) {
              return Wrap(
                children: tableTypes.mapIndexed((index, e) {
                  return NeumorphicButton(
                    onPressed: () {
                      selectedIndex.value = index;
                    },
                    style: NeumorphicStyle(
                      depth: value == index ? -10 : 4,
                      shape: NeumorphicShape.flat,
                      lightSource: LightSource.topRight,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(25),
                      ),
                      color: Colors.transparent,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 80,
                      height: 15,
                      child: Center(
                        child: Text(
                          tableTypes[index].name! * 2,
                          style: AppTextStyles.styleWeight500(
                            fontSize: size.width * .04,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 40),
          MainButton(
            size: size,
            width: size.width * .8,
            height: size.width * .15,
            text: "Booking",
            onPressed: () {
              final date =
                  intl.DateFormat("yyyy-MM-dd").format(selectedDate.value);
              onTap(
                tableTypes[selectedIndex.value].id!,
                bookingDays.value,
                date,
              );
            },
          ),
        ],
      ),
    );
  }
}
