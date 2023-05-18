import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/main_app_bar.dart';

class ResturantScreen extends StatefulWidget {
  static const routeName = "resturant_screen";
  const ResturantScreen({super.key});

  @override
  State<ResturantScreen> createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
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
        title: "Resturants",
      ),
    );
  }
}
