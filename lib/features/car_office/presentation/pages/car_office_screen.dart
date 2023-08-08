import 'package:booking_app/core/presentation/widgets/main_error_widget.dart';
import 'package:booking_app/core/presentation/widgets/main_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../bloc/bloc/car_offices_bloc.dart';
import '../widgets/car_office_card.dart';

class CarOfficeScreen extends StatefulWidget {
  static const routeName = "trip_screen";
  const CarOfficeScreen({super.key});

  @override
  State<CarOfficeScreen> createState() => _CarOfficeScreenState();
}

class _CarOfficeScreenState extends State<CarOfficeScreen> {
  late Size size;
  late final CarOfficesBloc carOfficesBloc;

  @override
  void initState() {
    carOfficesBloc = CarOfficesBloc()..add(GetCarOfficesEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => carOfficesBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "Trips",
        ),
        body: BlocConsumer<CarOfficesBloc, CarOfficesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if ((state.getCarOfficesStatus == GetCarOfficesStatus.loading ||
                    state.getCarOfficesStatus == GetCarOfficesStatus.init) &&
                state.carOffices.isEmpty) {
              return const MainLoadingWidget();
            }
            if (state.getCarOfficesStatus == GetCarOfficesStatus.failed &&
                state.carOffices.isEmpty) {
              return MainErrorWidget(
                  size: size,
                  onTap: () {
                    carOfficesBloc.add(GetCarOfficesEvent(isReload: true));
                  });
            }
            return ListView.builder(
              itemCount: state.carOffices.length + (state.isEndPage ? 0 : 1),
              itemBuilder: (context, index) {
                if (state.carOffices.length == index) {
                  carOfficesBloc.add(GetCarOfficesEvent());
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MainLoadingWidget(),
                  );
                }
                return CarOfficeCard(
                  size: size,
                  carOffice:state.carOffices[index],
                  onTap: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
