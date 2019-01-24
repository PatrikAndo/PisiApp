import 'package:flutter/material.dart';

class SlideUpPanel extends StatefulWidget{
  @override
  State createState() => new SlideUpPanelState();
}

class SlideUpPanelState extends State<SlideUpPanel>{
  
  double _height;
  bool _isOpen;

  @override
  void initState(){
    super.initState();
    _height = 100.0;
    _isOpen = false;
  }

  @override
  Widget build (BuildContext context){
    return new Container(
      height: _height,
      color: Colors.green,
      child: new Column(
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              height: 100.0,
              color: Colors.white,
            ),
            onVerticalDragEnd: (details) {
              
              double _newHeight;
              
              if(_height >= 200.0){
                _newHeight = 300.0;
                _isOpen = true;
              }else{
                _newHeight = 100.0;
                _isOpen = false;
              }
              setState((){
                _height = _newHeight;
              });
            },
            onVerticalDragUpdate: (details) {
              
              double _newHeight;
              double _dy = details.delta.dy;
              
              if(_height - _dy < 300.0 && _height - _dy > 100.0){
                _newHeight = _height - _dy;
              }else if (_height - _dy >= 300.0)
              {
                _newHeight = 300;
                _isOpen = true;
              }else if(_height - _dy <= 100.0)
              {
                _newHeight = 100.0;
                _isOpen = false;    
              }
              setState((){
                _height = _newHeight;
              });
            } ,
            onTap: () {
              setState( () {
                _height = _isOpen ? 100.0 : 300.0;
                _isOpen=!_isOpen;
              }); 
          }),
        ],
      )
    );
  }
}