import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../config/location_service.dart';

class MapPickLocation extends StatefulWidget {
  const MapPickLocation({Key? key}) : super(key: key);
  static const String routeName = "map_pick_location";

  @override
  State<MapPickLocation> createState() => _MapPickLocationState();
}

class _MapPickLocationState extends State<MapPickLocation>
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                snapshot.data!.latitude!,
                snapshot.data!.longitude!,
                //
                // 36.0,
                // 36.0,
              ),
              zoom: 16.4746,
            );
            currentLocation = _initialCameraPosotion.target;
            return Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  myLocationButtonEnabled: false,
                  onMapCreated: (controller) async {
                    _controller.complete(controller);
                  },
                  initialCameraPosition: _initialCameraPosotion,
                  onCameraMove: (posotion) {
                    currentLocation = posotion.target;
                  },
                  zoomControlsEnabled: false,
                ),
                const SizedBox(
                  width: 35,
                  height: 35,
                  child: Icon(Icons.location_on),
                ),
                Positioned(
                  bottom: 10,
                  left: 8,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          var myLocation =
                              await LocationService.getUserLocation();
                          if (myLocation == null) return;
                          var googleMapController = await _controller.future;
                          googleMapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                  myLocation.latitude!,
                                  myLocation.longitude!,
                                  // 36.0,
                                  // 36.0,
                                ),
                                zoom: 16.4746,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.gps_fixed,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.white24,
                        onTap: () {
                          Navigator.pop(context, currentLocation);
                        },
                        child: Card(
                          shape: const CircleBorder(),
                          elevation: 12,
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
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
      ),
    );
  }
}
