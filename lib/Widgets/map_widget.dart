import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  @override
  State createState() => new _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  static final LatLng center = const LatLng(47.482289, 19.006642);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) {
        mapController = controller;
      },
      options: GoogleMapOptions(
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: false,
        rotateGesturesEnabled: false,
        myLocationEnabled: true,
        compassEnabled: false,
        mapType: MapType.normal,
        trackCameraPosition: true,
        zoomGesturesEnabled: true,
        cameraPosition: const CameraPosition(
          target: LatLng(47.482289, 19.006642),
          zoom: 6.0,
        ),
      ),
    );
  }
}
