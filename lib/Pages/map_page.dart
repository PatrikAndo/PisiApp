import 'package:flutter/material.dart';
import '../Widgets/map_widget.dart';
import '../Widgets/slide_up_panel.dart';

class MapPage extends StatefulWidget{
  @override
  State createState() => new MapPageState();
}

class MapPageState extends State<MapPage>{
  
  @override
  Widget build(BuildContext context){
    return new Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        new MapWidget(),
        new SlideUpPanel(
        ), 
      ],
    );
  }
}