import 'package:domiciliary_care/constants/color.dart';
import 'package:domiciliary_care/screens/visiting_screen.dart';
import 'package:flutter/material.dart';

class ResponsePage extends StatelessWidget {
  final String workName;

   const ResponsePage({Key? key, required this.workName}) : super(key: key);

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
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),

                 // SizedBox(width: 40),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      // print('close button');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const VisitingScreen()),
                        ),
                      );
                    },
                    icon: const Icon(
                      
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              const TextField(
                keyboardType: TextInputType.text,
                maxLines: 27,
                decoration: InputDecoration(
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
