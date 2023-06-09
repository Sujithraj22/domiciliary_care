import 'package:domiciliary_care/constants/color.dart';
import 'package:domiciliary_care/screens/visiting_screen.dart';
import 'package:flutter/material.dart';
import 'package:domiciliary_care/models/work.dart';

class ResponsePage extends StatelessWidget {
  final String workName;

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
                      Navigator.pop(context, colorMedication);
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
                  if (workName == 'Medication') {
                    colorMedication = Colors.red;
                  } else if(workName == 'Body Map'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Food'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Drinks'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Personal care'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Toilet assistance'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Repositioning'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Comanionship / respite care'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Laundry'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Groceries'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Housework'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Household chores'){

                    colorMedication = Colors.red;
                  }else if(workName == 'Unable to deliver care'){

                    colorMedication = Colors.red;
                  }

                  print(responseController.text);




                  Navigator.pop(context, colorMedication);

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
