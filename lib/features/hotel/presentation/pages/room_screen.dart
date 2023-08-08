import 'package:flutter/material.dart';

import '../../../../core/config/app_text_styles.dart';
import '../../../../core/models/hotel_model.dart';
import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../widgets/booking_room_bottom_sheet.dart';
import '../widgets/room_card.dart';

class RoomScreen extends StatefulWidget {
  static const routeName = "room_screen";
  const RoomScreen({super.key, required this.arg});
  final RoomScreenParams arg;

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  late Size size;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        size: size,
        centerTitle: false,
        titleWidgte: Text(
          "Hotel Dence Royal",
          style: AppTextStyles.styleWeight700(
            fontSize: size.width * .05,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.builder(
                itemCount: widget.arg.roomTypes.length,
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (context, index) {
                  return RoomCard(
                    size: size,
                    roomType: widget.arg.roomTypes[index],
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (_) => BookingRoomBottomSheet(size: size),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoomScreenParams {
  final int hotelId;
  final List<RoomTypeModel> roomTypes;

  RoomScreenParams({
    required this.hotelId,
    required this.roomTypes,
  });
}
