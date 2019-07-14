import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Pages/map_page.dart';

void main() => runApp(PisiApp());

class PisiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[200],
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hol pisiljek?",
      home: Scaffold(
        body: MapPage(),
      ),
    );
  }
}
