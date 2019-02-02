import 'package:flutter/material.dart';

class SlideUpPanel extends StatefulWidget {
  @override
  State createState() => new SlideUpPanelState();
}

class SlideUpPanelState extends State<SlideUpPanel> {
  double _heightOpen = 300;
  double _heightClosed = 100;

  double _midPoint;
  double _height;
  bool _isOpen;

  @override
  void initState() {
    super.initState();

    _height = _heightClosed;
    _isOpen = false;
  }

  @override
  Widget build (BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _heightOpen = screenHeight * 0.5;
    }
    else {
      _heightOpen = screenHeight - 100;
    }

    _midPoint = (_heightOpen + _heightClosed) / 2;

    return new Container(
      height: _height,
      color: Colors.green,
      child: new Column(
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              height: _heightClosed,
              color: Colors.white,
            ),
            onVerticalDragEnd: (details) {
              setPanelState(_height >= _midPoint);
            },
            onVerticalDragUpdate: (details) {
              double newHeight = _height - details.delta.dy;
              
              if (newHeight < _heightOpen && newHeight > _heightClosed) {
                setState(() {
                  _height = newHeight;
                });
              }
              else
              {
                setPanelState(newHeight >= _heightOpen);
              }
            } ,
            onTap: () {
              setPanelState(!_isOpen);
            }
          ),
        ],
      )
    );
  }

  void setPanelState(isOpen) {
    setState(() {
      _height = isOpen ? _heightOpen : _heightClosed;
    });
    _isOpen = isOpen;
  }
}