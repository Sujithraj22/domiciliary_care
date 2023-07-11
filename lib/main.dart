import 'package:u20x_native/constants/color.dart';
import 'package:u20x_native/screens/index_screen.dart';
import 'package:u20x_native/util/constants.dart';

import 'package:u20x_native/views/dc/patientreport.dart';

//import 'package:u20x_native/screens/response_screen.dart';
import 'package:u20x_native/views/dc/visiting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //systemNavigationBarColor: themeColor, // navigation bar color
    statusBarColor: themeColor, // status bar color
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', primaryColor: kDC4Color),
      // color to change 265197
      //home: VisitingScreen(),
      home: IndexScreen(),

    );
  }
}
