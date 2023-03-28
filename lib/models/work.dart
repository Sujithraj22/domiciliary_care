import 'package:flutter/material.dart';

class Work {
  const Work({this.title, this.icon});

  final String? title;
  final IconData? icon;
}

List<Work> works = <Work>[
  const Work(title: 'Medication', icon: Icons.medication_rounded),
  const Work(title: 'Body Map', icon: Icons.man_2_rounded),
  const Work(title: 'Food', icon: Icons.map),
  const Work(title: 'Drinks', icon: Icons.phone),
  const Work(title: 'Personal care', icon: Icons.camera_alt),
  const Work(title: 'Toilet assistance', icon: Icons.settings),
  const Work(title: 'Repositioning', icon: Icons.settings),
  const Work(title: 'Companionship / respite care', icon: Icons.photo_album),
  const Work(title: 'Laundry', icon: Icons.wifi),
  const Work(title: 'Groceries', icon: Icons.wifi),
  const Work(title: 'Housework', icon: Icons.wifi),
  const Work(title: 'Household chores', icon: Icons.wifi),
  const Work(title: 'Unable to delivere care', icon: Icons.wifi),
];

class SelectWork extends StatelessWidget {
  const SelectWork({Key? key, required this.work}) : super(key: key);
  final Work work;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold,);
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Icon(work.icon, size: 45.0, color: Colors.black),
              SizedBox(height: 10),
              Text((work.title).toString(), style: textStyle),
            ]),
      ),
    );
  }
}