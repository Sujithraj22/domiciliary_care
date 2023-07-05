//**********************Report page **************************

import 'package:u20x_native/constants/color.dart';
import 'package:u20x_native/model/workreport.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../api/api.dart';
import '../../model/care_worker_report.dart';

//import '../../model/jsonworkdata.dart';
import '../../sections/sections.dart';
import '../../util/constants.dart';

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
  late CareWorkerReport workerReport;
  late final Future<List<CareWorkerReport>> _workerReport;

  @override
  void initState() {
    super.initState();
    _workerReport = fetchWorkerReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Center(child: Text('hi' + '\'s report')),
      ),
      body: FutureBuilder<List<CareWorkerReport>>(
          future: _workerReport,
          builder: (BuildContext context,
              AsyncSnapshot<List<CareWorkerReport>> mCareWorkerReport) {
            switch (mCareWorkerReport.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(
                    color: kDC2Color,
                  ),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (mCareWorkerReport.hasError) {
                  return Center(
                      child: Text('Error: ${mCareWorkerReport.error}'));
                } else {
                  return ListView.builder(
                      itemCount: mCareWorkerReport.data!.length,
                      itemBuilder: (context, index) {
                        //final user = users[index];
                        //final email = user['email'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (mCareWorkerReport.data!.length != null)
                              ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount:
                                    mCareWorkerReport.data![index].data.length,
                                itemBuilder:
                                    (BuildContext context, int subIndex) {
                                  //print('${mCareWorkerReport.data![index].data![subIndex].taskCompleted?[subIndex]}');
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
//

//Text(worker.workerReportData[i]["workData"][i]["clockInTime"]),
//Text(worker.workerReportData[i]["workData"][i]["clockInTime"]),

                                      subIndex > 0
                                          ? SizedBox()
                                          : Container(
                                              color: Colors.grey[300],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
//date of work
                                                child: Text(
                                                    "${mCareWorkerReport.data![index].date}",
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
                                              mCareWorkerReport
                                                          .data![index]
                                                          .data![subIndex]
                                                          .endTime ==
                                                      ''
                                                  ?
//clockin clockout section
                                                  TimingWidget(
                                                      clockInTime:
                                                          mCareWorkerReport
                                                              .data![index]
                                                              .data![subIndex]
                                                              .startTime,
                                                      clockOutTime:
                                                          ' -',
                                                      totalTime: 'Ongoing',
                                                    )
                                                  : TimingWidget(
                                                      clockInTime:
                                                          mCareWorkerReport
                                                              .data![index]
                                                              .data![subIndex]
                                                              .startTime,
                                                      clockOutTime:
                                                          mCareWorkerReport
                                                              .data![index]
                                                              .data![subIndex]
                                                              .endTime,
                                                      totalTime:
                                                          mCareWorkerReport
                                                              .data![index]
                                                              .data![subIndex]
                                                              .totalTime,
                                                    ),
                                              mCareWorkerReport
                                                          .data![index]
                                                          .data![subIndex]
                                                          .endTime ==
                                                      ''
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CareWorkersWidget(
                                                          careWorkerName:
                                                              mCareWorkerReport
                                                                  .data![index]
                                                                  .data![
                                                                      subIndex]
                                                                  .careWorkerName,
                                                          careWorker:
                                                              'Care Worker'),

                                                      Wrap(
//direction: Axis.vertical,

                                                        //@formatter:off
                                                    children: [


                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(1)? WorkerIconWidget(iconData: FontAwesomeIcons.prescriptionBottleMedical)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(2)? WorkerIconWidget(iconData: FontAwesomeIcons.person)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(3)? WorkerIconWidget(iconData: FontAwesomeIcons.utensils)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(4)? WorkerIconWidget(iconData: FontAwesomeIcons.mugSaucer)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(5)? WorkerIconWidget(iconData: FontAwesomeIcons.bath)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(6)? WorkerIconWidget(iconData: FontAwesomeIcons.toilet)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(7)? WorkerIconWidget(iconData: FontAwesomeIcons.bed)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(8)? WorkerIconWidget(iconData: FontAwesomeIcons.peopleGroup)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(9)? WorkerIconWidget(iconData: Icons.local_laundry_service_rounded)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(10)? WorkerIconWidget(iconData: FontAwesomeIcons.cartShopping)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(11)? WorkerIconWidget(iconData: FontAwesomeIcons.broom)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(12)? WorkerIconWidget(iconData: FontAwesomeIcons.screwdriverWrench)  : SizedBox() ,
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(13)? WorkerIconWidget(iconData: FontAwesomeIcons.ban)  : SizedBox(),
                                                      mCareWorkerReport.data![index].data[subIndex].taskCompleted.contains(14)? WorkerIconWidget(iconData: Icons.warning_amber)  : SizedBox(),

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
                      });
                }
            }
          }),
    );
  }
}
