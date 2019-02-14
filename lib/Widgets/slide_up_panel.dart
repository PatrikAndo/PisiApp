import 'package:flutter/material.dart';

class SlideUpPanel extends StatefulWidget {
  const SlideUpPanel({
    Key key,
    this.showPanel,
    this.header,
    this.content,
  }) : super(key: key);

  final bool showPanel;
  final Widget header;
  final Widget content;

  @override
  State createState() => new _SlideUpPanelState();
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  //Widget's own variables
  double _height;
  bool _isOpen;
  double _midPoint;
  double _heightOpen = 300;
  double _heightClosed = 100;

  //Methods
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
    if (widget.showPanel == false) {
      return new Container();
    }

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
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: widget.header,
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
              } else {
                setPanelState(newHeight >= _heightOpen);
              }
            },
            onTap: () {
              setPanelState(!_isOpen);
            },
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: _height - _heightClosed,
              maxHeight: _height - _heightClosed,
            ),
            child: SingleChildScrollView(
              child: widget.content,
            ),
          ),
        ],
      ),
    );
  }
}
