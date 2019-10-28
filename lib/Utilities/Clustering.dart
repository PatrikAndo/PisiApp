import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fluster/fluster.dart';
import '../Utilities/MapMarker.dart';

class Clustering {
  static List<Marker> cluster(
      Map<MarkerId, Marker> markers, LatLngBounds visibleRegion, int zoom) {
    List<Marker> markersList = List<Marker>.of(markers.values);

    markersList = markersList.fold([], (acc, e) {
      if (visibleRegion.contains(e.position)) {
        acc.add(e);
      }
      return acc;
    });

    if (markersList.length == 0) return [];

    int markerCount = markersList.length;
    print("Clustering " + markerCount.toString());

    List<MapMarker> mms =
        markersList.map((Marker e) => MapMarker(marker: e)).toList();

    Fluster<MapMarker> fluster = Fluster<MapMarker>(
        minZoom: 0,
        maxZoom: 20,
        radius: 250,
        extent: 2048,
        nodeSize: 64,
        points: mms,
        createCluster:
            (BaseCluster cluster, double longitude, double latitude) {
          return MapMarker(
            marker: Marker(
              markerId: MarkerId("cluster_" + cluster.id.toString()),
              position: LatLng(latitude, longitude),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueAzure),
            ),
          );
        });

    List<MapMarker> tmpClusters = fluster.clusters([
      visibleRegion.southwest.longitude,
      visibleRegion.southwest.latitude,
      visibleRegion.northeast.longitude,
      visibleRegion.northeast.latitude
    ], zoom);

    return tmpClusters.map((MapMarker e) => e.marker).toList();
  }
}
