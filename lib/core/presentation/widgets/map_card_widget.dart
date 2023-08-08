import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCardWidget extends StatelessWidget {
  const MapCardWidget({
    super.key,
    required this.size,
    required this.title,
    required this.latLng,
  });

  final Size size;
  final String title;
  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {},
      child: SizedBox(
        width: size.width * .9,
        height: size.width * .5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GoogleMap(
            zoomGesturesEnabled: false,
            onMapCreated: (controller) async {},
            markers: {
              Marker(
                  markerId: MarkerId(
                    latLng.toString(),
                  ),
                  position: latLng,
                  infoWindow: InfoWindow(
                    title: title,
                    snippet: '',
                  ))
            },
            initialCameraPosition: CameraPosition(
              target: latLng,
              zoom: 12,
            ),
            zoomControlsEnabled: false,
          ),
        ),
      ),
    );
  }
}
