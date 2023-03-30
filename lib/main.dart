import 'package:domiciliary_care/screens/home_screen.dart';
import 'package:domiciliary_care/screens/visiting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.blue),
      // color to change 265197
      home: VisitingScreen(),
    );
  }
}