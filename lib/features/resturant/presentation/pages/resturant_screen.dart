import 'package:booking_app/core/presentation/widgets/main_error_widget.dart';
import 'package:booking_app/core/presentation/widgets/main_loading_widget.dart';
import 'package:booking_app/features/resturant/presentation/bloc/restaurants/restaurants_bloc.dart';
import 'package:booking_app/features/resturant/presentation/widgets/resturant_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/main_app_bar.dart';

class ResturantScreen extends StatefulWidget {
  static const routeName = "resturant_screen";
  const ResturantScreen({super.key});

  @override
  State<ResturantScreen> createState() => _ResturantScreenState();
}

class _ResturantScreenState extends State<ResturantScreen> {
  late Size size;
  late final RestaurantsBloc restaurantsBloc;
  @override
  void initState() {
    restaurantsBloc = RestaurantsBloc()..add(GetRestaurantsEvent());
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
      create: (context) => restaurantsBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "Resturants",
        ),
        body: BlocConsumer<RestaurantsBloc, RestaurantsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if ((state.getRestaurantsStatus == GetRestaurantsStatus.loading ||
                    state.getRestaurantsStatus == GetRestaurantsStatus.inti) &&
                state.restaurants.isEmpty) {
              return const MainLoadingWidget();
            } else if (state.getRestaurantsStatus ==
                GetRestaurantsStatus.failed) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  restaurantsBloc.add(GetRestaurantsEvent(isReload: true));
                },
              );
            }
            return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 1)).then(
                    (value) => restaurantsBloc
                        .add(GetRestaurantsEvent(isReload: true)));
              },
              child: ListView.builder(
                itemCount: state.restaurants.length + (state.isEndPage ? 0 : 1),
                itemBuilder: (context, index) {
                  if (state.restaurants.length == index) {
                    restaurantsBloc.add(GetRestaurantsEvent());
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: MainLoadingWidget(),
                    );
                  }
                  return RestaurantCard(
                    size: size,
                    restaurant: state.restaurants[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
