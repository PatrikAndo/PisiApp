import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Utilities/DataLoader.dart';
import '../Utilities/Place.dart';

class MapWidget extends StatefulWidget {
  @override
  State createState() => new _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;

  static final CameraPosition _defaultPosition = const CameraPosition(
    target: LatLng(47.180086, 19.503736),
    zoom: 6.5,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    DataLoader.loadData().then((List<Place> places) {
      places.forEach((p) {
        mapController.addMarker(
          MarkerOptions(
            position: LatLng(p.Lattitude, p.Longitude),
            infoWindowText: InfoWindowText(p.Title, p.Description),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      });
    });

    mapController.onMarkerTapped.add((Marker m) {
      print('hello id:' + m.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      options: GoogleMapOptions(
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: false,
        rotateGesturesEnabled: false,
        myLocationEnabled: true,
        compassEnabled: false,
        mapType: MapType.normal,
        trackCameraPosition: true,
        zoomGesturesEnabled: true,
        cameraPosition: _defaultPosition,
      ),
    );
  }
}
