import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/widgets/main_app_bar.dart';
import '../../../../core/presentation/widgets/main_error_widget.dart';
import '../../../../core/presentation/widgets/main_loading_widget.dart';
import '../bloc/hotels/hotels_bloc.dart';
import '../widgets/hotel_card.dart';

class HotelScreen extends StatefulWidget {
  static const routeName = "hotel_screen";
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  late Size size;
  late final HotelsBloc hotelsBloc;
  @override
  void initState() {
    hotelsBloc = HotelsBloc()..add(GetHotelsEvent());
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
      create: (context) => hotelsBloc,
      child: Scaffold(
        appBar: MainAppBar(
          size: size,
          title: "Hotels",
        ),
        body: BlocConsumer<HotelsBloc, HotelsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if ((state.getHotelsStataus == GetHotelsStataus.loading ||
                    state.getHotelsStataus == GetHotelsStataus.init) &&
                state.hotels.isEmpty) {
              return const MainLoadingWidget();
            } else if (state.getHotelsStataus == GetHotelsStataus.failed &&
                state.hotels.isEmpty) {
              return MainErrorWidget(
                size: size,
                onTap: () {
                  hotelsBloc.add(GetHotelsEvent(isReload: true));
                },
              );
            }
            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1)).then(
                          (value) =>
                              hotelsBloc.add(GetHotelsEvent(isReload: true)));
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 15),
                      itemCount:
                          state.hotels.length + (state.isEndPage ? 0 : 1),
                      itemBuilder: (context, index) {
                        if (state.hotels.length == index) {
                          hotelsBloc.add(GetHotelsEvent());
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: MainLoadingWidget(),
                          );
                        }
                        return HotelCard(
                          size: size,
                          hotel: state.hotels[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
