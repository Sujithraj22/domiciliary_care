import 'package:flutter/material.dart';

import '../models/smileyIcons.dart';
import '../models/work.dart';

Color iconColor1 = Colors.grey;
Color iconColor2 = Colors.grey;
Color iconColor3 = Colors.grey;
Color iconColor4 = Colors.grey;
Color iconColor5 = Colors.grey;

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
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
                  children: List.generate(works.length, (index) {
                    return SelectWork(work: works[index]);
                  }),
                ),
                const SizedBox(height: 50),
                const Text(
                  'How did John Seem? (optional)',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //smileyIcon(color: iconColor1, icon: Icons.add),
                    IconButton(
                      padding: const EdgeInsets.only(top: 20, right: 50),
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
                          size: 50),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(top: 20, right: 50),
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
                      icon: const Icon(Icons.sentiment_dissatisfied, size: 50),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(top: 20, right: 50),
                      color: iconColor3,
                      onPressed: () {
                        smileyFunciton();
                      },
                      icon: const Icon(Icons.sentiment_neutral, size: 50),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(top: 20, right: 50),
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
                            iconColor5 = Colors.grey;;
                          }
                        });
                      },
                      icon: const Icon(Icons.sentiment_satisfied_alt, size: 50),
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(top: 20),
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
                            iconColor1 = Colors.grey;;
                          }
                        });
                      },
                      icon:
                          const Icon(Icons.sentiment_very_satisfied, size: 50),
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

  void smileyFunciton() {
    return setState(() {
                        if (iconColor3 == Colors.green) {
                          iconColor3 = Colors.grey;
                        } else {
                          iconColor3 = Colors.green;
                          iconColor2 = Colors.grey;
                          iconColor1 = Colors.grey;
                          iconColor4 = Colors.grey;
                          iconColor5 = Colors.grey;;
                        }
                      });
  }
}
