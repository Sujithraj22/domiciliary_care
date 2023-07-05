// import 'package:domiciliary_care/screens/patientreport.dart';
// import 'package:domiciliary_care/screens/response_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:u20x_native/model/care_worker_visit_type.dart';
import 'package:u20x_native/util/constants.dart';
import 'package:u20x_native/util/dc_help_type.dart';

//import 'package:u20x_native/views/dc/body_mapping.dart';
import 'package:u20x_native/views/dc/patientreport.dart';
import 'package:u20x_native/views/dc/response_screen.dart';
import 'package:u20x_native/views/dc/visit_types_screen.dart';

//import '../models/workreport.dart';

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
  bool isYes = false;
  TextEditingController _time = TextEditingController();
  TextEditingController variableSummary = TextEditingController();
  TextEditingController variableAlert = TextEditingController();
  String variable1 = 'hi';
  int variable2 = 1;
  List<RequiredTask> variable3 = [];
  String variableTime = '';
  String variableYesNo = 'No';
  String variableRank = '0';
  String workName = '';


  GestureDetector cardFunction(
    BuildContext context, {
    required String text1,
    required String text2,
    required Color cardColor,
    required IconData iconWork,
    required requiredBool,
    required helpType,
  }) {
    //String text1 = 'demo';
    // text2 = '';
    // Color cardColor = Colors.green;
    //IconData iconWork = FontAwesomeIcons.pills;
    helpType == DCHelpType.bodyMapping;

    return GestureDetector(
      onTap: () async {
        if (helpType == DCHelpType.bodyMapping) {
          // final data = await Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: ((context) => BodyMapping(workName: text1 + text2)
          //     ),
          //   ),
          // );
          // setState(() {
          //   msg = data;
          // });
        } else {
          final data = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => ResponsePage(workName: text1 + text2)),
            ),
          );
          setState(() {
            workName = data;
           // print($workName);
          });
        }
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
          child: Text(
            'Required',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('reload');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kDC1Color,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Visit '),
          centerTitle: true,
        ),
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'About your visit',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Visit type:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    showCursor: false,
                    readOnly: true,
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VisitTypesScreen(
                                    variable1: variable1,
                                  )));
                      if (result != null) {
                        setState(() {
                          variable1 = result['variable1'];
                          variable2 = result['variable2'];
                          variable3 = result['variable3'];
                          for (var item in variable3) {
                            print(item.taskId);
                          }
                        });
                      }
                    },
                    controller: TextEditingController(text: variable1),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixText: 'Edit',
                      suffixStyle: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You arrived at:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    showCursor: false,
                    readOnly: true,
                    controller: _time,
                    onTap: () async {
                      TimeOfDay selectedTime = TimeOfDay.now();
                      TimeOfDay? arrivalTime = await showTimePicker(
                          context: context, initialTime: selectedTime);
                      final hours =
                          arrivalTime?.hour.toString().padLeft(2, '0');
                      final minutes =
                          arrivalTime?.minute.toString().padLeft(2, '0');
                      _time.text = '$hours : $minutes';
                      if (hours == null || minutes == null) _time.clear();
                      variableTime = _time.text;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.purple),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixText: 'Edit',
                      suffixStyle: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Was there another care worker with you?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isYes = !isYes;
                            variableYesNo = 'NO';
                          });
                        },
                        color: Colors.purple,
                        icon: isYes
                            ? Icon(Icons.circle_outlined)
                            : Icon(Icons.check_circle)),
                    Text(
                      'No',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isYes = !isYes;
                            variableYesNo = 'YES';
                          });
                        },
                        color: Colors.purple,
                        icon: !isYes
                            ? Icon(Icons.circle_outlined)
                            : Icon(Icons.check_circle)),
                    Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
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
                    // cardFunction(
                    //   context,
                    //   requiredBool: true,
                    //   text1: 'xyz',
                    //   text2: 'xyz',
                    //   cardColor: Colors.orange,
                    //   iconWork: Icons.home,
                    // ),

                    // cardFunction(context,
                    //     requiredBool: false,
                    //     text1: 'pqr',
                    //     text2: 'pqr',
                    //     cardColor: Colors.orange,
                    //     iconWork: Icons.home_mini),
                    //title: 'Medication', icon: FontAwesomeIcons.pills, color: colorMedication
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('1')),
                        helpType: DCHelpType.medication,
                        text1: 'Medication',
                        text2: '',
                        cardColor: workName == 'Medication'? kDCBackColor : kDC4Color ,
                        iconWork: FontAwesomeIcons.prescriptionBottleMedical),
                    //title: 'Body Map', icon: FontAwesomeIcons.person, color: colorBodyMap
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('2')),
                        helpType: DCHelpType.bodyMapping,
                        text1: 'Body Map',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.person),
                    //title: 'Food', icon: FontAwesomeIcons.utensils, color: colorFood
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('3')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Food',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.utensils),
                    //title: 'Drinks', icon: FontAwesomeIcons.mugSaucer,color: colorDrinks
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('4')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Drinks',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.mugSaucer),
                    //title: 'Personal care', icon: FontAwesomeIcons.bath,color: colorPersonalCare
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('5')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Personal care',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.bath),
                    //title: 'Toilet assistance', icon: FontAwesomeIcons.toilet,color: colorToliletAssistance
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('6')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Toilet assistance',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.toilet),
                    //title: 'Repositioning', icon: FontAwesomeIcons.bed,color: colorRepositioning
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('7')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Repositioning',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.bed),
                    //title: 'Companionship / respite care', icon: FontAwesomeIcons.peopleGroup,color: colorCompanionship
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('8')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Companionship /',
                        text2: ' respite care',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.peopleGroup),
                    //title: 'Laundry', icon: Icons.local_laundry_service_rounded,color: colorLaundry
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('9')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Laundry',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: Icons.local_laundry_service_rounded),
                    //title: 'Groceries', icon: FontAwesomeIcons.cartShopping,color: colorGroceries
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('10')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Groceries',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.cartShopping),
                    //title: 'Housework', icon: FontAwesomeIcons.broom,color: colorHousework
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('11')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Housework',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.broom),
                    //title: 'Household chores', icon: FontAwesomeIcons.screwdriverWrench,color: colorHouseholdChores
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('12')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Household chores',
                        text2: '',
                        cardColor: kDC4Color,
                        iconWork: FontAwesomeIcons.screwdriverWrench),
                    //title: 'Unable to deliver care', icon: FontAwesomeIcons.ban,color: colorUnableToDeliverCare
                    cardFunction(context,
                        requiredBool: variable3.any(
                            (item) => item.taskId.toString().contains('13')),
                        helpType: DCHelpType.generalNote,
                        text1: 'Unable to deliver care',
                        text2: '',
                        cardColor: kDC4Color,
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
                            variableRank = "0";
                          } else {
                            iconColor1 = Colors.green;
                            iconColor2 = Colors.grey;
                            iconColor3 = Colors.grey;
                            iconColor4 = Colors.grey;
                            iconColor5 = Colors.grey;
                            variableRank = "1";
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
                            variableRank = "0";
                          } else {
                            iconColor2 = Colors.green;
                            iconColor1 = Colors.grey;
                            iconColor3 = Colors.grey;
                            iconColor4 = Colors.grey;
                            iconColor5 = Colors.grey;
                            variableRank = "2";
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
                            variableRank = "0";
                          } else {
                            iconColor3 = Colors.green;
                            iconColor2 = Colors.grey;
                            iconColor4 = Colors.grey;
                            iconColor1 = Colors.grey;
                            iconColor5 = Colors.grey;
                            variableRank = "3";
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
                            variableRank = "0";
                          } else {
                            iconColor4 = Colors.green;
                            iconColor2 = Colors.grey;
                            iconColor3 = Colors.grey;
                            iconColor1 = Colors.grey;
                            iconColor5 = Colors.grey;
                            variableRank = "4";
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
                            variableRank = "0";
                          } else {
                            iconColor5 = Colors.green;
                            iconColor2 = Colors.grey;
                            iconColor3 = Colors.grey;
                            iconColor4 = Colors.grey;
                            iconColor1 = Colors.grey;
                            variableRank = "5";
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
                  controller: variableSummary,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter a summary',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: kDC3Color),
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
                          activeColor: kDC3Color,
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
                SizedBox(height: 20),
                Visibility(

                  child: selectedValue == 1? Column(
                    children: [
                      Text(
                        'Why are you raising this alert?(required)',
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        maxLines: 8,
                        controller: variableAlert,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Leave notes about this alert',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),

                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ): SizedBox(height: 30),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kDC3Color,
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ReportPage()));
                    saveVisitDetails();
                    setState(() {

                    });
                  },
                  child: Text('Check out'),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveVisitDetails() {
    print('Id is $variable2');
    print("Visit type is $variable1");
    print('Time is $variableTime');
    print('You select $variableYesNo');
    print('Rank is $variableRank');
    print('Summary - ${variableSummary.text}');
    print('Summary - ${variableAlert.text}');
    //print('Report - $variableReport');
  }
}
