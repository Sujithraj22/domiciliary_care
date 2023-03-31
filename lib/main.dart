import 'package:domiciliary_care/constants/color.dart';
//import 'package:domiciliary_care/screens/home_screen.dart';
//import 'package:domiciliary_care/screens/response_screen.dart';
import 'package:domiciliary_care/screens/visiting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //systemNavigationBarColor: themeColor, // navigation bar color
    statusBarColor: themeColor, // status bar color
  ));
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.blue),
      // color to change 265197
      home: const VisitingScreen(),
    );
  }
}