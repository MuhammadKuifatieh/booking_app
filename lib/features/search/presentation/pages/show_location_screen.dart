import 'dart:async';

import 'package:booking_app/features/search/presentation/bloc/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../core/config/location_service.dart';

class ShowLocationScreen extends StatefulWidget {
  static const String routeName = "show_location_screen";
  const ShowLocationScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);
  final ShowLocationScreenParams arg;
  @override
  State<ShowLocationScreen> createState() => _ShowLocationScreenState();
}

class _ShowLocationScreenState extends State<ShowLocationScreen>
    with WidgetsBindingObserver {
  late CameraPosition _initialCameraPosotion;
  late Completer<GoogleMapController> _controller;
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _controller = Completer<GoogleMapController>();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _controller = Completer<GoogleMapController>();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<LocationData?>(
        future: LocationService.getUserLocation(),
        builder: (context, AsyncSnapshot<LocationData?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          _initialCameraPosotion = CameraPosition(
            target: LatLng(
              widget.arg.location.latitude,
              widget.arg.location.longitude,
            ),
            zoom: 6.5,
          );
          currentLocation = _initialCameraPosotion.target;
          return Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                onMapCreated: (controller) {
                  _controller.complete(controller);
                },
                initialCameraPosition: _initialCameraPosotion,
                onCameraMove: (posotion) {
                  currentLocation = posotion.target;
                },
                markers: widget.arg.locations
                    .map((e) => Marker(
                        markerId: MarkerId(
                          e.toString(),
                        ),
                        position: e.latLng,
                        infoWindow: InfoWindow(
                          title: e.name,
                          snippet: e.categoriesEnum.name,
                        )))
                    .toSet()
                // Marker(
                //   markerId: const MarkerId("1"),
                //   position: widget.arg.location,
                // ),
                ,
                zoomControlsEnabled: false,
              ),
              // const SizedBox(
              //   width: 35,
              //   height: 35,
              //   child: Icon(Icons.location_on),
              // ),
              Positioned(
                bottom: 10,
                left: 8,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        var myLocation = widget.arg.location;
                        var googleMapController = await _controller.future;
                        googleMapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(
                                myLocation.latitude,
                                myLocation.longitude,
                              ),
                              zoom: 6.5,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 12,
                        shape: const CircleBorder(),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            Icons.gps_fixed,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ShowLocationScreenParams {
  final LatLng location;
  final List<LocationModel> locations;

  ShowLocationScreenParams({
    required this.location,
    required this.locations,
  });
}
