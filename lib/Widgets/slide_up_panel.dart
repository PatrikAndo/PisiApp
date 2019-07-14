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

class _SlideUpPanelState extends State<SlideUpPanel>
    with SingleTickerProviderStateMixin {
  //Widget's own variables
  double _height;
  bool _isOpen;
  double _midPoint;
  double _heightOpen = 300;
  double _heightClosed = 100;
  AnimationController _ac;

  //Methods
  @override
  void initState() {
    super.initState();
    _height = _heightClosed;
    _isOpen = false;

    _ac = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {
          _height = _ac.value * (_heightOpen - _heightClosed) + _heightClosed;
        });
      });
  }

  @override
  void dispose() {
    _ac.dispose();
    super.dispose();
  }

  void setPanelState(isOpen) {
    _ac.fling(velocity: isOpen ? 1.0 : -1.0);
    _isOpen = isOpen;
  }

  @override
  void didUpdateWidget(SlideUpPanel oldWidget) {
    setPanelState(false);
    super.didUpdateWidget(oldWidget);
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

    return GestureDetector(
      child: Container(
        height: _height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 8.0,
              color: Color.fromRGBO(0, 0, 0, 0.25),
            )
          ],
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: _heightClosed,
              child: widget.header,
            ),
            Positioned(
              top: _heightClosed,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: _heightOpen - _heightClosed,
                child: SingleChildScrollView(
                  child: widget.content,
                ),
              ),
            ),
          ],
        ),
      ),
      onVerticalDragEnd: (DragEndDetails details) {
        double minFlingVelocity = 200.0;

        if (details.primaryVelocity.abs() >= minFlingVelocity) {
          setPanelState(details.primaryVelocity < 0);
        } else {
          setPanelState(_height > _midPoint);
        }
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        double newHeight = _height - details.primaryDelta;
        if (newHeight < _heightOpen && newHeight > _heightClosed) {
          setState(() {
            _height = newHeight;
          });

          _ac.value -= details.primaryDelta / (_heightOpen - _heightClosed);
        }
      },
      onTap: () {
        setPanelState(!_isOpen);
      },
    );
  }
}
