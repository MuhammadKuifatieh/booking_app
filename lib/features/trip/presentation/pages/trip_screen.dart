import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/main_app_bar.dart';

class TripScreen extends StatefulWidget {
  static const routeName = "trip_screen";
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
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
        title: "Trips",
      ),
    );
  }
}
