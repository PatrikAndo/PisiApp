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
  String _title;
  String _description;
  double _rating;
  double _collectiveRate;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        new MapWidget(
          onPlaceSelected: (Place p) {
            setState(() {
              _title = p.Title;
              _description = p.Description;
              _rating = p.Rating; // Has to be changed to the user's own rate in the panel
              //_collectiveRate = p.Rating;
            });
          },
        ),
        new SlideUpPanel(
          header: PlaceHeader(
            title: _title,
            rating: _rating,
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
