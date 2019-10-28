import 'dart:async';
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
  Completer<GoogleMapController> _mapController = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId selectedMarker;
  int _markerIdCounter = 0;
  List<Place> places;
  void Function(Place) onPlaceSelected;

  static final CameraPosition _defaultPosition = const CameraPosition(
    target: LatLng(47.180086, 19.503736),
    zoom: 6.5,
  );

  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);

    DataLoader.loadData().then((List<Place> places) {
      this.places = places;

      places.forEach((p) {
        if (_markerIdCounter > 10) return;

        final MarkerId markerId = MarkerId('marker_$_markerIdCounter');
        _markerIdCounter++;

        final Marker marker = Marker(
            markerId: markerId,
            position: LatLng(p.Lattitude, p.Longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueYellow),
            onTap: () {
              setState(() {
                if (selectedMarker != null) {
                  markers[selectedMarker] = markers[selectedMarker].copyWith(
                    iconParam: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueYellow),
                  );
                }
                markers[markerId] = markers[markerId]
                    .copyWith(iconParam: BitmapDescriptor.defaultMarker);
              });

              onPlaceSelected(p);

              selectedMarker = markerId;
            });

        setState(() {
          markers[markerId] = marker;
        });
      });
    });
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      if (selectedMarker != null) {
        markers[selectedMarker] = markers[selectedMarker].copyWith(
          iconParam:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        );
      }

      selectedMarker = null;
    });
    onPlaceSelected(null);
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
      onTap: _onMapTapped,
      compassEnabled: false,
      mapToolbarEnabled: false,
      myLocationEnabled: true,
      rotateGesturesEnabled: false,
      tiltGesturesEnabled: false,
      markers: Set<Marker>.of(markers.values),
    );
  }
}
