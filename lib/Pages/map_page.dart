import 'package:flutter/material.dart';
import 'package:pisi_app/Widgets/place_details.dart';
import 'package:pisi_app/Widgets/place_header.dart';
import '../Widgets/map_widget.dart';
import '../Widgets/slide_up_panel.dart';
import 'package:pisi_app/Utilities/Place.dart';

class MapPage extends StatefulWidget {
  @override
  State createState() {
    return new MapPageState();
  }
}

class MapPageState extends State<MapPage> {
  Place selectedPlace;
  bool showPanel = false;
  String _title;
  String _description;
  double _rating;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        new MapWidget(
          onPlaceSelected: (Place p) {
            selectedPlace = p;

            if (selectedPlace != null) {
              setState(() {
                _title = p.Title;
                _description = p.Description;
                _rating = p.Rating;
                showPanel = true;
              });
            }
            else {
              setState(() {
                showPanel = false;
              });
            }
          },
        ),
        new SlideUpPanel(
          showPanel: showPanel,
          header: PlaceHeader(
            title: _title,
          ),
          content: PlaceDetails(
            description: _description,
            inputRating: _rating,
          ),
        ),
      ],
    );
  }
}
