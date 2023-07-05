
import 'package:u20x_native/views/dc/visiting_screen.dart';
import 'package:flutter/material.dart';

import '../model/client_profile.dart';
import '../views/dc/client_profile_page.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VisitingScreen(),
                  ));
                },
                child: Text('Visiting Screen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ClientProfilePage(),
                  ));
                },
                child: Text('Client Profile')),
          ],
        ),
      ),
    ));
  }
}
