import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PlaceDetails extends StatefulWidget {
  const PlaceDetails({
    Key key,
    this.description,
    this.inputRating,
  }) : super(key: key);

  final String description;
  final double inputRating;

  @override
  State createState() {
    return new _PlaceDetailsState();
  }
}

class _PlaceDetailsState extends State<PlaceDetails> {
  double _rating;

  @override
  void didUpdateWidget(PlaceDetails oldWidget) {
    // TODO: implement didUpdateWidget
    _rating = widget.inputRating;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    //_rating = widget.inputRating;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  widget.description ?? "",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
        Container(
          color: Color.fromRGBO(240, 240, 245, 1),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                child: Text(
                  "Rate this place",
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {
                        _rating = v;
                        setState(() {});
                      },
                      starCount: 5,
                      rating: _rating ?? 0,
                      size: 40.0,
                      color: Colors.green,
                      borderColor: Colors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Opening Hours",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
            ),
            Text("Monday: 00-24"),
            Text("Tuesday: 00-24"),
            Text("Wednesday: 00-24"),
            Text("Thursday: 00-24"),
            Text("Friday: 00-24"),
            Text("Saturday: 00-24"),
            Text("Sunday: 00-24"),
          ],
        ), // Place for opening hours
      ],
    );
  }
}
