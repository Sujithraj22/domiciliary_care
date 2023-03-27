import 'package:flutter/material.dart';

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

class Work {
  const Work({this.title, this.icon});

  final String? title;
  final IconData? icon;
}

List<Work> works = <Work>[
  const Work(title: 'Home', icon: Icons.home),
  const Work(title: 'Contact', icon: Icons.contacts),
  const Work(title: 'Map', icon: Icons.map),
  const Work(title: 'Phone', icon: Icons.phone),
  const Work(title: 'Camera', icon: Icons.camera_alt),
  const Work(title: 'Setting', icon: Icons.settings),
  const Work(title: 'Album', icon: Icons.photo_album),
  const Work(title: 'WiFi', icon: Icons.wifi),
];

class SelectWork extends StatelessWidget {
  const SelectWork({Key? key, required this.work}) : super(key: key);
  final Work work;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
        TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return Card(
      color: Colors.orange,
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(work.icon, size: 50.0, color: Colors.white)),
              Text((work.title).toString(), style: textStyle),
            ]),
      ),
    );
  }
}
