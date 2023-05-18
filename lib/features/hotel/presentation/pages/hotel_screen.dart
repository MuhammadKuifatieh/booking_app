import 'package:booking_app/features/hotel/presentation/widgets/hotel_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/main_app_bar.dart';

class HotelScreen extends StatefulWidget {
  static const routeName = "hotel_screen";
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
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
        title: "Hotels",
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return HotelCard(
                    size: size,
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
