import 'package:u20x_native/constants/color.dart';
import 'package:u20x_native/views/dc/visiting_screen.dart';
import 'package:flutter/material.dart';
//import 'package:u20x_native/models/workreport.dart';

class ResponsePage extends StatelessWidget {
  final String workName;
  String variableReport = 'hi';

  ResponsePage({Key? key, required this.workName}) : super(key: key);

  final responseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      workName,
                      //overflow: TextOverflow.visible,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // SizedBox(width: 40),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      // print('close button');
                      Navigator.pop(context, '');
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: responseController,
                keyboardType: TextInputType.text,
                maxLines: 27,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText:
                      'Please leave some notes about how you\'ve helped with this task',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  variableReport = responseController.text;
                  // if (workName == 'xyzxyz') {
                  //   cardColor = Colors.red;
                  // }
                  // else if (workName == 'pqrpqr') {
                  //   cardColor = Colors.red;
                  //   }

                  // else if (workName == 'Medication') {
                  //   colorMedication = Colors.red;
                  // } else if (workName == 'Body Map') {
                  //   colorBodyMap = Colors.red;
                  // } else if (workName == 'Food') {
                  //   colorFood = Colors.red;
                  // } else if (workName == 'Drinks') {
                  //   colorDrinks = Colors.red;
                  // } else if (workName == 'Personal care') {
                  //   colorPersonalCare = Colors.red;
                  // } else if (workName == 'Toilet assistance') {
                  //   colorToliletAssistance = Colors.red;
                  // } else if (workName == 'Repositioning') {
                  //   colorRepositioning = Colors.red;
                  // } else if (workName == 'Companionship / respite care') {
                  //   colorCompanionship = Colors.red;
                  // } else if (workName == 'Laundry') {
                  //   colorLaundry = Colors.red;
                  // } else if (workName == 'Groceries') {
                  //   colorGroceries = Colors.red;
                  // } else if (workName == 'Housework') {
                  //   colorHousework = Colors.red;
                  // } else if (workName == 'Household chores') {
                  //   colorHouseholdChores = Colors.red;
                  // } else if (workName == 'Unable to deliver care') {
                  //   colorUnableToDeliverCare = Colors.red;
                  // }

                  print(variableReport);

                  Navigator.pop(context, workName);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
