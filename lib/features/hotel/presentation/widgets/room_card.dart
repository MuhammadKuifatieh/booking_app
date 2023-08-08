import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/config/app_text_styles.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/presentation/widgets/main_button.dart';
import '../../../../core/presentation/widgets/network_image.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.size,
    required this.onTap,
    required this.roomType,
  });

  final Size size;
  final VoidCallback onTap;
  final RoomTypeModel roomType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CacheImage(
          width: size.width * .9,
          height: size.width * .45,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(15),
          ),
          imageUrl: "https://thumbs.dreamstime.com/b/hotel-room-43642330.jpg",
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(15),
          // height: size.width * .3,
          width: size.width * .9,
          decoration: const BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      roomType.name!,
                      style: AppTextStyles.styleWeight700(
                        fontSize: size.width * .045,
                      ),
                    ),
                  ),
                  MainButton(
                    size: size,
                    width: size.width * .325,
                    text: "Select Room",
                    onPressed: onTap,
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     const Icon(
              //       Icons.door_back_door,
              //     ).gradient(),
              //     const SizedBox(width: 5),
              //     Text(
              //       "5",
              //       style: AppTextStyles.styleWeight500(
              //           fontSize: size.width * .04),
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     const Icon(
              //       Icons.wifi,
              //     ).gradient(),
              //     const SizedBox(width: 5),
              //     Text(
              //       "Wifi",
              //       style: AppTextStyles.styleWeight500(
              //           fontSize: size.width * .04),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "55000 sp",
                  //       style: AppTextStyles.styleWeight700(
                  //         fontSize: size.width * .05,
                  //       ),
                  //     ),
                  //     Text(
                  //       "for 1 night",
                  //       style: AppTextStyles.styleWeight500(),
                  //     )
                  //   ],
                  // ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
