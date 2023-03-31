import 'package:domiciliary_care/screens/response_screen.dart';
import 'package:flutter/material.dart';

class Work {
  const Work({this.title, this.icon});

  final String? title;
  final IconData? icon;
}

List<Work> works = <Work>[
  const Work(title: 'Medication', icon: Icons.medication_rounded),
  const Work(title: 'Body Map', icon: Icons.accessibility_new_rounded),
  const Work(title: 'Food', icon: Icons.local_dining_rounded),
  const Work(title: 'Drinks', icon: Icons.local_drink_rounded),
  const Work(title: 'Personal care', icon: Icons.bathtub_rounded),
  const Work(title: 'Toilet assistance', icon: Icons.add),
  const Work(title: 'Repositioning', icon: Icons.settings),
  const Work(title: 'Companionship / respite care', icon: Icons.photo_album),
  const Work(title: 'Laundry', icon: Icons.wifi),
  const Work(title: 'Groceries', icon: Icons.wifi),
  const Work(title: 'Housework', icon: Icons.wifi),
  const Work(title: 'Household chores', icon: Icons.wifi),
  const Work(title: 'Unable to deliver care', icon: Icons.wifi),
];

class SelectWork extends StatelessWidget {
  const SelectWork({Key? key, required this.work}) : super(key: key);
  final Work work;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => ResponsePage()),
          ),
        );
      },
      child: Card(
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(color: Colors.purple),
        ),
        //color: cardFunction(),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(work.icon, size: 45.0, color: Colors.black),
                const SizedBox(height: 10),
                Text((work.title).toString(), style: textStyle),
              ]),
        ),
      ),
    );
  }

  void cardFunction() {
    Color cardColor = Colors.white;

    if (work.title == 'Medication') {
      print('Medication');
    }
  }
}
