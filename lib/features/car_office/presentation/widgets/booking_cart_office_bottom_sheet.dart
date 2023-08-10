import 'package:collection/collection.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/config/toast.dart';
import '../../../../core/extensions/gradian.dart';
import '../../../../core/flutter_neumorphic/flutter_neumorphic.dart';
import '../../../../core/models/car_office_model.dart';
import '../../../../core/presentation/pages/map_pick_location.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/main_text_failed.dart';

class BookingCarOfficeBottomSheet extends StatefulWidget {
  BookingCarOfficeBottomSheet({
    super.key,
    required this.size,
    required this.onTap,
    required this.carTypes,
  });
  final Size size;
  final List<CarTypeModel> carTypes;
  final void Function(int, String, LatLng, LatLng) onTap;

  @override
  State<BookingCarOfficeBottomSheet> createState() =>
      _BookingCarOfficeBottomSheetState();
}

class _BookingCarOfficeBottomSheetState
    extends State<BookingCarOfficeBottomSheet> {
  late final ValueNotifier<int> selectedIndex;

  late final ValueNotifier<LatLng?> toLocation;

  late final ValueNotifier<LatLng?> fromLocation;

  late final TextEditingController controller;
  @override
  void initState() {
    selectedIndex = ValueNotifier(0);
    toLocation = ValueNotifier(null);
    fromLocation = ValueNotifier(null);
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.size.width * .035),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Car Types : ",
              style: AppTextStyles.styleWeight600(
                fontSize: 22,
              ),
            ).gradient(),
            ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, value, _) {
                return Wrap(
                  children: widget.carTypes.mapIndexed(
                    (index, element) {
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
                              element.name! * 2,
                              style: AppTextStyles.styleWeight500(
                                fontSize: widget.size.width * .04,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("seat number : "),
                Flexible(
                    child: MainTextFailed(
                  controller: controller,
                )),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("From : "),
                ValueListenableBuilder(
                    valueListenable: fromLocation,
                    builder: (context, value, _) {
                      return Flexible(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(MapPickLocation.routeName)
                                .then((value) {
                              if (value != null) {
                                fromLocation.value = value as LatLng;
                              }
                            });
                          },
                          child: MainTextFailed(
                            enabled: false,
                            controller: TextEditingController()
                              ..text = (value != null) ? "value selected" : "",
                          ),
                        ),
                      );
                    }),
                const Text("To : "),
                ValueListenableBuilder(
                    valueListenable: toLocation,
                    builder: (context, value, _) {
                      return Flexible(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(MapPickLocation.routeName)
                                .then(
                              (value) {
                                if (value != null) {
                                  toLocation.value = value as LatLng;
                                }
                              },
                            );
                          },
                          child: MainTextFailed(
                            enabled: false,
                            controller: TextEditingController()
                              ..text = (value != null) ? "value selected" : "",
                          ),
                        ),
                      );
                    }),
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: MainButton(
                size: widget.size,
                width: widget.size.width * .8,
                height: widget.size.width * .15,
                text: "Booking",
                onPressed: () {
                  if (fromLocation.value == null &&
                      toLocation.value == null &&
                      controller.text.isEmpty) {
                    Toast.showText(text: "check complete value");
                  } else {
                    widget.onTap(
                      widget.carTypes[selectedIndex.value].id!,
                      controller.text,
                      fromLocation.value!,
                      toLocation.value!,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
