import 'package:flutter/material.dart';
import 'package:pisi_app/Utilities/Record.dart';

class SlideUpPanel extends StatefulWidget {
  String _description;
  String _title;
  int _stars;

  SlideUpPanel(this._title, this._description , this._stars);

  @override
  State createState() => new _SlideUpPanelState(_title, _description , _stars);
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  double _height;
  bool _isOpen;

  String _description;
  String _title;
  int _starts;


  _SlideUpPanelState(this._title , this._description, this._starts);

  @override
  void initState() {
    super.initState();
    _height = 80.0;
    _isOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: _height,
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new GestureDetector(
                child: new Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: Colors.grey))),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.0, left: 20.0),
                                  child: Text(
                                    _title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.0, left: 20.0),
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
                              child: Icon(
                                Icons.map,
                                size: 40,
                              ),
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
                        )),
                      ],
                    )),
                onVerticalDragEnd: (details) {
                  double _newHeight;

                  if (_height >= 200.0) {
                    _newHeight = 300.0;
                    _isOpen = true;
                  } else {
                    _newHeight = 80.0;
                    _isOpen = false;
                  }
                  setState(() {
                    _height = _newHeight;
                  });
                },
                onVerticalDragUpdate: (details) {
                  double _newHeight;
                  double _dy = details.delta.dy;

                  if (_height - _dy < 300.0 && _height - _dy > 80.0) {
                    _newHeight = _height - _dy;
                  } else if (_height - _dy >= 300.0) {
                    _newHeight = 300;
                    _isOpen = true;
                  } else if (_height - _dy <= 80.0) {
                    _newHeight = 80.0;
                    _isOpen = false;
                  }
                  setState(() {
                    _height = _newHeight;
                  });
                },
                onTap: () {
                  setState(() {
                    _height = _isOpen ? 80.0 : 300.0;
                    _isOpen = !_isOpen;
                  });
                }),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                      textAlign: TextAlign.start,
                    ),
                  ),
                )
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
                        Icon(
                          Icons.star_half,
                          size: 40.0,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 40.0,
                        ),
                        Icon(
                          Icons.star,
                          size: 40.0,
                        ),
                        Icon(
                          Icons.star,
                          size: 40.0,
                        ),
                        Icon(
                          Icons.star,
                          size: 40.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(),
          ],
        ));
  }
}
