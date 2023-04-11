import 'package:domiciliary_care/constants/color.dart';
import 'package:domiciliary_care/models/workreport.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../sections/sections.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  WorkReport worker = WorkReport();

  //Date
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Center(child: Text(worker.workerName + '\'s report')),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(worker.dateOfWork,
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    )),
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        //clockin clockout section
                        TimingWidget(),
                        VerticalDivider(thickness: 2, color: Colors.grey),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CareWorkersWidget(),
                              WorkerIconWidget(),
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
