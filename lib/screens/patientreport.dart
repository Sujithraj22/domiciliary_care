//**********************Report page **************************

import 'package:domiciliary_care/constants/color.dart';
import 'package:domiciliary_care/models/workreport.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../sections/sections.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  WorkReport worker = WorkReport();
  int i = 0;

  //List<dynamic> users = [];

/*void initState(){
    super.initState();
    worker.fetchUsers();

  }*/

  //Date
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: worker.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: themeColor,
                title: Center(child: Text(worker.workerName + '\'s report')),
              ),
              body: ListView.builder(
                  itemCount: worker.workerReportData.length,
                  itemBuilder: (context, index) {
                    //final user = users[index];
                    //final email = user['email'];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (worker.workerReportData[index]["workData"] != null)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: worker
                                .workerReportData[index]["workData"].length,
                            itemBuilder: (BuildContext context, int subIndex) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
//

//Text(worker.workerReportData[i]["workData"][i]["clockInTime"]),
//Text(worker.workerReportData[i]["workData"][i]["clockInTime"]),

                                  subIndex > 0
                                      ? SizedBox()
                                      : Container(
                                          color: Colors.grey[300],
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
//date of work
                                            child: Text(
                                                worker.workerReportData[index]
                                                        ["dateOfWork"]
                                                    .toString(),
//worker.samplePosts[index].title.toString(),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                )),
                                          )),
                                  IntrinsicHeight(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          worker.workerReportData[index]
                                                          ["workData"][subIndex]
                                                          ["clockOutTime"]
                                                      .toString() ==
                                                  '-'
                                              ?
//clockin clockout section
                                              TimingWidget(
                                                  clockInTime: worker
                                                      .workerReportData[index]
                                                          ["workData"][subIndex]
                                                          ["clockInTime"]
                                                      .toString(),
                                                  clockOutTime: worker
                                                      .workerReportData[index]
                                                          ["workData"][subIndex]
                                                          ["clockOutTime"]
                                                      .toString(),
                                                  totalTime: 'Ongoing',
                                                )
                                              : TimingWidget(
                                                  clockInTime: worker
                                                      .workerReportData[index]
                                                          ["workData"][subIndex]
                                                          ["clockInTime"]
                                                      .toString(),
                                                  clockOutTime: worker
                                                      .workerReportData[index]
                                                          ["workData"][subIndex]
                                                          ["clockOutTime"]
                                                      .toString(),
                                                  totalTime: worker
                                                      .workerReportData[index]
                                                          ["workData"][subIndex]
                                                          ["totalTime"]
                                                      .toString(),
                                                ),
                                          worker.workerReportData[index]
                                                          ["workData"][subIndex]
                                                          ["clockOutTime"]
                                                      .toString() ==
                                                  '-'
                                              ? VerticalDivider(
                                                  thickness: 2,
                                                  color: Colors.green)
                                              : VerticalDivider(
                                                  thickness: 2,
                                                  color: Colors.grey),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CareWorkersWidget(
                                                    careWorkerName: worker
                                                        .workerReportData[index]
                                                            ["workData"]
                                                            [subIndex]
                                                            ["careWorkerName"]
                                                        .toString(),
                                                    careWorker: worker
                                                        .workerReportData[index]
                                                            ["workData"]
                                                            [subIndex]
                                                            ["careWorker"]
                                                        .toString(),
                                                  ),

                                                  Wrap(
//direction: Axis.vertical,

                                                    //@formatter:off
                                                  children: [
                                                    worker.workerReportData[index]["workData"][subIndex]["isMedication"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.prescriptionBottleMedical)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isBodyMap"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.person)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isFood"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.utensils)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isDrinks"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.mugSaucer)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isPersonalCare"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.bath)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isToiletAssistance"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.toilet)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isRepositioning"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.bed)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isCompanionshipRespitCare"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.peopleGroup)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isLaundry"] == true? WorkerIconWidget(iconData: Icons.local_laundry_service_rounded)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isGroceries"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.cartShopping)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isHousework"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.broom)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isHouseholdChores"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.screwdriverWrench)  : SizedBox() ,
                                                    worker.workerReportData[index]["workData"][subIndex]["isUnableToDeliverCare"] == true? WorkerIconWidget(iconData: FontAwesomeIcons.ban)  : SizedBox(),

                                                  ],)//worker.samplePosts[subIndex].id.toString()),
                                                  //@formatter:on
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),

                        //Text(worker.workerReportData[i]["workData"][i]["clockInTime"]),
                        //Text(worker.workerReportData[i]["workData"][i]["clockInTime"]),
                      ],
                    );
                  }),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
