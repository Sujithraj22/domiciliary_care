import 'package:domiciliary_care/screens/response_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/visiting_screen.dart';
Color? colorMedication = Colors.white;



class Work {

  Work({this.title, this.icon, this.color});

  final String? title;
  final IconData? icon;
  final Color? color;
}

List<Work> works = <Work>[
  Work(title: 'Medication', icon: FontAwesomeIcons.pills, color: colorMedication),
  Work(title: 'Body Map', icon: FontAwesomeIcons.person, color: Colors.blue),
  Work(title: 'Food', icon: FontAwesomeIcons.utensils, color: Colors.yellow),
  Work(title: 'Drinks', icon: FontAwesomeIcons.mugSaucer,color: Colors.yellow),
  Work(title: 'Personal care', icon: FontAwesomeIcons.bath,color: Colors.yellow),
  Work(title: 'Toilet assistance', icon: FontAwesomeIcons.toilet,color: Colors.yellow),
  Work(title: 'Repositioning', icon: FontAwesomeIcons.bed,color: Colors.yellow),
  Work(title: 'Companionship / respite care', icon: FontAwesomeIcons.peopleGroup,color: Colors.yellow),
  Work(title: 'Laundry', icon: Icons.local_laundry_service_rounded,color: Colors.yellow),
  Work(title: 'Groceries', icon: FontAwesomeIcons.cartShopping,color: Colors.yellow),
  Work(title: 'Housework', icon: FontAwesomeIcons.broom,color: Colors.yellow),
  Work(title: 'Household chores', icon: FontAwesomeIcons.screwdriverWrench,color: Colors.yellow),
  Work(title: 'Unable to deliver care', icon: FontAwesomeIcons.ban,color: Colors.yellow),
];

class SelectWork extends StatefulWidget {
  const SelectWork({Key? key, required this.work}) : super(key: key);
  final Work work;

  @override
  State<SelectWork> createState() => _SelectWorkState();
}

class _SelectWorkState extends State<SelectWork> {


  @override
  Widget build(BuildContext context) {

    const TextStyle textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      
    );
    return GestureDetector(
      onTap: () async{
        final data = await
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) =>
                ResponsePage(workName: widget.work.title.toString())),
          ),
        );
        //colorMedication = data;
        setState(() {
          print (colorMedication);
        });

        

      },
      child: Card(
        //change to colorMedication for changing color
        color: colorMedication,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(color: Colors.purple),
        ),
        //color: cardFunction(),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
             // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(widget.work.icon, size: 40.0, color: Colors.black),
                const SizedBox(height: 10),
                Text((widget.work.title).toString(), style: textStyle),
              ]),
        ),
      ),
    );
  }
}
