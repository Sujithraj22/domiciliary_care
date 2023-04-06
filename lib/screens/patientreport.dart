import 'package:domiciliary_care/constants/color.dart';
import 'package:flutter/material.dart';

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
                      child: Text('Wednesday 22 Mar'),
                    )),
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('10:32'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.abc),
                                  Text('18:52'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.abc),
                                  Text('18:52'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(thickness: 2, color: Colors.grey),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text('Care workers:'),
                                  Text('Rovin Reo')
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Icon(Icons.add),
                                  ),
                                  Card(
                                    child: Icon(Icons.add),
                                  ),
                                  Card(
                                    child: Icon(Icons.add),
                                  ),
                                ],
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
