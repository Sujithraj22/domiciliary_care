import 'package:domiciliary_care/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  //Date
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Center(child: Text('John Doe\'s reports')),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Wednesday 22 Mar', style: TextStyle(
                        fontSize: 18,
                      )),
                    )),
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(

                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.arrow_circle_right_outlined),
                                  Text('10:32', style: TextStyle(
                                    fontSize: 18,
                                  )),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.arrow_circle_left_outlined),
                                  Text('18:52', style: TextStyle(
                                    fontSize: 18)),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.schedule_outlined),
                                  Text('18:52', style: TextStyle(
                                    fontSize: 18)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(thickness: 2, color: Colors.grey),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Text('Care workers:', style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18,
                                    )),
                                    Text('Rovin Reo', style: TextStyle(fontSize: 18),)
                                  ],
                                ),
                              ),
                              Container(
                                //padding: EdgeInsets.all(8),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Card(
                                     // margin: EdgeInsets.all(10),


                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(FontAwesomeIcons.pills, size: 26),
                                      ),
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(FontAwesomeIcons.person ,size: 26),
                                      ),
                                    ),
                                    Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(FontAwesomeIcons.utensils, size: 26),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
