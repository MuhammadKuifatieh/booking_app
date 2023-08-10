import 'dart:developer';

import 'package:table_calendar/table_calendar.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key, required this.dateValue});

  final ValueNotifier<DateTime> dateValue;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int thisMonth = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
        valueListenable: widget.dateValue,
        builder: (context, value, _) {
          return TableCalendar(
            weekendDays: const [5],
            headerStyle: HeaderStyle(
              leftChevronVisible: false,
              rightChevronVisible: false,
              formatButtonVisible: false,
              titleTextStyle: AppTextStyles.styleWeight900(
                fontSize: 20,
                color: Colors.grey.shade700,
              ),
            ),
            onDaySelected: (selectedDate, _) {
              log(selectedDate.toString());
              widget.dateValue.value = selectedDate;
            },
            startingDayOfWeek: StartingDayOfWeek.saturday,
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, date, _) {
                return DayContainer(
                  date: date,
                  thisMonth: thisMonth,
                  textColor: Theme.of(context).primaryColor,
                );
              },
              todayBuilder: (context, date, _) {
                return DayContainer(
                  date: date,
                  textColor: Theme.of(context).primaryColor,
                  depth: -20,
                  thisMonth: thisMonth,
                );
              },
              selectedBuilder: (context, date, _) {
                return DayContainer(
                  date: date,
                  textColor: Theme.of(context).primaryColor,
                  depth: -20,
                  thisMonth: thisMonth,
                );
              },
            ),
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            focusedDay: value,
            currentDay: value,
          );
        });
  }
}

class DayContainer extends StatelessWidget {
  const DayContainer({
    super.key,
    required this.date,
    required this.textColor,
    required this.thisMonth,
    this.shape,
    this.border,
    this.depth,
  });
  final double? depth;
  final DateTime date;
  final Color textColor;
  final int thisMonth;
  final NeumorphicShape? shape;
  final NeumorphicBorder? border;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: depth,
          shape: NeumorphicShape.flat,
          color: Colors.transparent,
          border: (border == null)
              ? const NeumorphicBorder(isEnabled: false)
              : border!,
          boxShape: const NeumorphicBoxShape.circle(),
        ),
        child: Center(
          child: NeumorphicText(
            date.day.toString(),
            style: NeumorphicStyle(
              color:
                  (date.month != thisMonth) ? Colors.grey.shade500 : textColor,
              border: const NeumorphicBorder(
                color: Color(0x33000000),
                width: 0.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
