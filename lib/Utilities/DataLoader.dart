import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'Place.dart';

class DataLoader {
  static Future<List<Place>> loadData() {
    List<Place> places = new List();
    var completer = new Completer<List<Place>>();

    final future = rootBundle.loadString('assets/20190124_from_db_pretty.json');
    future.then((placesString) {
      List placesJson = json.decode(placesString);
      placesJson.forEach((p) {
        places.add(new Place(p['name'], p['description'], p['rating'].toDouble(), p['location']['coordinates'][0], p['location']['coordinates'][1]));
      });
      completer.complete(places);
    });

    return completer.future;
  }
}