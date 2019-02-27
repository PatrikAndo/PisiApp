import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Utilities/DataLoader.dart';
import '../Utilities/Place.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key key,
    this.onPlaceSelected,
  }) : super(key: key);

  final void Function(Place) onPlaceSelected;

  @override
  State createState() => new _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  List<Place> places;
  void Function(Place) onPlaceSelected;

  static final CameraPosition _defaultPosition = const CameraPosition(
    target: LatLng(47.180086, 19.503736),
    zoom: 6.5,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    DataLoader.loadData().then((List<Place> places) {
      this.places = places;

      places.forEach((p) {
        mapController.addMarker(
          MarkerOptions(
            position: LatLng(p.Lattitude, p.Longitude),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      });
    });

    mapController.onMarkerTapped.add((Marker m) {
      int placeId = int.tryParse(m.id.substring(1));
      if (placeId != null) {
        Place selectedPlace = places[placeId];
        onPlaceSelected(selectedPlace);
      }
    });

    mapController.onMapTapped.add((LatLng latLng) {
      onPlaceSelected(null);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    this.onPlaceSelected = widget.onPlaceSelected;

    return GoogleMap(
      initialCameraPosition: _defaultPosition,
      onMapCreated: _onMapCreated,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: false,
      rotateGesturesEnabled: false,
      myLocationEnabled: true,
      compassEnabled: false,
      mapType: MapType.normal,
      trackCameraPosition: true,
      zoomGesturesEnabled: true,
    );
  }
}
