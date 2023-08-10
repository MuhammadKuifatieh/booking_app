import 'package:booking_app/core/config/app_colors.dart';
import 'package:booking_app/core/config/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../extensions/gradian.dart';
import '../../models/place_model.dart';

class PlaceInfoWidget extends StatelessWidget {
  const PlaceInfoWidget({
    super.key,
    required this.size,
    required this.title,
    required this.cityName,
    required this.placeContact,
    this.hasPadding = true,
  });

  final Size size;
  final String title;
  final String cityName;
  final bool hasPadding;
  final PlaceContactModel placeContact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !hasPadding
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(
              horizontal: size.width * .05,
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title info : ",
            style: AppTextStyles.styleWeight900(fontSize: 20),
          ).gradient(gradient: AppColors.secGradent),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.phone_android_rounded,
                size: 20,
              ).gradient(),
              const SizedBox(width: 5),
              Text(placeContact.phoneNumber!)
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_city,
                size: 20,
              ).gradient(),
              const SizedBox(width: 5),
              Text(cityName)
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.share_location_sharp,
                size: 20,
              ).gradient(),
              const SizedBox(width: 5),
              Text(placeContact.address!)
            ],
          ),
        ],
      ),
    );
  }
}
