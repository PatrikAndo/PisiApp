import 'package:flutter/material.dart';
import './Pages/map_page.dart';

void main(){
  runApp( MaterialApp(
    home: Scaffold(
      appBar: new AppBar(
        title: Text( ("PisiApp"), style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: MapPage(),
    )
  ));
}