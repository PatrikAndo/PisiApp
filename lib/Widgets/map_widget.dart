import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget{
  @override
  State createState() => new MapWidgetState();
}

class MapWidgetState extends State<MapWidget>{
  
  GoogleMapController mapController;
  static final LatLng center = const LatLng(32.7266, 74.8570);
  
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
              target: LatLng(-33.852, 151.211),
              zoom: 11.0,
            ),
          ),
        );
  }
}