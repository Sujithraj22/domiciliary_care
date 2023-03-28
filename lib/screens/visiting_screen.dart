import 'package:flutter/material.dart';

import '../models/work.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //grid view
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
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
                const SizedBox(height: 15),
                const Text(
                  'How did John Seem? (optional)',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        color: Colors.yellow,
                        onPressed: () {},
                        icon: const Icon(Icons.sentiment_very_dissatisfied_outlined,
                            size: 50),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sentiment_dissatisfied, size: 50),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sentiment_neutral, size: 50),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sentiment_satisfied_alt, size: 50),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.sentiment_very_satisfied, size: 50),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 45),
                const Text(
                  'Summary (optional)',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
                const SizedBox(height: 15),
                const TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter a summary',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.warning_amber, size: 35),
                    const SizedBox(width: 15),
                    const Text(
                      'Raise and alert for this report?',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 35),
                    Radio(
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = 1;
                          });
                        }),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    minimumSize: const Size.fromHeight(50),
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
