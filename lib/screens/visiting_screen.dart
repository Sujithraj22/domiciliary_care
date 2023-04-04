import 'package:domiciliary_care/screens/response_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import '../models/smileyIcons.dart';
//import '../models/work.dart';

Color iconColor1 = Colors.grey;
Color iconColor2 = Colors.grey;
Color iconColor3 = Colors.grey;
Color iconColor4 = Colors.grey;
Color iconColor5 = Colors.grey;

Color colorMedication = Colors.green;
Color colorBodyMap = Colors.green;
Color colorFood = Colors.green;
Color colorDrinks = Colors.green;
Color colorPersonalCare = Colors.green;
Color colorToliletAssistance = Colors.green;
Color colorRepositioning = Colors.green;
Color colorCompanionship = Colors.green;
Color colorLaundry = Colors.green;
Color colorGroceries = Colors.green;
Color colorHousework = Colors.green;
Color colorHouseholdChores = Colors.green;
Color colorUnableToDeliverCare = Colors.green;

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    print('reload');

    return SafeArea(
      child: Scaffold(
        //grid view
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'How have you helped John?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 15),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: [
                    //title: 'Medication', icon: FontAwesomeIcons.pills, color: colorMedication
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Medication')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorMedication);
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
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.pills,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Medication',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Body Map', icon: FontAwesomeIcons.person, color: colorBodyMap
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Body Map')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorBodyMap,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.person,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Body Map',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Food', icon: FontAwesomeIcons.utensils, color: colorFood
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Food')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorFood,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.utensils,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Food',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Drinks', icon: FontAwesomeIcons.mugSaucer,color: colorDrinks
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Drinks')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorDrinks,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.mugSaucer,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Drinks',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Personal care', icon: FontAwesomeIcons.bath,color: colorPersonalCare
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Personal care')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorPersonalCare,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.bath,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Personal care',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Toilet assistance', icon: FontAwesomeIcons.toilet,color: colorToliletAssistance
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Toilet assistance')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorToliletAssistance,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.toilet,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Toilet assistance',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Repositioning', icon: FontAwesomeIcons.bed,color: colorRepositioning
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Repositioning')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorRepositioning,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.bed,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Repositioning',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Companionship / respite care', icon: FontAwesomeIcons.peopleGroup,color: colorCompanionship
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => ResponsePage(
                                workName: 'Companionship / respite care')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorCompanionship,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.peopleGroup,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Companionship /',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text('respite care',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Laundry', icon: Icons.local_laundry_service_rounded,color: colorLaundry
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Laundry')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorLaundry,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.local_laundry_service_rounded,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Laundry',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Groceries', icon: FontAwesomeIcons.cartShopping,color: colorGroceries
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Groceries')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorGroceries,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.cartShopping,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Groceries',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Housework', icon: FontAwesomeIcons.broom,color: colorHousework
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Housework')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorHousework,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.broom,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Housework',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Household chores', icon: FontAwesomeIcons.screwdriverWrench,color: colorHouseholdChores
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                ResponsePage(workName: 'Household chores')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorHouseholdChores,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.screwdriverWrench,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Household chores',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    //title: 'Unable to deliver care', icon: FontAwesomeIcons.ban,color: colorUnableToDeliverCare
                    GestureDetector(
                      onTap: () async {
                        final data = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => ResponsePage(
                                workName: 'Unable to deliver care')),
                          ),
                        );
                        //colorMedication = data;
                        setState(() {
                          print(colorBodyMap);
                        });
                      },
                      child: Card(
                        //change to colorMedication for changing color
                        color: colorUnableToDeliverCare,
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                        //color: cardFunction(),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: const <Widget>[
                                Icon(FontAwesomeIcons.ban,
                                    size: 40.0, color: Colors.black),
                                SizedBox(height: 10),
                                Text('Unable to deliver care',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  'How did John Seem? (optional)',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //smileyIcon(color: iconColor1, icon: Icons.add),
                    IconButton(

                      //constraints: BoxConstraints(),
                      //padding: const EdgeInsets.only(top: 20, right: 50),
                      color: iconColor1,
                      onPressed: () {
                        setState(() {
                          if (iconColor1 == Colors.green) {
                            iconColor1 = Colors.grey;
                          } else {
                            iconColor1 = Colors.green;
                            iconColor2 = Colors.grey;
                            iconColor3 = Colors.grey;
                            iconColor4 = Colors.grey;
                            iconColor5 = Colors.grey;
                          }
                        });
                      },
                      icon: const Icon(
                          Icons.sentiment_very_dissatisfied_rounded,
                        size: 45,
                          ),
                    ),
                    IconButton(
                      // padding: const EdgeInsets.only(top: 20, right: 50),
                      color: iconColor2,
                      onPressed: () {
                        setState(() {
                          if (iconColor2 == Colors.green) {
                            iconColor2 = Colors.grey;
                          } else {
                            iconColor2 = Colors.green;
                            iconColor1 = Colors.grey;
                            iconColor3 = Colors.grey;
                            iconColor4 = Colors.grey;
                            iconColor5 = Colors.grey;
                          }
                        });
                      },
                      icon: const Icon(Icons.sentiment_dissatisfied, size: 45),
                    ),
                    IconButton(
                      //padding: const EdgeInsets.only(top: 20, right: 50),
                      color: iconColor3,
                      onPressed: () {
                        setState(() {
                          if (iconColor3 == Colors.green) {
                            iconColor3 = Colors.grey;
                          } else {
                            iconColor3 = Colors.green;
                            iconColor2 = Colors.grey;
                            iconColor4 = Colors.grey;
                            iconColor1 = Colors.grey;
                            iconColor5 = Colors.grey;
                          }
                        });
                      },
                      icon: const Icon(Icons.sentiment_neutral, size: 45),
                    ),
                    IconButton(
                      //padding: const EdgeInsets.only(top: 20, right: 50),
                      color: iconColor4,
                      onPressed: () {
                        setState(() {
                          if (iconColor4 == Colors.green) {
                            iconColor4 = Colors.grey;
                          } else {
                            iconColor4 = Colors.green;
                            iconColor2 = Colors.grey;
                            iconColor3 = Colors.grey;
                            iconColor1 = Colors.grey;
                            iconColor5 = Colors.grey;
                          }
                        });
                      },
                      icon: const Icon(Icons.sentiment_satisfied_alt, size: 45),
                    ),
                    IconButton(
                      //padding: const EdgeInsets.only(top: 20),
                      color: iconColor5,
                      onPressed: () {
                        setState(() {
                          if (iconColor5 == Colors.green) {
                            iconColor5 = Colors.grey;
                          } else {
                            iconColor5 = Colors.green;
                            iconColor2 = Colors.grey;
                            iconColor3 = Colors.grey;
                            iconColor4 = Colors.grey;
                            iconColor1 = Colors.grey;
                          }
                        });
                      },
                      icon:
                          const Icon(Icons.sentiment_very_satisfied, size: 45),
                    ),
                  ],
                ),
                const SizedBox(height: 75),
                const Text(
                  'Summary (optional)',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                const SizedBox(height: 15),
                const TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter a summary',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.warning_amber,
                        size: 35, color: Colors.red),
                    const SizedBox(width: 15),
                    const Text(
                      'Raise and alert for this report?',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 20),
                    Transform.scale(
                      scale: 1.5,
                      child: Radio(
                          activeColor: Theme.of(context).colorScheme.primary,
                          value: 1,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = 1;
                            });
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Check out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
