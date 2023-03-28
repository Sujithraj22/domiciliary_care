import 'package:flutter/material.dart';

import '../models/work.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SafeArea(
      //   child: Column(children: [
      //     const Text(
      //       'How have you helped John?',
      //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //     ),

          //grid view
          body:GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(works.length, (index) {
              return Center(
                child: SelectWork(work: works[index]),
              );
            }),

         // ),
       // ]),
      ),
    );
  }
}




