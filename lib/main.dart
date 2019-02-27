import 'package:flutter/material.dart';
import './Pages/map_page.dart';

void main() => runApp(PisiApp());

class PisiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "PisiApp",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: MapPage(),
      ),
    );
  }
}
