import 'package:flutter/material.dart';
import 'package:pisi_app/Utilities/Record.dart';

class SlideUpPanel extends StatefulWidget {
  String _description;
  String _title;
  int _stars;

  SlideUpPanel(this._title, this._description, this._stars);

  @override
  State createState() => new _SlideUpPanelState(_title, _description, _stars);
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  double _height;
  bool _isOpen;
  double _midPoint;

  double _heightOpen = 300;
  double _heightClosed = 100;

  String _description;
  String _title;
  int _starts;

  _SlideUpPanelState(this._title, this._description, this._starts);

  @override
  void initState() {
    super.initState();
    _height = _heightClosed;
    _isOpen = false;
  }

  void setPanelState(isOpen) {
    setState(() {
      _height = isOpen ? _heightOpen : _heightClosed;
    });
    _isOpen = isOpen;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _heightOpen = screenHeight * 0.5;
    } else {
      _heightOpen = screenHeight - 100;
    }

    _midPoint = (_heightOpen + _heightClosed) / 2;

    return new Container(
        height: _height,
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new GestureDetector(
                child: new Container(
                    height: _heightClosed,
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
                  setPanelState(_height >= _midPoint);
                },
                onVerticalDragUpdate: (details) {
                  double newHeight = _height - details.delta.dy;
                  if (newHeight < _heightOpen && newHeight > _heightClosed) {
                    setState(() {
                      _height = newHeight;
                    });
                  } else {
                    setPanelState(newHeight >= _heightOpen);
                  }
                },
                onTap: () {
                  setPanelState(!_isOpen);
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
