import 'package:domiciliary_care/screens/visiting_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ThemeData lightTheme = ThemeData.light().copyWith(
    //   textTheme: ThemeData.light().textTheme.apply(
    //     fontFamily: 'RobotoMono',
    //   ),
    //   primaryTextTheme: ThemeData.light().textTheme.apply(
    //     fontFamily: 'RobotoMono',
    //   ),
    //   accentTextTheme: ThemeData.light().textTheme.apply(
    //     fontFamily: 'RobotoMono',
    //   ),
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: VisitingScreen(),
    );
  }
}