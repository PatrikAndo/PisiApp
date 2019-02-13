import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlaceHeader extends StatefulWidget {
  const PlaceHeader({
    Key key,
    this.title
  }) : super(key: key);

  final String title;

  @override
  State createState() => new _PlaceHeaderState();
}

class _PlaceHeaderState extends State<PlaceHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    widget.title ?? "",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: Text(
                    "No rate",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(Icons.map, size: 40),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "Route",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}