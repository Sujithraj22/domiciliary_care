import 'package:domiciliary_care/screens/patientreport.dart';
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


// Color colorMedication = Colors.green;
// Color colorBodyMap = Colors.green;
// Color colorFood = Colors.green;
// Color colorDrinks = Colors.green;
// Color colorPersonalCare = Colors.green;
// Color colorToliletAssistance = Colors.green;
// Color colorRepositioning = Colors.green;
// Color colorCompanionship = Colors.green;
// Color colorLaundry = Colors.green;
// Color colorGroceries = Colors.green;
// Color colorHousework = Colors.green;
// Color colorHouseholdChores = Colors.green;
// Color colorUnableToDeliverCare = Colors.green;

//bool requiredBool = true;
class VisitingScreen extends StatefulWidget {
  VisitingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  Color cardColora = Colors.yellow;
  Color cardColor = Colors.green;

  int selectedValue = 0;
  String msg = '';

  GestureDetector cardFunction(
    BuildContext context, {
    required String text1,
    required String text2,
    required Color cardColor,
    required IconData iconWork,
    required requiredBool,
  }) {
    //String text1 = 'demo';
    // text2 = '';
    // Color cardColor = Colors.green;
    //IconData iconWork = FontAwesomeIcons.pills;

    return GestureDetector(
      onTap: () async {
        final data = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => ResponsePage(workName: text1 + text2)),
          ),
        );
        //colorMedication = data;
        setState(() {
          //print(colorBodyMap);
          msg = data;
          //cardColora = data;
        });
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Card(
            //change to colorMedication for changing color
            color: cardColor,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: Colors.purple, width: 3.5),
            ),
            //color: cardFunction(),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(iconWork, size: 40.0, color: Colors.black),
                    SizedBox(height: 10),
                    Text(text1,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(text2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
            ),
          ),
          requiredCard(requiredBool: requiredBool),
        ],
      ),
    );
  }

  // required label function
  Visibility requiredCard({required requiredBool}) {
    return Visibility(
      visible: requiredBool,
      child: Card(
        color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text('Required', style: TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('reload');

    return SafeArea(
      child: Scaffold(
        //grid view
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'How have you helped John?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Text(msg),
                SizedBox(height: 15),
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: [
                    cardFunction(
                      context,
                      requiredBool: true,
                      text1: 'xyz',
                      text2: 'xyz',
                      cardColor: Colors.orange,
                      iconWork: Icons.home,
                    ),

                    cardFunction(context,
                        requiredBool: false,
                        text1: 'pqr',
                        text2: 'pqr',
                        cardColor: Colors.orange,
                        iconWork: Icons.home_mini),
                    //title: 'Medication', icon: FontAwesomeIcons.pills, color: colorMedication
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Medication',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.pills),
                    //title: 'Body Map', icon: FontAwesomeIcons.person, color: colorBodyMap
                    cardFunction(context,
                        requiredBool: true,
                        text1: 'Body Map',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.person),
                    //title: 'Food', icon: FontAwesomeIcons.utensils, color: colorFood
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Food',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.utensils),
                    //title: 'Drinks', icon: FontAwesomeIcons.mugSaucer,color: colorDrinks
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Drinks',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.mugSaucer),
                    //title: 'Personal care', icon: FontAwesomeIcons.bath,color: colorPersonalCare
                    cardFunction(context,
                        requiredBool: true,
                        text1: 'Personal care',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.bath),
                    //title: 'Toilet assistance', icon: FontAwesomeIcons.toilet,color: colorToliletAssistance
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Toilet assistance',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.toilet),
                    //title: 'Repositioning', icon: FontAwesomeIcons.bed,color: colorRepositioning
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Repositioning',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.bed),
                    //title: 'Companionship / respite care', icon: FontAwesomeIcons.peopleGroup,color: colorCompanionship
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Companionship /',
                        text2: ' respite care',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.peopleGroup),
                    //title: 'Laundry', icon: Icons.local_laundry_service_rounded,color: colorLaundry
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Laundry',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: Icons.local_laundry_service_rounded),
                    //title: 'Groceries', icon: FontAwesomeIcons.cartShopping,color: colorGroceries
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Groceries',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.cartShopping),
                    //title: 'Housework', icon: FontAwesomeIcons.broom,color: colorHousework
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Housework',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.broom),
                    //title: 'Household chores', icon: FontAwesomeIcons.screwdriverWrench,color: colorHouseholdChores
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Household chores',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.screwdriverWrench),
                    //title: 'Unable to deliver care', icon: FontAwesomeIcons.ban,color: colorUnableToDeliverCare
                    cardFunction(context,
                        requiredBool: false,
                        text1: 'Unable to deliver care',
                        text2: '',
                        cardColor: cardColor,
                        iconWork: FontAwesomeIcons.ban),
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  'How did John Seem? (optional)',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //smileyIcon(color: iconColor1, icon: Icons.add),
                    IconButton(
                      //raints: Boxraints(),
                      //padding:  EdgeInsets.only(top: 20, right: 50),
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
                      icon: Icon(
                        Icons.sentiment_very_dissatisfied_rounded,
                        size: 45,
                      ),
                    ),
                    IconButton(
                      // padding:  EdgeInsets.only(top: 20, right: 50),
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
                      icon: Icon(Icons.sentiment_dissatisfied, size: 45),
                    ),
                    IconButton(
                      //padding:  EdgeInsets.only(top: 20, right: 50),
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
                      icon: Icon(Icons.sentiment_neutral, size: 45),
                    ),
                    IconButton(
                      //padding:  EdgeInsets.only(top: 20, right: 50),
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
                      icon: Icon(Icons.sentiment_satisfied_alt, size: 45),
                    ),
                    IconButton(
                      //padding:  EdgeInsets.only(top: 20),
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
                      icon: Icon(Icons.sentiment_very_satisfied, size: 45),
                    ),
                  ],
                ),
                SizedBox(height: 75),
                Text(
                  'Summary (optional)',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                SizedBox(height: 15),
                TextField(
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
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.warning_amber, size: 35, color: Colors.red),
                    SizedBox(width: 15),
                    Text(
                      'Raise and alert for this report?',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(width: 20),
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
                SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () async{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReportPage()));
                  },
                  child: Text('Check out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
