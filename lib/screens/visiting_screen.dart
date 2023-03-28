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
          //grid view
          body:SafeArea(
            child: Column(
              children: [
                Text('How have you helped John?'),
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(works.length, (index) {
                      return SelectWork(work: works[index]);
                    }),

         // ),
       // ]),
      ),
                ),
              ],
            ),
          ),
    );
  }
}




