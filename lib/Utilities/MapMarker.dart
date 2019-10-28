import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluster/fluster.dart';

class MapMarker extends Clusterable {
  Marker marker;

  MapMarker(
      {this.marker, isCluster = false, clusterId, childMarkerId, pointsSize})
      : super(
            latitude: marker.position.latitude,
            longitude: marker.position.longitude,
            isCluster: isCluster,
            clusterId: clusterId,
            markerId: marker.markerId.toString(),
            childMarkerId: childMarkerId,
            pointsSize: pointsSize);
}
