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

  Record rTest = new Record("ghvjhjvgj", "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley\n\n\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla auctor fringilla viverra. Pellentesque eleifend porta lectus, at facilisis justo vestibulum in. Cras quis condimentum magna. Nam congue imperdiet semper. Pellentesque rhoncus pretium euismod. Praesent fermentum ipsum et ultrices vehicula. Duis vehicula rhoncus aliquet. Phasellus vel pulvinar nisl, rutrum condimentum risus. Ut posuere varius bibendum. Aenean vel molestie mi. Phasellus nec facilisis neque.", 5, 55.5,4.54);

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
