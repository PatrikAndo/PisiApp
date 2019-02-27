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
  Place _selectedPlace;
  bool _showPanel = false;
  String _title;
  String _description;
  double _rating;

  void _onPlaceSelected(Place p) {
    _selectedPlace = p;

    if (_selectedPlace != null) {
      setState(() {
        _title = p.Title;
        _description = p.Description;
        _rating = p.Rating;
        _showPanel = true;
      });
    } else {
      setState(() {
        _showPanel = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          MapWidget(
            onPlaceSelected: _onPlaceSelected,
          ),
          SlideUpPanel(
            showPanel: _showPanel,
            header: PlaceHeader(
              title: _title,
            ),
            content: PlaceDetails(
              description: _description,
              inputRating: _rating,
            ),
          ),
        ],
      ),
      onWillPop: () async {
        if (_selectedPlace != null) {
          _onPlaceSelected(null);
          return false;
        }

        return true;
      },
    );
  }
}
