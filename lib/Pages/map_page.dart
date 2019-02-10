import 'package:flutter/material.dart';
import '../Widgets/map_widget.dart';
import '../Widgets/slide_up_panel.dart';
import 'package:pisi_app/Utilities/Record.dart';

class MapPage extends StatefulWidget {
  @override
  State createState() => new MapPageState();

  String _title = "Jernbanegade 1, Roskilde2";
  String _description;
  int _stars;
}

class MapPageState extends State<MapPage> {

  Record rTest = new Record("ghvjhjvgj", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley", 5, 55.5,4.54);

  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        new MapWidget(),
        new SlideUpPanel(rTest.Title , rTest.Description, rTest.Rating),
      ],
    );
  }
}
